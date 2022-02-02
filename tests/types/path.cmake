include(cmake_test/cmake_test)

ct_add_test(NAME "test_cpp_is_path")
function("${test_cpp_is_path}")
    include(cmakepp_lang/types/path)

    ct_add_section(NAME "test_signature" EXPECTFAIL)
    function("${test_signature}")
        cpp_is_path(return TRUE hello)
    endfunction()

    ct_add_section(NAME "test_bool")
    function("${test_bool}")
        cpp_is_path(return TRUE)
        ct_assert_equal(return FALSE)
    endfunction()

    ct_add_section(NAME "test_class")
    function("${test_class}")
        include(cmakepp_lang/class/class)
        cpp_class(MyClass)

        cpp_is_path(return MyClass)
        ct_assert_equal(return FALSE)
    endfunction()

    ct_add_section(NAME "test_command")
    function("${test_command}")
        cpp_is_path(return add_subdirectory)
        ct_assert_equal(return FALSE)
    endfunction()

    ct_add_section(NAME "test_description")
    function("${test_description}")
        ct_add_section(NAME "empty_description")
        function("${empty_description}")
            cpp_is_path(return "")
            ct_assert_equal(return FALSE)
        endfunction()

        ct_add_section(NAME "normal_description")
        function("${normal_description}")
            cpp_is_path(return "Hello World")
            ct_assert_equal(return FALSE)
        endfunction()

        ct_add_section(NAME "desc_with_filepath")
        function("${desc_with_filepath}")
            cpp_is_path(return "The path is: ${CMAKE_CURRENT_LIST_DIR}")
            ct_assert_equal(return FALSE)
        endfunction()
    endfunction()

    ct_add_section(NAME "test_float")
    function("${test_float}")
        cpp_is_path(return 3.14)
        ct_assert_equal(return FALSE)
    endfunction()

    ct_add_section(NAME "test_integer")
    function("${test_integer}")
        cpp_is_path(return 42)
        ct_assert_equal(return FALSE)
    endfunction()

    ct_add_section(NAME "test_list")
    function("${test_list}")
        ct_add_section(NAME "normal_list")
        function("${normal_list}")
            set(a_list 1 2 3)
            cpp_is_path(return "${a_list}")
            ct_assert_equal(return FALSE)
        endfunction()

        ct_add_section(NAME "list_of_filepaths")
        function("${list_of_filepaths}")
            set(a_list ${CMAKE_CURRENT_LIST_DIR} ${CMAKE_CURRENT_LIST_DIR})
            cpp_is_path(return "${a_list}")
            ct_assert_equal(return FALSE)
        endfunction()
    endfunction()

    ct_add_section(NAME "test_map")
    function("${test_map}")
        include(cmakepp_lang/map/map)
        cpp_map(CTOR a_map)
        cpp_is_path(result a_map)
        ct_assert_equal(result FALSE)
    endfunction()

    ct_add_section(NAME "test_obj")
    function("${test_obj}")
        include(cmakepp_lang/object/object)
        cpp_is_path(result "${__CMAKEPP_LANG_OBJECT_SINGLETON__}")
        ct_assert_equal(result FALSE)
    endfunction()

    ct_add_section(NAME "test_path")
    function("${test_path}")
        ct_add_section(NAME "absolute_path")
        function("${absolute_path}")
            cpp_is_path(return "${CMAKE_BINARY_DIR}")
            ct_assert_equal(return TRUE)
        endfunction()

        ct_add_section(NAME "relative_path")
        function("${relative_path}")
            cpp_is_path(return "a/directory")
            ct_assert_equal(return FALSE)
        endfunction()
    endfunction()

    ct_add_section(NAME "test_target")
    function("${test_target}")
        add_library(lib STATIC IMPORTED)
        cpp_is_path(return lib)
        ct_assert_equal(return FALSE)
    endfunction()

    ct_add_section(NAME "test_type")
    function("${test_type}")
        cpp_is_path(return bool)
        ct_assert_equal(return FALSE)
    endfunction()
endfunction()
