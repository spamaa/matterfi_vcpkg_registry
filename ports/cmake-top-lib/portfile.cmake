vcpkg_from_git(
  OUT_SOURCE_PATH SOURCE_PATH
  URL git-matterfi@odroidH2:repos/CMakeTopLib.git
  REF 030c11bfbc5922e258c8bcc51e08e5cff87349ef
  FETCH_REF master
  HEAD_REF master
)

vcpkg_configure_cmake(
  SOURCE_PATH "${SOURCE_PATH}"
  PREFER_NINJA
)

vcpkg_install_cmake()
#vcpkg_cmake_config_fixup()
#vcpkg_cmake_install()
vcpkg_fixup_cmake_targets()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(
  INSTALL "${SOURCE_PATH}/LICENSE"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
  RENAME copyright)