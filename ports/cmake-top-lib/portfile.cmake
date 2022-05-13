# this is a sample how to use external matterfi-cmake modules in port file
# BEGIN
message (STATUS "!!!!~~~~ BEGIN From cmake-lib-top portfile BEGIN ~~~~!!!!")
message (STATUS "!!!!** _HOST_TRIPLET: '${_HOST_TRIPLET}' **!!!!")
message (STATUS "!!!!~~~~ CMAKE_CURRENT_LIST_DIR: '${CMAKE_CURRENT_LIST_DIR}' ~~~~!!!!")
message (STATUS "!!!!~~~~ CURRENT_PACKAGES_DIR: '${CURRENT_PACKAGES_DIR}' ~~~~!!!!")
message (STATUS "!!!!~~~~ CURRENT_PORT_DIR: '${CURRENT_PORT_DIR}' ~~~~!!!!")
message (STATUS "!!!!~~~~ CURRENT_INSTALLED_DIR: '${CURRENT_INSTALLED_DIR}' ~~~~!!!!")
message (STATUS "!!!!~~~~ PORT: '${PORT}' ~~~~!!!!")
message (STATUS "!!!!~~~~ PACKAGE_NAME: '${PACKAGE_NAME}' ~~~~!!!!")
include ("${CMAKE_CURRENT_LIST_DIR}/../matterfi-cmake/matterfi-config.cmake")
matterfi_hello()
message (STATUS "!!!!~~~~ END From cmake-lib-top portfile END ~~~~!!!!")
# END

vcpkg_from_git(
  OUT_SOURCE_PATH SOURCE_PATH
  URL git-matterfi@odroidH2:repos/CMakeTopLib.git
  REF 7a5f9571d233e81b6fdb69830b4618eddfc37dd5
  FETCH_REF master
  HEAD_REF master
)

if (MSVC_ENABLE_ASAN)
	message (STATUS "Porting cmake-lib-top with MSVC_ENABLE_ASAN")
	vcpkg_configure_cmake(
	  SOURCE_PATH "${SOURCE_PATH}"
	  PREFER_NINJA
	  OPTIONS -DMSVC_ENABLE_ASAN=ON
	)
else()
	message (STATUS "Porting cmake-lib-top without MSVC_ENABLE_ASAN")
	vcpkg_configure_cmake(
	  SOURCE_PATH "${SOURCE_PATH}"
	  PREFER_NINJA
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