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
include CMakeFiles/hwy_test.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/hwy_test.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/hwy_test.dir/flags.make

CMakeFiles/hwy_test.dir/hwy/tests/test_util.cc.o: CMakeFiles/hwy_test.dir/flags.make
CMakeFiles/hwy_test.dir/hwy/tests/test_util.cc.o: hwy/tests/test_util.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/arif/Research/highway-vqsort/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/hwy_test.dir/hwy/tests/test_util.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/hwy_test.dir/hwy/tests/test_util.cc.o -c /home/arif/Research/highway-vqsort/hwy/tests/test_util.cc

CMakeFiles/hwy_test.dir/hwy/tests/test_util.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/hwy_test.dir/hwy/tests/test_util.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/arif/Research/highway-vqsort/hwy/tests/test_util.cc > CMakeFiles/hwy_test.dir/hwy/tests/test_util.cc.i

CMakeFiles/hwy_test.dir/hwy/tests/test_util.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/hwy_test.dir/hwy/tests/test_util.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/arif/Research/highway-vqsort/hwy/tests/test_util.cc -o CMakeFiles/hwy_test.dir/hwy/tests/test_util.cc.s

CMakeFiles/hwy_test.dir/hwy/tests/test_util.cc.o.requires:

.PHONY : CMakeFiles/hwy_test.dir/hwy/tests/test_util.cc.o.requires

CMakeFiles/hwy_test.dir/hwy/tests/test_util.cc.o.provides: CMakeFiles/hwy_test.dir/hwy/tests/test_util.cc.o.requires
	$(MAKE) -f CMakeFiles/hwy_test.dir/build.make CMakeFiles/hwy_test.dir/hwy/tests/test_util.cc.o.provides.build
.PHONY : CMakeFiles/hwy_test.dir/hwy/tests/test_util.cc.o.provides

CMakeFiles/hwy_test.dir/hwy/tests/test_util.cc.o.provides.build: CMakeFiles/hwy_test.dir/hwy/tests/test_util.cc.o


# Object files for target hwy_test
hwy_test_OBJECTS = \
"CMakeFiles/hwy_test.dir/hwy/tests/test_util.cc.o"

# External object files for target hwy_test
hwy_test_EXTERNAL_OBJECTS =

libhwy_test.a: CMakeFiles/hwy_test.dir/hwy/tests/test_util.cc.o
libhwy_test.a: CMakeFiles/hwy_test.dir/build.make
libhwy_test.a: hwy/hwy.version
libhwy_test.a: CMakeFiles/hwy_test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/arif/Research/highway-vqsort/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library libhwy_test.a"
	$(CMAKE_COMMAND) -P CMakeFiles/hwy_test.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/hwy_test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/hwy_test.dir/build: libhwy_test.a

.PHONY : CMakeFiles/hwy_test.dir/build

CMakeFiles/hwy_test.dir/requires: CMakeFiles/hwy_test.dir/hwy/tests/test_util.cc.o.requires

.PHONY : CMakeFiles/hwy_test.dir/requires

CMakeFiles/hwy_test.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/hwy_test.dir/cmake_clean.cmake
.PHONY : CMakeFiles/hwy_test.dir/clean

CMakeFiles/hwy_test.dir/depend:
	cd /home/arif/Research/highway-vqsort && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/arif/Research/highway-vqsort /home/arif/Research/highway-vqsort /home/arif/Research/highway-vqsort /home/arif/Research/highway-vqsort /home/arif/Research/highway-vqsort/CMakeFiles/hwy_test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/hwy_test.dir/depend

