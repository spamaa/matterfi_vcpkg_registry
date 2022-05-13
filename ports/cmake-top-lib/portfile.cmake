# this is a sample how to use external matterfi-cmake modules in port file
# BEGIN
include ("${CURRENT_INSTALLED_DIR}/../${_HOST_TRIPLET}/share/matterfi-cmake/matterfi_config.cmake")
matterfi_hello()
# END

vcpkg_from_git(
  OUT_SOURCE_PATH SOURCE_PATH
  URL git-matterfi@odroidH2:repos/CMakeTopLib.git
  REF 9e22e14f54c5cb0b26942700945f46359c0c1b0f
  FETCH_REF master
  HEAD_REF master
)

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