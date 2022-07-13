#!/bin/bash

CC=clang-13 CXX=clang-13++ /usr/local/bin/bazel build -c opt hwy/contrib/sort:all
