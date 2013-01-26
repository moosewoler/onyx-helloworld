cmake_minimum_required (VERSION 2.6)
# Project.
project (onyx-helloworld)

# Additional cmake modules
set     (CMAKE_MODULE_PATH  "${CMAKE_SOURCE_DIR}/cmake_modules")

# pre-configure
include (mymacro)
PRE_CONFIGURE()

# config source code
add_subdirectory(src/wpa)
add_subdirectory(src)
