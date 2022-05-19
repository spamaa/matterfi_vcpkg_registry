#[===[.md:
# Adds gtest test target
Adds test target using ctest and gtest. As the result target ***test*** will run this target. Target can be also run standalone. The entry file for the target must be specified by setting ```${TARGET_NAME}_main``` varialbe. Enables address sanitizer for the target if appropiate variable is defined (```MSVC_ENABLE_ASAN``` for msvc compiler).
The function requires that ```${_project_name}_ROOT_DIR``` will point to root directory of the project. 

## typical usage:
```
set (TARGET_NAME <target_name>)
set (${TARGET_NAME}_main <main_cpp_file>)
set (source_files [file1] [file2] [...])
matterfi_add_test_target(<project_name> ${TARGET_NAME} ${source_files} )
```
## parameters:
### project_name
Name of the project. This name is used for creating unique variable name storing main file name.
### target_name 
Name of the target for which ASAN should be enabled.
## optional parameters
List of source files. 

#]===]

if (NOT DEFINED __MODULE_MATTERFI_ADD_TEST_TARGET_INCLUDED__)
	set (__MODULE_MATTERFI_ADD_TEST_TARGET_INCLUDED__ 1)
	function(matterfi_add_test_target
		_project_name
		_target_name
	)
		set (cxx_test_sources ${ARGN})

		# add sources to test test executable
		add_executable(${_target_name} ${${_target_name}_main} ${cxx_test_sources})

		# set runtime type for msvc compilation
		matterfi_set_msvc_type(${_target_name})

		# enable sanitizer
		matterfi_enable_msvc_asan(${_target_name})

		target_compile_definitions(
			${_target_name} PRIVATE
			GOOGLETEST_SUPPORTED
		)

		target_include_directories(${_target_name} PRIVATE
			${${_project_name}_ROOT_DIR}/tests
		)

		target_link_libraries(${_target_name} 
			PRIVATE 
				GTest::gmock
				GTest::gtest
		)

		set_target_properties( ${_target_name}
			PROPERTIES RUNTIME_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/tests
		)

		add_test(${_target_name}
			${PROJECT_BINARY_DIR}/tests/${_target_name}
			--gtest_output=xml:gtestresult.xml
		)

	endfunction(matterfi_add_test_target)

endif()		# if (NOT DEFINED __MODULE_MATTERFI_ADD_TEST_TARGET_INCLUDED__)