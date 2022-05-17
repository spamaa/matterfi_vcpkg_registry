#[===[.md:
# Validation module
This module defines sets of macros which validates if vcpkg, cmake and ports are correctly configured

## matterfi_check_toolchain_file()
Validates if **CMAKE_TOOLCHAIN_FILE** is set and points to existing file.
### usage:
```
mattefri_check_toolchain_file()
```

## matterfi_check_triplets_location()
Validates if triplets directory is set and points to existing directory. This macro should be used only for top level projects.
### usage:
```
matterfi_check_triplets_location()
```


## matterfi_check_triplet_file()
Validates if triplet is set and points to exsiting file. This macro should be used only for top level projects
### usage:
```
matterfi_check_triplet_file()
```

## matterfi_check_triplet_is_set()
Validates if triplet is set. Use this macro instead of '''matterfi_check_triplets_location''' and '''matterfi_check_triplet_file''' for library project or project which become dependency to other project
### usage:
```
matterfi_check_triplet_is_set()
```

### matterfi_check_vcpkg_modes()
Validates if manifest and registries mode is enabled.
### usage:
```
matterfi_check_vcpkg_modes()
```

#]===]

if (NOT DEFINED __MODULE_MATTERFI_VALIDATE_INCLUDED__)
	set (__MODULE_MATTERFI_VALIDATE_INCLUDED__ 1)
	message (DEBUG "'${CMAKE_CURRENT_LIST_FILE}' included".)
	
	macro (matterfi_check_toolchain_file)
		if (NOT DEFINED  CMAKE_TOOLCHAIN_FILE)
			message (FATAL_ERROR "!!!! VCPKG INTEGRATION IS NOT ENABLED !!!!")
		else()
			if (NOT EXISTS "${CMAKE_TOOLCHAIN_FILE}")
				message (FATAL_ERROR "!!!! cmake toolchain file does not exists: '${CMAKE_TOOLCHAIN_FILE}' !!!!")
			else()
				message (STATUS "Using cmake toolchain file: '${CMAKE_TOOLCHAIN_FILE}'")
			endif()
		endif()
	endmacro(matterfi_check_toolchain_file)
	
	
	
	macro(matterfi_check_triplets_location)
		if (NOT DEFINED VCPKG_OVERLAY_TRIPLETS)
			message (FATAL_ERROR "!!!! TRIPLET DEFINITION LOCATION IS NOT SPECFIED !!!!")
		else()
			if(NOT IS_DIRECTORY "${VCPKG_OVERLAY_TRIPLETS}")
				message (FATAL_ERROR "!!!! triplets directory not exists: '${VCPKG_OVERLAY_TRIPLETS}' !!!!")
			else()
				message (STATUS "Using triplets from: '${VCPKG_OVERLAY_TRIPLETS}'")
			endif()
		endif()
	endmacro(matterfi_check_triplets_location)


	macro (matterfi_check_triplet_file)
		if (NOT DEFINED VCPKG_TARGET_TRIPLET)
			message (FATAL_ERROR "!!!! TRIPLET TYPE IS NOT SELECTED !!!!")
		elseif(NOT EXISTS "${VCPKG_OVERLAY_TRIPLETS}/${VCPKG_TARGET_TRIPLET}.cmake")
			message (FATAL_ERROR "!!! TRIPLET FILE NOT EXISTS: '${VCPKG_OVERLAY_TRIPLETS}/${VCPKG_TARGET_TRIPLET}.cmake'")
		else()
			message (STATUS "Using triplet: '${VCPKG_TARGET_TRIPLET}'")
		endif()
	endmacro(matterfi_check_triplet_file) 
	
	
	macro (matterfi_check_triplet_is_set)
		if (NOT DEFINED VCPKG_TARGET_TRIPLET)
			message (FATAL_ERROR "!!!! TRIPLET TYPE IS NOT SELECTED !!!!")
		else()
			message (STATUS "Using triplet: '${VCPKG_TARGET_TRIPLET}'")
		endif()
	endmacro(matterfi_check_triplet_is_set)
	
	
	macro (matterfi_check_vcpkg_modes)
		if (NOT DEFINED VCPKG_FEATURE_FLAGS)
			message (FATAL_ERROR "!!!! VCPKG manifest and register mode is not enabled !!!!")
		else()
			matterfi_split_string(_features_flags "," ${VCPKG_FEATURE_FLAGS})
			list(FIND _features_flags "registries" _idx)
			if (${_idx} LESS 0)
				message (STATUS "!!!! VCPKG register mode is not enabled !!!!")
			else()
				list (FIND _features_flags "manifest" _idx)
				if (${_idx} LESS 0)
					message (STATUS "!!!! VCPKG manifest mode is not enabled !!!!")
				endif()
			endif()
			message (STATUS "!!!!@@ _idx: '${_idx}' @@!!!!")
		endif()
	endmacro(matterfi_check_vcpkg_modes)

endif() 	# (NOT DEFINED __MODULE_MATTERFI_VALIDATE_INCLUDED__)