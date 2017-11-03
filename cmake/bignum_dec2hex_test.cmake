## bignum_dec2hex_test.cmake
##
## Copyright (c) 2017 ChienYu Lin
##
## Author: ChienYu Lin <cy20lin@gmail.com>
## License: MIT
##

include("${CMAKE_CURRENT_LIST_DIR}/bignum_dec2hex.cmake")

function(test_bignum_dec2hex dec hex)
  bignum_dec2hex("${dec}" o)
  assert_strequal("${o}" "${hex}")
endfunction()

function(bignum_dec2hex_test)
  test_bignum_dec2hex(340282366920938463463374607431768211455 ffffffffffffffffffffffffffffffff)
  test_bignum_dec2hex(4294967296 100000000)
  test_bignum_dec2hex(12379813738877118345 abcdef0123456789)
  test_bignum_dec2hex(1234567890987654321 112210f4b16c1cb1)
  test_bignum_dec2hex(16 10)
  test_bignum_dec2hex(0 0)
  test_bignum_dec2hex(5 5)
  test_bignum_dec2hex(10 a)
  test_bignum_dec2hex(65535 ffff)
  test_bignum_dec2hex(65536 10000)
endfunction()

bignum_dec2hex_test()
