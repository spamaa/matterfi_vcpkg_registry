# this is a sample how to use external matterfi-cmake modules in port file
# BEGIN
include ("${CURRENT_INSTALLED_DIR}/../${_HOST_TRIPLET}/share/matterfi-cmake/matterfi_config.cmake")
# call some function or macro
#matterfi_hello()
# END

if (MT_USE_LOCAL_REPOSITORY)
	message(STATUS "Fetching sources from local repository: 'cmake-top-lib'")
		vcpkg_from_git(
		  OUT_SOURCE_PATH SOURCE_PATH
		  URL git-matterfi@odroidH2:repos/CMakeTopLib.git
		  REF 3e53ee7445e8ed6f466ccc6c759f60fd5c837001
		  FETCH_REF master
		  HEAD_REF master
		)
else()
	message(STATUS "Fetching sources from github: 'cmake-top-lib'")
	vcpkg_from_github(
	  OUT_SOURCE_PATH SOURCE_PATH
	  REPO spamaa/mt_cmake_top_lib
	  REF 3e53ee7445e8ed6f466ccc6c759f60fd5c837001
	  SHA512 0
	  HEAD_REF master
	)	
endif()

if (MSVC_ENABLE_ASAN)
	message (STATUS "Porting cmake-lib-top with MSVC_ENABLE_ASAN")
	vcpkg_configure_cmake(
	  SOURCE_PATH "${SOURCE_PATH}"
	  PREFER_NINJA
	  OPTIONS 
		-DMSVC_ENABLE_ASAN=ON
		-DMATTERFI_CMAKE_CONFIG_FILE="share/matterfi-cmake/matterfi_config.cmake"
		-DMATTERFI_CMAKE_HOST_TRIPLET="${_HOST_TRIPLET}"
	)
else()
	message (STATUS "Porting cmake-lib-top without MSVC_ENABLE_ASAN")
	vcpkg_configure_cmake(
	  SOURCE_PATH "${SOURCE_PATH}"
	  PREFER_NINJA
	  OPTIONS
		-DMATTERFI_CMAKE_CONFIG_FILE="share/matterfi-cmake/matterfi_config.cmake"
		-DMATTERFI_CMAKE_HOST_TRIPLET="${_HOST_TRIPLET}"
	)
endif()

vcpkg_install_cmake()
#vcpkg_cmake_config_fixup()
#vcpkg_cmake_install()
vcpkg_fixup_cmake_targets()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(
  INSTALL "${SOURCE_PATH}/LICENSE"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
  RENAME copyright)