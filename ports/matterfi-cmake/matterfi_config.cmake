# this is how to include another cmakes
# include("${CMAKE_CURRENT_LIST_DIR}/vcpkg_cmake_build.cmake")

function (matterfi_hello)
	message (STATUS "!!!! WOW WOW WOW WOW !!!!")
	message (STATUS "!!!! WOW CMAKE_CURRENT_LIST_DIR: '${CMAKE_CURRENT_LIST_DIR} WOW !!!!'")
	message (STATUS "!!!! WOW WOW WOW WOW !!!!")
endfunction()