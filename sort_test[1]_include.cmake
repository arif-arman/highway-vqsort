if(EXISTS "/home/arif/Research/highway-vqsort/sort_test[1]_tests.cmake")
  include("/home/arif/Research/highway-vqsort/sort_test[1]_tests.cmake")
else()
  add_test(sort_test_NOT_BUILT sort_test_NOT_BUILT)
endif()
