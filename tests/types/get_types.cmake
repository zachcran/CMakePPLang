include(cmake_test/cmake_test)

ct_add_test("cpp_get_types")
    include(cmakepp_core/algorithm/equal)
    include(cmakepp_core/types/get_types)

    ct_add_section("Signature")
        set(CMAKEPP_CORE_DEBUG_MODE ON)

        ct_add_section("Arg1 must be desc")
            cpp_get_types(TRUE)
            ct_assert_fails_as("Assertion: TRUE is desc")
        ct_end_section()
    ct_end_section()

    ct_add_section("No arguments")
        cpp_get_types(result)
        cpp_array(CTOR corr)
        cpp_equal(are_equal "${corr}" "${result}")
        ct_assert_equal(are_equal TRUE)
    ct_end_section()

    ct_add_section("One argument")
        cpp_get_types(result 1)
        cpp_array(CTOR corr int)
        cpp_equal(are_equal "${corr}" "${result}")
        ct_assert_equal(are_equal TRUE)
    ct_end_section()

    ct_add_section("Two arguments")
        cpp_get_types(result 1 TRUE)
        cpp_array(CTOR corr int bool)
        cpp_equal(are_equal "${corr}" "${result}")
        ct_assert_equal(are_equal TRUE)
    ct_end_section()

    ct_add_section("Three arguments")
        cpp_get_types(result 1 TRUE "${CMAKE_CURRENT_BINARY_DIR}")
        cpp_array(CTOR corr int bool path)
        cpp_equal(are_equal "${corr}" "${result}")
        ct_assert_equal(are_equal TRUE)
    ct_end_section()
ct_end_test()
