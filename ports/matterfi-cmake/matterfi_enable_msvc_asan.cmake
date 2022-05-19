#[===[.md:
# Validation matterfi_split_string
Enables or address sanitizer for msvc compiler. Address sanitizer is enabled if MSVC_ENABLE_ASAN variable is set.

## usage:
```
matterfi_enable_msvc_asan(<target_name>)
```
## parameters
### target_name 
Name of the target for which ASAN should be enabled.

#]===]

if (NOT DEFINED __MODULE_MATTERFI_ENABLE_MSVC_ASAN_INLCUDED__)
	set (__MODULE_MATTERFI_ENABLE_MSVC_ASAN_INLCUDED__ 1)

	function (matterfi_enable_msvc_asan _target_name)
		if (NOT DEFINED _target_name)
			message(FATAL_ERROR "Target name not defined.")
		else()
			if (MSVC_ENABLE_ASAN)
				# add sanitizer 
				message (STATUS "${_target_name} build with MSVC ASAN.")
				target_compile_options(${_target_name} PRIVATE
					/fsanitize=address
				)
				target_compile_definitions(${_target_name} PRIVATE
					MSVC_ASAN_ENABLED
				)
			else()
				message (STATUS "${_target_name} build without MSVC ASAN")
			endif()
		endif()
	endfunction(matterfi_enable_msvc_asan)

endif() 		# if (NOT DEFINED __MODULE_MATTERFI_ENABLE_MSVC_ASAN_INLCUDED__)
