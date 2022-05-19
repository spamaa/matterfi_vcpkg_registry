#[===[.md:
# Set appropiate runtime type for msvc compilation.
At msvc compilation, compilation type for all libs must be the same as for executable. This function sets compilation appropiate to triplet type to one of the following:
- MultiThreaded
- MultiThreadedDLL
- MultiThreadedDebug
- MultiThreadedDebugDLL
This function does nothing if not msvc compilation.


## usage:
```
matterfi_set_msvc_type(<target_name>)
```
## parameters
### target_name 
Name of the target.

#]===]

function (matterfi_set_msvc_type _target_name)
	if (MSVC)
		# set proper runtime type for msvc
		set (MSVC_RUNTIME_TYPE)
		if (NOT DEFINED VCPKG_TARGET_TRIPLET)
			message (FATAL_ERROR "Unknown vcpkg triplet: '${VCPKG_LIBRARY_LINKAGE}'")
		else()
			if (CMAKE_BUILD_TYPE STREQUAL "Debug")
				set (MSVC_RUNTIME_TYPE MultiThreadedDebug)
			elseif (CMAKE_BUILD_TYPE STREQUAL "Release")
				set (MSVC_RUNTIME_TYPE MultiThreaded)
			else()
				message (FATAL_ERROR "Unsupported CMAKE_BUILD_TYPE: '${CMAKE_BUILD_TYPE}'")
			endif()
			 message (STATUS "Using triplet: '${VCPKG_TARGET_TRIPLET}' for target: '${_target_name}'")
		endif()

		# set compilation type for windows
		# see: https://cmake.org/cmake/help/latest/prop_tgt/MSVC_RUNTIME_LIBRARY.html 
		# for more options
		message (STATUS "Setting MSVC runtime type to: '${MSVC_RUNTIME_TYPE}' for target: '${_target_name}'")
		set_target_properties(${_target_name} PROPERTIES
				MSVC_RUNTIME_LIBRARY ${MSVC_RUNTIME_TYPE}
		)
	endif()
endfunction(matterfi_set_msvc_type)

