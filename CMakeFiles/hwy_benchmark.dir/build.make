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
include CMakeFiles/hwy_benchmark.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/hwy_benchmark.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/hwy_benchmark.dir/flags.make

CMakeFiles/hwy_benchmark.dir/hwy/examples/benchmark.cc.o: CMakeFiles/hwy_benchmark.dir/flags.make
CMakeFiles/hwy_benchmark.dir/hwy/examples/benchmark.cc.o: hwy/examples/benchmark.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/arif/Research/highway-vqsort/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/hwy_benchmark.dir/hwy/examples/benchmark.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/hwy_benchmark.dir/hwy/examples/benchmark.cc.o -c /home/arif/Research/highway-vqsort/hwy/examples/benchmark.cc

CMakeFiles/hwy_benchmark.dir/hwy/examples/benchmark.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/hwy_benchmark.dir/hwy/examples/benchmark.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/arif/Research/highway-vqsort/hwy/examples/benchmark.cc > CMakeFiles/hwy_benchmark.dir/hwy/examples/benchmark.cc.i

CMakeFiles/hwy_benchmark.dir/hwy/examples/benchmark.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/hwy_benchmark.dir/hwy/examples/benchmark.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/arif/Research/highway-vqsort/hwy/examples/benchmark.cc -o CMakeFiles/hwy_benchmark.dir/hwy/examples/benchmark.cc.s

CMakeFiles/hwy_benchmark.dir/hwy/examples/benchmark.cc.o.requires:

.PHONY : CMakeFiles/hwy_benchmark.dir/hwy/examples/benchmark.cc.o.requires

CMakeFiles/hwy_benchmark.dir/hwy/examples/benchmark.cc.o.provides: CMakeFiles/hwy_benchmark.dir/hwy/examples/benchmark.cc.o.requires
	$(MAKE) -f CMakeFiles/hwy_benchmark.dir/build.make CMakeFiles/hwy_benchmark.dir/hwy/examples/benchmark.cc.o.provides.build
.PHONY : CMakeFiles/hwy_benchmark.dir/hwy/examples/benchmark.cc.o.provides

CMakeFiles/hwy_benchmark.dir/hwy/examples/benchmark.cc.o.provides.build: CMakeFiles/hwy_benchmark.dir/hwy/examples/benchmark.cc.o


# Object files for target hwy_benchmark
hwy_benchmark_OBJECTS = \
"CMakeFiles/hwy_benchmark.dir/hwy/examples/benchmark.cc.o"

# External object files for target hwy_benchmark
hwy_benchmark_EXTERNAL_OBJECTS =

examples/hwy_benchmark: CMakeFiles/hwy_benchmark.dir/hwy/examples/benchmark.cc.o
examples/hwy_benchmark: CMakeFiles/hwy_benchmark.dir/build.make
examples/hwy_benchmark: libhwy.a
examples/hwy_benchmark: CMakeFiles/hwy_benchmark.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/arif/Research/highway-vqsort/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable examples/hwy_benchmark"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/hwy_benchmark.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/hwy_benchmark.dir/build: examples/hwy_benchmark

.PHONY : CMakeFiles/hwy_benchmark.dir/build

CMakeFiles/hwy_benchmark.dir/requires: CMakeFiles/hwy_benchmark.dir/hwy/examples/benchmark.cc.o.requires

.PHONY : CMakeFiles/hwy_benchmark.dir/requires

CMakeFiles/hwy_benchmark.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/hwy_benchmark.dir/cmake_clean.cmake
.PHONY : CMakeFiles/hwy_benchmark.dir/clean

CMakeFiles/hwy_benchmark.dir/depend:
	cd /home/arif/Research/highway-vqsort && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/arif/Research/highway-vqsort /home/arif/Research/highway-vqsort /home/arif/Research/highway-vqsort /home/arif/Research/highway-vqsort /home/arif/Research/highway-vqsort/CMakeFiles/hwy_benchmark.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/hwy_benchmark.dir/depend

