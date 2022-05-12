#include("${CMAKE_CURRENT_LIST_DIR}/../vcpkg-cmake/vcpkg-port-config.cmake")

message (STATUS "!!!!** BEGIN matterf-cmake BEGIN **!!!!")
message (STATUS "!!!!** _HOST_TRIPLET: '${_HOST_TRIPLET}' **!!!!")
message (STATUS "!!!!** CMAKE_CURRENT_LIST_DIR: '${CMAKE_CURRENT_LIST_DIR}' **!!!!")

file (INSTALL 
	"${CMAKE_CURRENT_LIST_DIR}/matterfi_config.cmake"
	DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
)

set (VCPKG_POLICY_EMPTY_PACKAGE enabled)

message (STATUS "!!!!** END matterf-cmake END **!!!!")
