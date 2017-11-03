## assert.cmake
##
## Copyright (c) 2017 ChienYu Lin
##
## Author: ChienYu Lin <cy20lin@gmail.com>
## License: MIT
##

function(assert_strequal a b)
  if(NOT "${a}" STREQUAL "${b}")
    message(FATAL_ERROR "assert_strequal(\"${a}\" \"${b}\")")
  endif()
endfunction()

function(assert_not_empty a)
  if("${a}" STREQUAL "")
    message(FATAL_ERROR "assert_not_empty(\"${a}\")")
  endif()
endfunction()

function(assert_is_dec_uint a)
  if(NOT "${a}" MATCHES "^[0-9]+$")
    message(FATAL_ERROR "assert_is_dec_uint(\"${a}\")")
  endif()
endfunction()
