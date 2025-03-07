// Copyright 2021 Google LLC
// SPDX-License-Identifier: Apache-2.0
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

// Normal include guard for target-independent parts
#ifndef HIGHWAY_HWY_CONTRIB_SORT_ALGO_INL_H_
#define HIGHWAY_HWY_CONTRIB_SORT_ALGO_INL_H_

#include <stdint.h>
#include <string.h>  // memcpy

#include <algorithm>
#include <cmath>  // std::abs
#include <vector>
#include <random>

#include "hwy/base.h"
#include "hwy/contrib/sort/vqsort.h"

// Third-party algorithms
#define HAVE_AVX2SORT 0
#define HAVE_IPS4O 0
// When enabling, consider changing max_threads (required for Table 1a)
#define HAVE_PARALLEL_IPS4O (HAVE_IPS4O && 1)
#define HAVE_PDQSORT 0
#define HAVE_SORT512 0
#define HAVE_VXSORT 0

#if HAVE_AVX2SORT
HWY_PUSH_ATTRIBUTES("avx2,avx")
#include "avx2sort.h"
HWY_POP_ATTRIBUTES
#endif
#if HAVE_IPS4O || HAVE_PARALLEL_IPS4O
#include "third_party/ips4o/include/ips4o.hpp"
#include "third_party/ips4o/include/ips4o/thread_pool.hpp"
#endif
#if HAVE_PDQSORT
#include "third_party/boost/allowed/sort/sort.hpp"
#endif
#if HAVE_SORT512
#include "sort512.h"
#endif

// vxsort is difficult to compile for multiple targets because it also uses
// .cpp files, and we'd also have to #undef its include guards. Instead, compile
// only for AVX2 or AVX3 depending on this macro.
#define VXSORT_AVX3 1
#if HAVE_VXSORT
// inlined from vxsort_targets_enable_avx512 (must close before end of header)
#ifdef __GNUC__
#ifdef __clang__
#if VXSORT_AVX3
#pragma clang attribute push(__attribute__((target("avx512f,avx512dq"))), \
                             apply_to = any(function))
#else
#pragma clang attribute push(__attribute__((target("avx2"))), \
                             apply_to = any(function))
#endif  // VXSORT_AVX3

#else
#pragma GCC push_options
#if VXSORT_AVX3
#pragma GCC target("avx512f,avx512dq")
#else
#pragma GCC target("avx2")
#endif  // VXSORT_AVX3
#endif
#endif

#if VXSORT_AVX3
#include "vxsort/machine_traits.avx512.h"
#else
#include "vxsort/machine_traits.avx2.h"
#endif  // VXSORT_AVX3
#include "vxsort/vxsort.h"
#ifdef __GNUC__
#ifdef __clang__
#pragma clang attribute pop
#else
#pragma GCC pop_options
#endif
#endif
#endif  // HAVE_VXSORT

namespace hwy {

enum class Dist {
       	kUniform8, 
	kUniform16, 
	kUniform32,
	kUniform64,
	kSame,
	kSorted,
	kRevSorted,
	kAlmostSorted,
	kPareto,
	kParetoB2B,
	kParetoShuff,
	kFib,
	kNormal,
	kUniformDouble,
	kWorstCaseQs
};

static inline std::vector<Dist> AllDist() {
  return {/*Dist::kUniform8, Dist::kUniform16,*/ 
     Dist::kUniform32, 
    // Dist::kSame,
    // Dist::kSorted, 
    // Dist::kRevSorted, 
    // Dist::kAlmostSorted,
    // Dist::kPareto,
    // Dist::kParetoB2B,
    // Dist::kParetoShuff,
    // Dist::kFib,
    // Dist::kNormal,
    // Dist::kUniformDouble,
    // Dist::kWorstCaseQs,
  };
}

static inline const char* DistName(Dist dist) {
  switch (dist) {
    case Dist::kUniform8:
      return "uniform8";
    case Dist::kUniform16:
      return "uniform16";
    case Dist::kUniform32:
      return "uniform32";
    case Dist::kUniform64:
      return "uniform64";
    case Dist::kSame:
      return "same";
	  case Dist::kSorted:
      return "sorted";
	  case Dist::kRevSorted:
      return "rev-sorted";
	  case Dist::kAlmostSorted:
      return "almost-sorted";
	  case Dist::kPareto:
      return "pareto";
	  case Dist::kParetoB2B:
      return "pareto-b2b";
	  case Dist::kParetoShuff:
      return "pareto-shuff";
	  case Dist::kFib:
      return "fib";
	  case Dist::kNormal:
      return "normal";
	  case Dist::kUniformDouble:
      return "unif-double";
	  case Dist::kWorstCaseQs:
      return "worst-case-qs";
  }
  return "unreachable";
}

template <typename T>
class InputStats {
 public:
  void Notify(T value) {
    min_ = std::min(min_, value);
    max_ = std::max(max_, value);
    // Converting to integer would truncate floats, multiplying to save digits
    // risks overflow especially when casting, so instead take the sum of the
    // bit representations as the checksum.
    uint64_t bits = 0;
    static_assert(sizeof(T) <= 8, "Expected a built-in type");
    CopyBytes<sizeof(T)>(&value, &bits);
    sum_ += bits;
    count_ += 1;
  }

  bool operator==(const InputStats& other) const {
    if (count_ != other.count_) {
      HWY_ABORT("count %d vs %d\n", static_cast<int>(count_),
                static_cast<int>(other.count_));
    }

    if (min_ != other.min_ || max_ != other.max_) {
      HWY_ABORT("minmax %f/%f vs %f/%f\n", static_cast<double>(min_),
                static_cast<double>(max_), static_cast<double>(other.min_),
                static_cast<double>(other.max_));
    }

    // Sum helps detect duplicated/lost values
    if (sum_ != other.sum_) {
      HWY_ABORT("Sum mismatch %g %g; min %g max %g\n",
                static_cast<double>(sum_), static_cast<double>(other.sum_),
                static_cast<double>(min_), static_cast<double>(max_));
    }

    return true;
  }

 private:
  T min_ = hwy::HighestValue<T>();
  T max_ = hwy::LowestValue<T>();
  uint64_t sum_ = 0;
  size_t count_ = 0;
};

enum class Algo {
#if HAVE_AVX2SORT
  kSEA,
#endif
#if HAVE_IPS4O
  kIPS4O,
#endif
#if HAVE_PARALLEL_IPS4O
  kParallelIPS4O,
#endif
#if HAVE_PDQSORT
  kPDQ,
#endif
#if HAVE_SORT512
  kSort512,
#endif
#if HAVE_VXSORT
  kVXSort,
#endif
  kStd,
  kVQSort,
  kHeap,
};

const char* AlgoName(Algo algo) {
  switch (algo) {
#if HAVE_AVX2SORT
    case Algo::kSEA:
      return "sea";
#endif
#if HAVE_IPS4O
    case Algo::kIPS4O:
      return "ips4o";
#endif
#if HAVE_PARALLEL_IPS4O
    case Algo::kParallelIPS4O:
      return "par_ips4o";
#endif
#if HAVE_PDQSORT
    case Algo::kPDQ:
      return "pdq";
#endif
#if HAVE_SORT512
    case Algo::kSort512:
      return "sort512";
#endif
#if HAVE_VXSORT
    case Algo::kVXSort:
      return "vxsort";
#endif
    case Algo::kStd:
      return "std";
    case Algo::kVQSort:
      return "vq";
    case Algo::kHeap:
      return "heap";
  }
  return "unreachable";
}

}  // namespace hwy
#endif  // HIGHWAY_HWY_CONTRIB_SORT_ALGO_INL_H_

// Per-target
#if defined(HIGHWAY_HWY_CONTRIB_SORT_ALGO_TOGGLE) == \
    defined(HWY_TARGET_TOGGLE)
#ifdef HIGHWAY_HWY_CONTRIB_SORT_ALGO_TOGGLE
#undef HIGHWAY_HWY_CONTRIB_SORT_ALGO_TOGGLE
#else
#define HIGHWAY_HWY_CONTRIB_SORT_ALGO_TOGGLE
#endif

#include "hwy/contrib/sort/traits-inl.h"
#include "hwy/contrib/sort/traits128-inl.h"
#include "hwy/contrib/sort/vqsort-inl.h"  // HeapSort
#include "hwy/tests/test_util-inl.h"

HWY_BEFORE_NAMESPACE();
namespace hwy {
namespace HWY_NAMESPACE {

class Xorshift128Plus {
  static HWY_INLINE uint64_t SplitMix64(uint64_t z) {
    z = (z ^ (z >> 30)) * 0xBF58476D1CE4E5B9ull;
    z = (z ^ (z >> 27)) * 0x94D049BB133111EBull;
    return z ^ (z >> 31);
  }

 public:
  // Generates two vectors of 64-bit seeds via SplitMix64 and stores into
  // `seeds`. Generating these afresh in each ChoosePivot is too expensive.
  template <class DU64>
  static void GenerateSeeds(DU64 du64, TFromD<DU64>* HWY_RESTRICT seeds) {
    seeds[0] = SplitMix64(0x9E3779B97F4A7C15ull);
    for (size_t i = 1; i < 2 * Lanes(du64); ++i) {
      seeds[i] = SplitMix64(seeds[i - 1]);
    }
  }

  // Need to pass in the state because vector cannot be class members.
  template <class DU64>
  static Vec<DU64> RandomBits(DU64 /* tag */, Vec<DU64>& state0,
                              Vec<DU64>& state1) {
    Vec<DU64> s1 = state0;
    Vec<DU64> s0 = state1;
    const Vec<DU64> bits = Add(s1, s0);
    state0 = s0;
    s1 = Xor(s1, ShiftLeft<23>(s1));
    state1 = Xor(s1, Xor(s0, Xor(ShiftRight<18>(s1), ShiftRight<5>(s0))));
    return bits;
  }
};

template <typename T, class DU64, HWY_IF_NOT_FLOAT(T)>
Vec<DU64> RandomValues(DU64 du64, Vec<DU64>& s0, Vec<DU64>& s1,
                       const Vec<DU64> mask) {
  const Vec<DU64> bits = Xorshift128Plus::RandomBits(du64, s0, s1);
  return And(bits, mask);
}

// Important to avoid denormals, which are flushed to zero by SIMD but not
// scalar sorts, and NaN, which may be ordered differently in scalar vs. SIMD.
template <typename T, class DU64, HWY_IF_FLOAT(T)>
Vec<DU64> RandomValues(DU64 du64, Vec<DU64>& s0, Vec<DU64>& s1,
                       const Vec<DU64> mask) {
  const Vec<DU64> bits = Xorshift128Plus::RandomBits(du64, s0, s1);
  const Vec<DU64> values = And(bits, mask);
#if HWY_TARGET == HWY_SCALAR  // Cannot repartition u64 to i32
  const RebindToSigned<DU64> di;
#else
  const Repartition<MakeSigned<T>, DU64> di;
#endif
  const RebindToFloat<decltype(di)> df;
  const RebindToUnsigned<decltype(di)> du;
  const auto k1 = BitCast(du64, Set(df, T{1.0}));
  const auto mantissa = BitCast(du64, Set(du, MantissaMask<T>()));
  // Avoid NaN/denormal by converting from (range-limited) integer.
  const Vec<DU64> no_nan = OrAnd(k1, values, mantissa);
  return BitCast(du64, ConvertTo(df, BitCast(di, no_nan)));
}

template <class DU64>
Vec<DU64> MaskForDist(DU64 du64, const Dist dist, size_t sizeof_t) {
  switch (sizeof_t) {
    case 2:
      return Set(du64, (dist == Dist::kUniform8) ? 0x00FF00FF00FF00FFull
                                                 : 0xFFFFFFFFFFFFFFFFull);
    case 4:
      return Set(du64, (dist == Dist::kUniform8)    ? 0x000000FF000000FFull
                       : (dist == Dist::kUniform16) ? 0x0000FFFF0000FFFFull
                                                    : 0xFFFFFFFFFFFFFFFFull);
    case 8:
      return Set(du64, (dist == Dist::kUniform8)    ? 0x00000000000000FFull
                       : (dist == Dist::kUniform16) ? 0x000000000000FFFFull
                                                    : 0x00000000FFFFFFFFull);
    default:
      HWY_ABORT("Logic error");
      return Zero(du64);
  }
}

template <typename T>
InputStats<T> GenerateInput(const Dist dist, T* v, size_t num) {
#define ARIF_EDIT
#define _min(a, b) ((a) <= (b) ? (a) : (b))
  
#ifdef ARIF_EDIT
  InputStats<T> input_stats;

  // ** NOTE: the following is only intended for uint32 and uint64

  if (dist == Dist::kUniform32 || dist == Dist::kSorted || dist == Dist::kRevSorted || dist == Dist::kAlmostSorted) {
    std::mt19937_64 g;
    std::uniform_int_distribution<uint64_t> d;
    for (size_t i = 0; i < num; ++i) 
      v[i] = d(g);
  
    if (dist == Dist::kSorted) std::sort(v, v + num);
    else if (dist == Dist::kRevSorted) std::sort(v, v + num, std::greater<T>());
    else if (dist == Dist::kAlmostSorted) {
      std::sort(v, v + num);
      for (size_t i = 0; i < num; i += 7) 
        v[i] = UINT64_MAX;
    }
  } 
  else if (dist == Dist::kSame) {
      std::mt19937_64 g;
      std::uniform_int_distribution<uint64_t> d;
      uint64_t x = d(g);
      for (size_t i = 0; i < num; ++i) 
        v[i] = x;
  }
  else if (dist == Dist::kPareto || dist == Dist::kParetoB2B || dist == Dist::kParetoShuff) {
    uint64_t a = 6364136223846793005, c = 1442695040888963407, x = 1;
    double ED = 20;
    double alpha = 1, beta = 7;
    uint64_t sum = 0, Items = 0, y = 889;
    uint64_t maxF = 0;

    for (size_t i = 0; i < num; ) {
      x = x * a + c;
      y = y * a + c;

      // generate frequency from the Pareto distribution with alpha=1; otherwise, the generator gets slow
      double u = (double)y / ((double)(1LLU << 63) * 2);			// uniform [0,1]
      uint64_t f = _min(ceil(beta * (1 / (1 - u) - 1)), 10000);		// rounded-up Pareto

      if (dist == Dist::kParetoB2B || dist == Dist::kParetoShuff) {
        if (i + f < num) {
          for (size_t j = 0; j < f; ++j) v[i + j] = x;
          i += f;
        }
        else if (i + 10 >= num) {
          while (i < num) v[i++] = x;
        }
      }
      else if (dist == Dist::kPareto) v[i++] = f;
    }

    // shuffle
    if (dist == Dist::kParetoShuff) {
      std::random_device rd;
      std::mt19937_64 g(rd());
      std::shuffle(v, v + num, g);
    }
  }
  else if (dist == Dist::kWorstCaseQs) {
    uint32_t aLCG = 214013, cLCG = 2531011, x = 289;
    uint32_t k = UINT32_MAX;
    for (size_t i = 0; i < num; i++) {
      //x = x * aLCG + cLCG;
      //double u = (double)x / 0xffffffff;
      //if (u < 0.92) v[i] = num;
      //else if (u < 0.94) v[i] = i * i;
      //else v[i] = num - i;
      //else v[i] = k--;
      // else v[i] = i;
    }
    uint32_t i = 0;
    k = num;
    for (; i < 60; ++i) v[i] = i / 2;
    for (; i < num * 0.7; ++i) v[i] = num;
    for (; i < num; ++i) v[i] = --k;
    //for (; i < num * 0.92; ++i) v[i] = num;
    //for (; i < num; ++i) v[i] = i;

    //printf("Input shuffling\n");
    std::random_device rd;
		std::mt19937 g(rd());
    std::shuffle(v, v + num, g);

    //for (size_t i = 0; i < 100; ++i) printf("%lu ", v[i]); printf("\n");
    //printf("%lu\n", k);

  }
  else if (dist == Dist::kFib) {
    uint64_t a = 0, b = 1, c;
    v[0] = 0; v[1] = 1;
		uint64_t i = 2;	
    while (i < num) {
      c = a + b;
      if (c < b) {	// overflow
        a = 0; b = 1;
        v[i++] = 0;
        if (i < num) v[i++] = 1;
      }
      else {
        a = b;
        b = c;
        v[i++] = b;
      }
    }
  }
  else if (dist == Dist::kNormal) {
    if constexpr (std::is_same<T, uint32_t>::value) {
      uint32_t miu = UINT32_MAX >> 1;
			uint32_t sigma = (UINT32_MAX >> 1) / 3;
			std::mt19937 gen;
			std::normal_distribution<> dis(miu, sigma);
			for (size_t i = 0; i < num; ++i)
					v[i] = std::round(dis(gen));
    }
    else if constexpr (std::is_same<T, uint64_t>::value) {
      uint64_t miu = UINT64_MAX >> 1;
			uint64_t sigma = (UINT64_MAX >> 1) / 3;
			std::mt19937_64 gen;
			std::normal_distribution<> dis(miu, sigma);
			for (size_t i = 0; i < num; ++i)
					v[i] = std::round(dis(gen));
    }
  }
  else if (dist == Dist::kUniformDouble) {
    if constexpr (std::is_same<T, uint32_t>::value) {
				float* p = (float*)v;
				std::uniform_real_distribution<float> dis(0.0, FLT_MAX);
				std::mt19937 gen;
				for (size_t i = 0; i < num; ++i)
					p[i] = dis(gen);
			}
			else if constexpr (std::is_same<T, uint64_t>::value) {
				double* p = (double*)v;
				std::uniform_real_distribution<double> dis(0.0, DBL_MAX);
				std::mt19937_64 gen;
				for (size_t i = 0; i < num; ++i)
					p[i] = dis(gen);
			}
  }
  else {
    HWY_ABORT("Unsupported dist");
    return input_stats;
  }

#else 
  SortTag<uint64_t> du64;
  using VU64 = Vec<decltype(du64)>;
  const size_t N64 = Lanes(du64);
  auto buf = hwy::AllocateAligned<uint64_t>(2 * N64);
  Xorshift128Plus::GenerateSeeds(du64, buf.get());
  auto s0 = Load(du64, buf.get());
  auto s1 = Load(du64, buf.get() + N64);

  const VU64 mask = MaskForDist(du64, dist, sizeof(T));

  const Repartition<T, decltype(du64)> d;
  const size_t N = Lanes(d);
  size_t i = 0;
  for (; i + N <= num; i += N) {
    const VU64 bits = RandomValues<T>(du64, s0, s1, mask);
#if HWY_ARCH_RVV || (HWY_TARGET == HWY_NEON && HWY_ARCH_ARM_V7)
    // v may not be 64-bit aligned
    StoreU(bits, du64, buf.get());
    memcpy(v + i, buf.get(), N64 * sizeof(uint64_t));
#else
    StoreU(bits, du64, reinterpret_cast<uint64_t*>(v + i));
#endif
  }
  if (i < num) {
    const VU64 bits = RandomValues<T>(du64, s0, s1, mask);
    StoreU(bits, du64, buf.get());
    memcpy(v + i, buf.get(), (num - i) * sizeof(T));
  }
#endif

  for (size_t i = 0; i < num; ++i) {
    input_stats.Notify(v[i]);
  }
  return input_stats;
}

struct ThreadLocal {
  Sorter sorter;
};

struct SharedState {
#if HAVE_PARALLEL_IPS4O
  const unsigned max_threads = hwy::LimitsMax<unsigned>();  // 16 for Table 1a
  ips4o::StdThreadPool pool{static_cast<int>(
      HWY_MIN(max_threads, std::thread::hardware_concurrency() / 2))};
#endif
  std::vector<ThreadLocal> tls{1};
};

// Bridge from keys (passed to Run) to lanes as expected by HeapSort. For
// non-128-bit keys they are the same:
template <class Order, typename KeyType, HWY_IF_NOT_LANE_SIZE(KeyType, 16)>
void CallHeapSort(KeyType* HWY_RESTRICT keys, const size_t num_keys) {
  using detail::TraitsLane;
  using detail::SharedTraits;
  if (Order().IsAscending()) {
    const SharedTraits<TraitsLane<detail::OrderAscending<KeyType>>> st;
    return detail::HeapSort(st, keys, num_keys);
  } else {
    const SharedTraits<TraitsLane<detail::OrderDescending<KeyType>>> st;
    return detail::HeapSort(st, keys, num_keys);
  }
}

#if VQSORT_ENABLED
template <class Order>
void CallHeapSort(hwy::uint128_t* HWY_RESTRICT keys, const size_t num_keys) {
  using detail::SharedTraits;
  using detail::Traits128;
  uint64_t* lanes = reinterpret_cast<uint64_t*>(keys);
  const size_t num_lanes = num_keys * 2;
  if (Order().IsAscending()) {
    const SharedTraits<Traits128<detail::OrderAscending128>> st;
    return detail::HeapSort(st, lanes, num_lanes);
  } else {
    const SharedTraits<Traits128<detail::OrderDescending128>> st;
    return detail::HeapSort(st, lanes, num_lanes);
  }
}

template <class Order>
void CallHeapSort(K64V64* HWY_RESTRICT keys, const size_t num_keys) {
  using detail::SharedTraits;
  using detail::Traits128;
  uint64_t* lanes = reinterpret_cast<uint64_t*>(keys);
  const size_t num_lanes = num_keys * 2;
  if (Order().IsAscending()) {
    const SharedTraits<Traits128<detail::OrderAscendingKV128>> st;
    return detail::HeapSort(st, lanes, num_lanes);
  } else {
    const SharedTraits<Traits128<detail::OrderDescendingKV128>> st;
    return detail::HeapSort(st, lanes, num_lanes);
  }
}
#endif  // VQSORT_ENABLED

template <class Order, typename KeyType>
void Run(Algo algo, KeyType* HWY_RESTRICT inout, size_t num,
         SharedState& shared, size_t thread) {
  const std::less<KeyType> less;
  const std::greater<KeyType> greater;

  switch (algo) {
#if HAVE_AVX2SORT
    case Algo::kSEA:
      return avx2::quicksort(inout, static_cast<int>(num));
#endif

#if HAVE_IPS4O
    case Algo::kIPS4O:
      if (Order().IsAscending()) {
        return ips4o::sort(inout, inout + num, less);
      } else {
        return ips4o::sort(inout, inout + num, greater);
      }
#endif

#if HAVE_PARALLEL_IPS4O
    case Algo::kParallelIPS4O:
      if (Order().IsAscending()) {
        return ips4o::parallel::sort(inout, inout + num, less, shared.pool);
      } else {
        return ips4o::parallel::sort(inout, inout + num, greater, shared.pool);
      }
#endif

#if HAVE_SORT512
    case Algo::kSort512:
      HWY_ABORT("not supported");
      //    return Sort512::Sort(inout, num);
#endif

#if HAVE_PDQSORT
    case Algo::kPDQ:
      if (Order().IsAscending()) {
        return boost::sort::pdqsort_branchless(inout, inout + num, less);
      } else {
        return boost::sort::pdqsort_branchless(inout, inout + num, greater);
      }
#endif

#if HAVE_VXSORT
    case Algo::kVXSort: {
#if (VXSORT_AVX3 && HWY_TARGET != HWY_AVX3) || \
    (!VXSORT_AVX3 && HWY_TARGET != HWY_AVX2)
      fprintf(stderr, "Do not call for target %s\n",
              hwy::TargetName(HWY_TARGET));
      return;
#else
#if VXSORT_AVX3
      vxsort::vxsort<KeyType, vxsort::AVX512> vx;
#else
      vxsort::vxsort<KeyType, vxsort::AVX2> vx;
#endif
      if (Order().IsAscending()) {
        return vx.sort(inout, inout + num - 1);
      } else {
        fprintf(stderr, "Skipping VX - does not support descending order\n");
        return;
      }
#endif  // enabled for this target
    }
#endif  // HAVE_VXSORT

    case Algo::kStd:
      if (Order().IsAscending()) {
        return std::sort(inout, inout + num, less);
      } else {
        return std::sort(inout, inout + num, greater);
      }

    case Algo::kVQSort:
      return shared.tls[thread].sorter(inout, num, Order());

    case Algo::kHeap:
      return CallHeapSort<Order>(inout, num);

    default:
      HWY_ABORT("Not implemented");
  }
}

// NOLINTNEXTLINE(google-readability-namespace-comments)
}  // namespace HWY_NAMESPACE
}  // namespace hwy
HWY_AFTER_NAMESPACE();

#endif  // HIGHWAY_HWY_CONTRIB_SORT_ALGO_TOGGLE
