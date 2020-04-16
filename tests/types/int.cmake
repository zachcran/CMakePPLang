include(cmake_test/cmake_test)

ct_add_test("cpp_is_int")
    include(cmakepp_core/types/int)

    ct_add_section("Signature")
        cpp_is_int(return 1 hello)
        ct_assert_fails_as("cpp_is_int takes exactly 2 arguments.")
    ct_end_section()

    ct_add_section("bool")
        cpp_is_int(return TRUE)
        ct_assert_equal(return FALSE)
    ct_end_section()

    ct_add_section("class")
        include(cmakepp_core/class/class)
        cpp_class(MyClass)

        cpp_is_int(return MyClass)
        ct_assert_equal(return FALSE)
    ct_end_section()

    ct_add_section("command")
        cpp_is_int(return add_subdirectory)
        ct_assert_equal(return FALSE)
    ct_end_section()

    ct_add_section("descriptions")
        ct_add_section("description w/o an integer")
            cpp_is_int(return "Hello World")
            ct_assert_equal(return FALSE)
        ct_end_section()

        ct_add_section("description containing integers")
            cpp_is_int(return "Hello World 1")
            ct_assert_equal(return FALSE)
        ct_end_section()
    ct_end_section()

    ct_add_section("float")
        cpp_is_int(return 3.14)
        ct_assert_equal(return FALSE)
    ct_end_section()

    ct_add_section("integer")
        ct_add_section("small positive")
            cpp_is_int(return 42)
            ct_assert_equal(return TRUE)
        ct_end_section()

        ct_add_section("small negative")
            cpp_is_int(return -42)
            ct_assert_equal(return TRUE)
        ct_end_section()

        ct_add_section("large positive")
            cpp_is_int(return 123456789)
            ct_assert_equal(return TRUE)
        ct_end_section()

        ct_add_section("large negative")
            cpp_is_int(return -123456789)
            ct_assert_equal(return TRUE)
        ct_end_section()
    ct_end_section()

    ct_add_section("list")
        ct_add_section("Normal list")
            cpp_is_int(return "hello;world")
            ct_assert_equal(return FALSE)
        ct_end_section()

        ct_add_section("List of integers")
            cpp_is_int(return "1;2;3")
            ct_assert_equal(return FALSE)
        ct_end_section()
    ct_end_section()

    ct_add_section("map")
        include(cmakepp_core/map/map)
        cpp_map(CTOR a_map)
        cpp_is_int(result a_map)
        ct_assert_equal(result FALSE)
    ct_end_section()

    ct_add_section("obj")
        include(cmakepp_core/object/object)
        cpp_is_int(result "${__CMAKEPP_CORE_OBJECT_SINGLETON__}")
        ct_assert_equal(result FALSE)
    ct_end_section()

    ct_add_section("path")
        ct_add_section("Normal path")
            cpp_is_int(return "${CMAKE_CURRENT_LIST_DIR}")
            ct_assert_equal(return FALSE)
        ct_end_section()

        ct_add_section("Path with int in it")
            cpp_is_int(return "${CMAKE_CURRENT_LIST_DIR}/3")
            ct_assert_equal(return FALSE)
        ct_end_section()
    ct_end_section()

    ct_add_section("target")
        ct_add_section("normal target name")
            add_library(lib STATIC IMPORTED)
            cpp_is_int(return lib)
            ct_assert_equal(return FALSE)
        ct_end_section()

        ct_add_section("target with integer")
            add_library(lib1 STATIC IMPORTED)
            cpp_is_int(return lib1)
            ct_assert_equal(return FALSE)
        ct_end_section()
    ct_end_section()

    ct_add_section("type")
        cpp_is_int(return bool)
        ct_assert_equal(return FALSE)
    ct_end_section()
ct_end_test()
