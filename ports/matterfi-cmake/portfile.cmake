file (INSTALL 
	"${CMAKE_CURRENT_LIST_DIR}/matterfi_config.cmake"
	"${CMAKE_CURRENT_LIST_DIR}/matterfi_hello.cmake"
	DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
)

set (VCPKG_POLICY_EMPTY_PACKAGE enabled)

