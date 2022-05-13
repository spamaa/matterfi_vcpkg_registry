#include("${CMAKE_CURRENT_LIST_DIR}/../vcpkg-cmake/vcpkg-port-config.cmake")

message (STATUS "!!!!** BEGIN matterf-cmake BEGIN **!!!!")
message (STATUS "!!!!** _HOST_TRIPLET: '${_HOST_TRIPLET}' **!!!!")
message (STATUS "!!!!** CMAKE_CURRENT_LIST_DIR: '${CMAKE_CURRENT_LIST_DIR}' **!!!!")
message (STATUS "!!!!** CURRENT_PACKAGES_DIR: '${CURRENT_PACKAGES_DIR}' **!!!!")
message (STATUS "!!!!** CURRENT_PORT_DIR: '${CURRENT_PORT_DIR}' **!!!!")
message (STATUS "!!!!** CURRENT_INSTALLED_DIR: '${CURRENT_INSTALLED_DIR}' **!!!!")
message (STATUS "!!!!** PORT: '${PORT}' **!!!!")
message (STATUS "!!!!** PACKAGE_NAME: '${PACKAGE_NAME}' **!!!!")
message (STATUS "!!!!** VCPKG_INSTALLED_DIR: '${VCPKG_INSTALLED_DIR}' **!!!!")
message (STATUS "!!!!** BEGIN matterf-cmake BEGIN **!!!!")

file (INSTALL 
	"${CMAKE_CURRENT_LIST_DIR}/matterfi_config.cmake"
	DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
)

set (VCPKG_POLICY_EMPTY_PACKAGE enabled)

message (STATUS "!!!!** END matterf-cmake END **!!!!")
