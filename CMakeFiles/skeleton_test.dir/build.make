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
include CMakeFiles/skeleton_test.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/skeleton_test.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/skeleton_test.dir/flags.make

CMakeFiles/skeleton_test.dir/hwy/examples/skeleton_test.cc.o: CMakeFiles/skeleton_test.dir/flags.make
CMakeFiles/skeleton_test.dir/hwy/examples/skeleton_test.cc.o: hwy/examples/skeleton_test.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/arif/Research/highway-vqsort/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/skeleton_test.dir/hwy/examples/skeleton_test.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/skeleton_test.dir/hwy/examples/skeleton_test.cc.o -c /home/arif/Research/highway-vqsort/hwy/examples/skeleton_test.cc

CMakeFiles/skeleton_test.dir/hwy/examples/skeleton_test.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/skeleton_test.dir/hwy/examples/skeleton_test.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/arif/Research/highway-vqsort/hwy/examples/skeleton_test.cc > CMakeFiles/skeleton_test.dir/hwy/examples/skeleton_test.cc.i

CMakeFiles/skeleton_test.dir/hwy/examples/skeleton_test.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/skeleton_test.dir/hwy/examples/skeleton_test.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/arif/Research/highway-vqsort/hwy/examples/skeleton_test.cc -o CMakeFiles/skeleton_test.dir/hwy/examples/skeleton_test.cc.s

CMakeFiles/skeleton_test.dir/hwy/examples/skeleton_test.cc.o.requires:

.PHONY : CMakeFiles/skeleton_test.dir/hwy/examples/skeleton_test.cc.o.requires

CMakeFiles/skeleton_test.dir/hwy/examples/skeleton_test.cc.o.provides: CMakeFiles/skeleton_test.dir/hwy/examples/skeleton_test.cc.o.requires
	$(MAKE) -f CMakeFiles/skeleton_test.dir/build.make CMakeFiles/skeleton_test.dir/hwy/examples/skeleton_test.cc.o.provides.build
.PHONY : CMakeFiles/skeleton_test.dir/hwy/examples/skeleton_test.cc.o.provides

CMakeFiles/skeleton_test.dir/hwy/examples/skeleton_test.cc.o.provides.build: CMakeFiles/skeleton_test.dir/hwy/examples/skeleton_test.cc.o


CMakeFiles/skeleton_test.dir/hwy/examples/skeleton.cc.o: CMakeFiles/skeleton_test.dir/flags.make
CMakeFiles/skeleton_test.dir/hwy/examples/skeleton.cc.o: hwy/examples/skeleton.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/arif/Research/highway-vqsort/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/skeleton_test.dir/hwy/examples/skeleton.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/skeleton_test.dir/hwy/examples/skeleton.cc.o -c /home/arif/Research/highway-vqsort/hwy/examples/skeleton.cc

CMakeFiles/skeleton_test.dir/hwy/examples/skeleton.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/skeleton_test.dir/hwy/examples/skeleton.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/arif/Research/highway-vqsort/hwy/examples/skeleton.cc > CMakeFiles/skeleton_test.dir/hwy/examples/skeleton.cc.i

CMakeFiles/skeleton_test.dir/hwy/examples/skeleton.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/skeleton_test.dir/hwy/examples/skeleton.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/arif/Research/highway-vqsort/hwy/examples/skeleton.cc -o CMakeFiles/skeleton_test.dir/hwy/examples/skeleton.cc.s

CMakeFiles/skeleton_test.dir/hwy/examples/skeleton.cc.o.requires:

.PHONY : CMakeFiles/skeleton_test.dir/hwy/examples/skeleton.cc.o.requires

CMakeFiles/skeleton_test.dir/hwy/examples/skeleton.cc.o.provides: CMakeFiles/skeleton_test.dir/hwy/examples/skeleton.cc.o.requires
	$(MAKE) -f CMakeFiles/skeleton_test.dir/build.make CMakeFiles/skeleton_test.dir/hwy/examples/skeleton.cc.o.provides.build
.PHONY : CMakeFiles/skeleton_test.dir/hwy/examples/skeleton.cc.o.provides

CMakeFiles/skeleton_test.dir/hwy/examples/skeleton.cc.o.provides.build: CMakeFiles/skeleton_test.dir/hwy/examples/skeleton.cc.o


# Object files for target skeleton_test
skeleton_test_OBJECTS = \
"CMakeFiles/skeleton_test.dir/hwy/examples/skeleton_test.cc.o" \
"CMakeFiles/skeleton_test.dir/hwy/examples/skeleton.cc.o"

# External object files for target skeleton_test
skeleton_test_EXTERNAL_OBJECTS =

tests/skeleton_test: CMakeFiles/skeleton_test.dir/hwy/examples/skeleton_test.cc.o
tests/skeleton_test: CMakeFiles/skeleton_test.dir/hwy/examples/skeleton.cc.o
tests/skeleton_test: CMakeFiles/skeleton_test.dir/build.make
tests/skeleton_test: libhwy.a
tests/skeleton_test: libhwy_test.a
tests/skeleton_test: libhwy_contrib.a
tests/skeleton_test: lib/libgtest.a
tests/skeleton_test: lib/libgtest_main.a
tests/skeleton_test: libhwy.a
tests/skeleton_test: lib/libgtest.a
tests/skeleton_test: CMakeFiles/skeleton_test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/arif/Research/highway-vqsort/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable tests/skeleton_test"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/skeleton_test.dir/link.txt --verbose=$(VERBOSE)
	/usr/bin/cmake -D TEST_TARGET=skeleton_test -D TEST_EXECUTABLE=/home/arif/Research/highway-vqsort/tests/skeleton_test -D TEST_EXECUTOR= -D TEST_WORKING_DIR=/home/arif/Research/highway-vqsort -D TEST_EXTRA_ARGS= -D TEST_PROPERTIES= -D TEST_PREFIX= -D TEST_SUFFIX= -D NO_PRETTY_TYPES=FALSE -D NO_PRETTY_VALUES=FALSE -D TEST_LIST=skeleton_test_TESTS -D CTEST_FILE=/home/arif/Research/highway-vqsort/skeleton_test[1]_tests.cmake -D TEST_DISCOVERY_TIMEOUT=60 -P /usr/share/cmake-3.10/Modules/GoogleTestAddTests.cmake

# Rule to build all files generated by this target.
CMakeFiles/skeleton_test.dir/build: tests/skeleton_test

.PHONY : CMakeFiles/skeleton_test.dir/build

CMakeFiles/skeleton_test.dir/requires: CMakeFiles/skeleton_test.dir/hwy/examples/skeleton_test.cc.o.requires
CMakeFiles/skeleton_test.dir/requires: CMakeFiles/skeleton_test.dir/hwy/examples/skeleton.cc.o.requires

.PHONY : CMakeFiles/skeleton_test.dir/requires

CMakeFiles/skeleton_test.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/skeleton_test.dir/cmake_clean.cmake
.PHONY : CMakeFiles/skeleton_test.dir/clean

CMakeFiles/skeleton_test.dir/depend:
	cd /home/arif/Research/highway-vqsort && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/arif/Research/highway-vqsort /home/arif/Research/highway-vqsort /home/arif/Research/highway-vqsort /home/arif/Research/highway-vqsort /home/arif/Research/highway-vqsort/CMakeFiles/skeleton_test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/skeleton_test.dir/depend

