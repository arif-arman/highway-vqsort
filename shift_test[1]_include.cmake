if(EXISTS "/home/arif/Research/highway-vqsort/shift_test[1]_tests.cmake")
  include("/home/arif/Research/highway-vqsort/shift_test[1]_tests.cmake")
else()
  add_test(shift_test_NOT_BUILT shift_test_NOT_BUILT)
endif()
