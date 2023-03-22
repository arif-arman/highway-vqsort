add_test( NanobenchmarkTest.RunAll /home/arif/Research/highway-vqsort/tests/nanobenchmark_test [==[--gtest_filter=NanobenchmarkTest.RunAll]==] --gtest_also_run_disabled_tests)
set_tests_properties( NanobenchmarkTest.RunAll PROPERTIES WORKING_DIRECTORY /home/arif/Research/highway-vqsort)
set( nanobenchmark_test_TESTS NanobenchmarkTest.RunAll)
