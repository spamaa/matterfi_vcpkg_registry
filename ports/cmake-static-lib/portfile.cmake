if (MT_USE_LOCAL_REPOSITORY)
	message(STATUS "Fetching sources from local repository: 'cmake-static-lib'")
	vcpkg_from_git(
	  OUT_SOURCE_PATH SOURCE_PATH
	  URL git-matterfi@odroidH2:repos/CMakeStaticLib.git
	  REF 806cee3c01e0e21cdde729f43054b67ff2c0868c
	  FETCH_REF master
	  HEAD_REF master
	)
else()
	message(STATUS "Fetching sources from github: 'cmake-static-lib'")
	vcpkg_from_github(
	  OUT_SOURCE_PATH SOURCE_PATH
	  REPO spamaa/mt_cmake_static_lib
	  REF 806cee3c01e0e21cdde729f43054b67ff2c0868c
	  SHA512 532da2eead16c83adea4487e37a0fc8f3724ef08eeadd520b600e8283b631ae3654e366b671d01bd48da2bf27bab4250263b20d880ee1b81518a88997680f1cd
	  HEAD_REF master
	)	
endif()


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