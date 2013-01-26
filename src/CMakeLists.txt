ENABLE_QT()

add_executable          (hello_world.oar hello_world.cpp)
target_link_libraries   (hello_world.oar onyx_screen onyxapp onyx_sys onyx_data onyx_wpa ${QT_LIBRARIES})
#set_target_properties(hello_world.oar PROPERTIES  RUNTIME_OUTPUT_DIRECTORY ${TEST_OUTPUT_PATH})

