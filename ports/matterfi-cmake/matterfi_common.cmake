#[===[.md:
# Validation module
This module defines common useful general purpose macros and functions

## matterfi_split_string
Splits string in to the list using separator. 
### usage:
```
matterfi_split_string(<out_var> <sep> <in_str>)
```
### parameters
#### out_string 
Name of output variable which will be a list of strings
#### sep
Separator, typically ```" "```.
#### in_str
Input string.


#]===]

if (NOT DEFINED __MODULE_MATTERFI_COMMON_INCLUDED__)
	set (__MODULE_MATTERFI_COMMON_INCLUDED__ 1)
	
    function (matterfi_split_string out_var sep in_str)
        string(REPLACE ${sep} ";" _tmp "${in_str}")
        set (${out_var} "${_tmp}" PARENT_SCOPE)
    endfunction()

endif()		# // if (NOT DEFINED __MODULE_MATTERFI_COMMON_INCLUDED__)
