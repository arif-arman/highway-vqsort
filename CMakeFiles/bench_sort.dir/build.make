# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/arif/Research/highway-vqsort

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/arif/Research/highway-vqsort

# Include any dependencies generated for this target.
include CMakeFiles/bench_sort.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/bench_sort.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/bench_sort.dir/flags.make

CMakeFiles/bench_sort.dir/hwy/contrib/sort/bench_sort.cc.o: CMakeFiles/bench_sort.dir/flags.make
CMakeFiles/bench_sort.dir/hwy/contrib/sort/bench_sort.cc.o: hwy/contrib/sort/bench_sort.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/arif/Research/highway-vqsort/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/bench_sort.dir/hwy/contrib/sort/bench_sort.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/bench_sort.dir/hwy/contrib/sort/bench_sort.cc.o -c /home/arif/Research/highway-vqsort/hwy/contrib/sort/bench_sort.cc

CMakeFiles/bench_sort.dir/hwy/contrib/sort/bench_sort.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/bench_sort.dir/hwy/contrib/sort/bench_sort.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/arif/Research/highway-vqsort/hwy/contrib/sort/bench_sort.cc > CMakeFiles/bench_sort.dir/hwy/contrib/sort/bench_sort.cc.i

CMakeFiles/bench_sort.dir/hwy/contrib/sort/bench_sort.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/bench_sort.dir/hwy/contrib/sort/bench_sort.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/arif/Research/highway-vqsort/hwy/contrib/sort/bench_sort.cc -o CMakeFiles/bench_sort.dir/hwy/contrib/sort/bench_sort.cc.s

CMakeFiles/bench_sort.dir/hwy/contrib/sort/bench_sort.cc.o.requires:

.PHONY : CMakeFiles/bench_sort.dir/hwy/contrib/sort/bench_sort.cc.o.requires

CMakeFiles/bench_sort.dir/hwy/contrib/sort/bench_sort.cc.o.provides: CMakeFiles/bench_sort.dir/hwy/contrib/sort/bench_sort.cc.o.requires
	$(MAKE) -f CMakeFiles/bench_sort.dir/build.make CMakeFiles/bench_sort.dir/hwy/contrib/sort/bench_sort.cc.o.provides.build
.PHONY : CMakeFiles/bench_sort.dir/hwy/contrib/sort/bench_sort.cc.o.provides

CMakeFiles/bench_sort.dir/hwy/contrib/sort/bench_sort.cc.o.provides.build: CMakeFiles/bench_sort.dir/hwy/contrib/sort/bench_sort.cc.o


# Object files for target bench_sort
bench_sort_OBJECTS = \
"CMakeFiles/bench_sort.dir/hwy/contrib/sort/bench_sort.cc.o"

# External object files for target bench_sort
bench_sort_EXTERNAL_OBJECTS =

tests/bench_sort: CMakeFiles/bench_sort.dir/hwy/contrib/sort/bench_sort.cc.o
tests/bench_sort: CMakeFiles/bench_sort.dir/build.make
tests/bench_sort: libhwy.a
tests/bench_sort: libhwy_test.a
tests/bench_sort: libhwy_contrib.a
tests/bench_sort: lib/libgtest.a
tests/bench_sort: lib/libgtest_main.a
tests/bench_sort: libhwy.a
tests/bench_sort: lib/libgtest.a
tests/bench_sort: CMakeFiles/bench_sort.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/arif/Research/highway-vqsort/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable tests/bench_sort"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/bench_sort.dir/link.txt --verbose=$(VERBOSE)
	/usr/bin/cmake -D TEST_TARGET=bench_sort -D TEST_EXECUTABLE=/home/arif/Research/highway-vqsort/tests/bench_sort -D TEST_EXECUTOR= -D TEST_WORKING_DIR=/home/arif/Research/highway-vqsort -D TEST_EXTRA_ARGS= -D TEST_PROPERTIES= -D TEST_PREFIX= -D TEST_SUFFIX= -D NO_PRETTY_TYPES=FALSE -D NO_PRETTY_VALUES=FALSE -D TEST_LIST=bench_sort_TESTS -D CTEST_FILE=/home/arif/Research/highway-vqsort/bench_sort[1]_tests.cmake -D TEST_DISCOVERY_TIMEOUT=60 -P /usr/share/cmake-3.10/Modules/GoogleTestAddTests.cmake

# Rule to build all files generated by this target.
CMakeFiles/bench_sort.dir/build: tests/bench_sort

.PHONY : CMakeFiles/bench_sort.dir/build

CMakeFiles/bench_sort.dir/requires: CMakeFiles/bench_sort.dir/hwy/contrib/sort/bench_sort.cc.o.requires

.PHONY : CMakeFiles/bench_sort.dir/requires

CMakeFiles/bench_sort.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/bench_sort.dir/cmake_clean.cmake
.PHONY : CMakeFiles/bench_sort.dir/clean

CMakeFiles/bench_sort.dir/depend:
	cd /home/arif/Research/highway-vqsort && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/arif/Research/highway-vqsort /home/arif/Research/highway-vqsort /home/arif/Research/highway-vqsort /home/arif/Research/highway-vqsort /home/arif/Research/highway-vqsort/CMakeFiles/bench_sort.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/bench_sort.dir/depend

