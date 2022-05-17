file (INSTALL 
	"${CMAKE_CURRENT_LIST_DIR}/matterfi_config.cmake"
	"${CMAKE_CURRENT_LIST_DIR}/matterfi_common.cmake"
	"${CMAKE_CURRENT_LIST_DIR}/matterfi_validate.cmake"
	DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
)

set (VCPKG_POLICY_EMPTY_PACKAGE enabled)

