if(EXISTS "/home/arif/Research/highway-vqsort/test_util_test[1]_tests.cmake")
  include("/home/arif/Research/highway-vqsort/test_util_test[1]_tests.cmake")
else()
  add_test(test_util_test_NOT_BUILT test_util_test_NOT_BUILT)
endif()
