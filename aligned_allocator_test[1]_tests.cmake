add_test( AlignedAllocatorTest.FreeNullptr /home/arif/Research/highway-vqsort/tests/aligned_allocator_test [==[--gtest_filter=AlignedAllocatorTest.FreeNullptr]==] --gtest_also_run_disabled_tests)
set_tests_properties( AlignedAllocatorTest.FreeNullptr PROPERTIES WORKING_DIRECTORY /home/arif/Research/highway-vqsort)
add_test( AlignedAllocatorTest.Log2 /home/arif/Research/highway-vqsort/tests/aligned_allocator_test [==[--gtest_filter=AlignedAllocatorTest.Log2]==] --gtest_also_run_disabled_tests)
set_tests_properties( AlignedAllocatorTest.Log2 PROPERTIES WORKING_DIRECTORY /home/arif/Research/highway-vqsort)
add_test( AlignedAllocatorTest.Overflow /home/arif/Research/highway-vqsort/tests/aligned_allocator_test [==[--gtest_filter=AlignedAllocatorTest.Overflow]==] --gtest_also_run_disabled_tests)
set_tests_properties( AlignedAllocatorTest.Overflow PROPERTIES WORKING_DIRECTORY /home/arif/Research/highway-vqsort)
add_test( AlignedAllocatorTest.AllocDefaultPointers /home/arif/Research/highway-vqsort/tests/aligned_allocator_test [==[--gtest_filter=AlignedAllocatorTest.AllocDefaultPointers]==] --gtest_also_run_disabled_tests)
set_tests_properties( AlignedAllocatorTest.AllocDefaultPointers PROPERTIES WORKING_DIRECTORY /home/arif/Research/highway-vqsort)
add_test( AlignedAllocatorTest.EmptyAlignedUniquePtr /home/arif/Research/highway-vqsort/tests/aligned_allocator_test [==[--gtest_filter=AlignedAllocatorTest.EmptyAlignedUniquePtr]==] --gtest_also_run_disabled_tests)
set_tests_properties( AlignedAllocatorTest.EmptyAlignedUniquePtr PROPERTIES WORKING_DIRECTORY /home/arif/Research/highway-vqsort)
add_test( AlignedAllocatorTest.EmptyAlignedFreeUniquePtr /home/arif/Research/highway-vqsort/tests/aligned_allocator_test [==[--gtest_filter=AlignedAllocatorTest.EmptyAlignedFreeUniquePtr]==] --gtest_also_run_disabled_tests)
set_tests_properties( AlignedAllocatorTest.EmptyAlignedFreeUniquePtr PROPERTIES WORKING_DIRECTORY /home/arif/Research/highway-vqsort)
add_test( AlignedAllocatorTest.CustomAlloc /home/arif/Research/highway-vqsort/tests/aligned_allocator_test [==[--gtest_filter=AlignedAllocatorTest.CustomAlloc]==] --gtest_also_run_disabled_tests)
set_tests_properties( AlignedAllocatorTest.CustomAlloc PROPERTIES WORKING_DIRECTORY /home/arif/Research/highway-vqsort)
add_test( AlignedAllocatorTest.MakeUniqueAlignedDefaultConstructor /home/arif/Research/highway-vqsort/tests/aligned_allocator_test [==[--gtest_filter=AlignedAllocatorTest.MakeUniqueAlignedDefaultConstructor]==] --gtest_also_run_disabled_tests)
set_tests_properties( AlignedAllocatorTest.MakeUniqueAlignedDefaultConstructor PROPERTIES WORKING_DIRECTORY /home/arif/Research/highway-vqsort)
add_test( AlignedAllocatorTest.MakeUniqueAligned /home/arif/Research/highway-vqsort/tests/aligned_allocator_test [==[--gtest_filter=AlignedAllocatorTest.MakeUniqueAligned]==] --gtest_also_run_disabled_tests)
set_tests_properties( AlignedAllocatorTest.MakeUniqueAligned PROPERTIES WORKING_DIRECTORY /home/arif/Research/highway-vqsort)
add_test( AlignedAllocatorTest.MakeUniqueAlignedArray /home/arif/Research/highway-vqsort/tests/aligned_allocator_test [==[--gtest_filter=AlignedAllocatorTest.MakeUniqueAlignedArray]==] --gtest_also_run_disabled_tests)
set_tests_properties( AlignedAllocatorTest.MakeUniqueAlignedArray PROPERTIES WORKING_DIRECTORY /home/arif/Research/highway-vqsort)
add_test( AlignedAllocatorTest.AllocSingleInt /home/arif/Research/highway-vqsort/tests/aligned_allocator_test [==[--gtest_filter=AlignedAllocatorTest.AllocSingleInt]==] --gtest_also_run_disabled_tests)
set_tests_properties( AlignedAllocatorTest.AllocSingleInt PROPERTIES WORKING_DIRECTORY /home/arif/Research/highway-vqsort)
add_test( AlignedAllocatorTest.AllocMultipleInt /home/arif/Research/highway-vqsort/tests/aligned_allocator_test [==[--gtest_filter=AlignedAllocatorTest.AllocMultipleInt]==] --gtest_also_run_disabled_tests)
set_tests_properties( AlignedAllocatorTest.AllocMultipleInt PROPERTIES WORKING_DIRECTORY /home/arif/Research/highway-vqsort)
add_test( AlignedAllocatorTest.AllocateAlignedObjectWithoutDestructor /home/arif/Research/highway-vqsort/tests/aligned_allocator_test [==[--gtest_filter=AlignedAllocatorTest.AllocateAlignedObjectWithoutDestructor]==] --gtest_also_run_disabled_tests)
set_tests_properties( AlignedAllocatorTest.AllocateAlignedObjectWithoutDestructor PROPERTIES WORKING_DIRECTORY /home/arif/Research/highway-vqsort)
add_test( AlignedAllocatorTest.MakeUniqueAlignedArrayWithCustomAlloc /home/arif/Research/highway-vqsort/tests/aligned_allocator_test [==[--gtest_filter=AlignedAllocatorTest.MakeUniqueAlignedArrayWithCustomAlloc]==] --gtest_also_run_disabled_tests)
set_tests_properties( AlignedAllocatorTest.MakeUniqueAlignedArrayWithCustomAlloc PROPERTIES WORKING_DIRECTORY /home/arif/Research/highway-vqsort)
add_test( AlignedAllocatorTest.DefaultInit /home/arif/Research/highway-vqsort/tests/aligned_allocator_test [==[--gtest_filter=AlignedAllocatorTest.DefaultInit]==] --gtest_also_run_disabled_tests)
set_tests_properties( AlignedAllocatorTest.DefaultInit PROPERTIES WORKING_DIRECTORY /home/arif/Research/highway-vqsort)
set( aligned_allocator_test_TESTS AlignedAllocatorTest.FreeNullptr AlignedAllocatorTest.Log2 AlignedAllocatorTest.Overflow AlignedAllocatorTest.AllocDefaultPointers AlignedAllocatorTest.EmptyAlignedUniquePtr AlignedAllocatorTest.EmptyAlignedFreeUniquePtr AlignedAllocatorTest.CustomAlloc AlignedAllocatorTest.MakeUniqueAlignedDefaultConstructor AlignedAllocatorTest.MakeUniqueAligned AlignedAllocatorTest.MakeUniqueAlignedArray AlignedAllocatorTest.AllocSingleInt AlignedAllocatorTest.AllocMultipleInt AlignedAllocatorTest.AllocateAlignedObjectWithoutDestructor AlignedAllocatorTest.MakeUniqueAlignedArrayWithCustomAlloc AlignedAllocatorTest.DefaultInit)
