vcpkg_from_git(
  OUT_SOURCE_PATH SOURCE_PATH
  URL git-matterfi@odroidH2:repos/cmake-static-lib.git
  REF efc26c30fb265a0442802dbc94d02c5d416f13e8
  FETCH_REF master
  HEAD_REF master
)

vcpkg_configure_cmake(
  SOURCE_PATH "${SOURCE_PATH}"
  PREFER_NINJA
)
vcpkg_install_cmake()
vcpkg_fixup_cmake_targets()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(
  INSTALL "${SOURCE_PATH}/LICENSE"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
  RENAME copyright)