macro       (PRE_CONFIGURE)
# set up cmake variables
set         (BUILD_FOR_ARM      ON)
set         (ONYX_SDK_ROOT      "/opt/onyx/arm")
set         (USE_CORTEX_A8      ON)
set         (LINK_ZLIB_DEFAULT  ON)
#enable_testing()

# Check to use arm toolchain or not
IF(BUILD_FOR_ARM)
    include (arm_toolchain)
    USE_ARM_TOOLCHAIN()
ENDIF(BUILD_FOR_ARM)

IF(UNIX OR BUILD_FOR_ARM)
    ADD_DEFINITIONS(-DSHARE_ROOT="/usr/share")
ELSE (UNIX OR BUILD_FOR_ARM)
    ADD_DEFINITIONS(-DSHARE_ROOT="")
    ADD_DEFINITIONS(-D_CRT_SECURE_NO_WARNINGS)
ENDIF (UNIX OR BUILD_FOR_ARM)

add_definitions(-DCONFIG_CTRL_IFACE)
add_definitions(-DCONFIG_CTRL_IFACE_UNIX)

include     (strict_warning)

# Project include directories.
include_directories(BEFORE
    #${CMAKE_SOURCE_DIR}/code/include
    #${CMAKE_SOURCE_DIR}/third_party/gtest/include
    ${CMAKE_SOURCE_DIR}/src/include
    ${CMAKE_FIND_ROOT_PATH}/include
)

# Find thread library for the current platform
include(FindThreads)
include(enable_qt)
include(qt4_wrap_ts)
include(onyx_test)
include(misc)
include(tc)

message (STATUS "QT_LIBRARY_DIR is set to ${QT_LIBRARY_DIR}")
link_directories (${QT_LIBRARY_DIR})

# Output directories.
set     (EXECUTABLE_OUTPUT_PATH ${PROJECT_BINARY_DIR}/bin)
set     (LIBRARY_OUTPUT_PATH    ${PROJECT_BINARY_DIR}/libs)
set     (TEST_OUTPUT_PATH       ${PROJECT_BINARY_DIR}/unittests)
set     (QT_PLUGINS_OUTPUT_PATH ${PROJECT_BINARY_DIR}/plugins)


endmacro    (PRE_CONFIGURE)
