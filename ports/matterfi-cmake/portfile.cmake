file (INSTALL 
	"${CMAKE_CURRENT_LIST_DIR}/matterfi_config.cmake"
	"${CMAKE_CURRENT_LIST_DIR}/matterfi_common.cmake"
	"${CMAKE_CURRENT_LIST_DIR}/matterfi_validate.cmake"
	"${CMAKE_CURRENT_LIST_DIR}/matterfi_enable_msvc_asan.cmake"
	"${CMAKE_CURRENT_LIST_DIR}/matterfi_set_msvc_runtime_type.cmake"
	"${CMAKE_CURRENT_LIST_DIR}/matterfi_add_test_target.cmake"
	DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
)

set (VCPKG_POLICY_EMPTY_PACKAGE enabled)

