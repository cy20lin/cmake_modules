## version_stamp_generate_test.cmake
##
## Copyright (c) 2017 ChienYu Lin
##
## Author: ChienYu Lin <cy20lin@gmail.com>
## License: MIT
##

include("${CMAKE_CURRENT_LIST_DIR}/version_stamp_generate.cmake")

version_stamp_generate(stamp)
message("${stamp}")
