## version_stamp_generate.cmake
##
## Copyright (c) 2017 ChienYu Lin
##
## Author: ChienYu Lin <cy20lin@gmail.com>
## License: MIT
##

include("${CMAKE_CURRENT_LIST_DIR}/bignum_dec2hex.cmake")

function(version_stamp_generate stamp)
  execute_process(
    COMMAND git rev-parse --short HEAD
    OUTPUT_VARIABLE head_id)
  string(REPLACE "\n" "" head_id "${head_id}")

  execute_process(
    COMMAND date "+%s;%3N"
    OUTPUT_VARIABLE time)
  string(REPLACE "\n" "" time "${time}")
  list(GET time 0 sec)
  list(GET time 1 ms)

  if(NOT "${sec}" MATCHES "^[0-9]+$")
    cmake_minimum_required(VERSION 3.6)
    string(TIMESTAMP sec "%s" UTC)
  endif()

  if(NOT "${ms}" MATCHES "^[0-9][0-9][0-9]$")
    string(RANDOM LENGTH 3 ALPHABET "0123456789" ms)
  endif()

  set(dec_timestamp "${sec}${ms}")
  bignum_dec2hex("${dec_timestamp}" hex_timestamp)

  set(pattern "")
  foreach(i RANGE 1 11)
    set(pattern "${pattern}[0-9a-f]")
  endforeach()
  set(pattern "${pattern}+")

  if(NOT "${hex_timestamp}" MATCHES "${pattern}")
    message(FATAL_ERROR "Generating hex_timestamp failed (with value=\"${hex_timestamp}\").")
  endif()

  set(pattern "")
  foreach(i RANGE 1 7)
    set(pattern "${pattern}[0-9a-f]")
  endforeach()

  if(NOT "${head_id}" MATCHES "${pattern}")
    message(FATAL_ERROR "Generating head_id failed.")
  endif()

  set("${stamp}" "${hex_timestamp}-${head_id}" PARENT_SCOPE)
endfunction()
