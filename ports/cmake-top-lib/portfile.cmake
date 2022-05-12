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