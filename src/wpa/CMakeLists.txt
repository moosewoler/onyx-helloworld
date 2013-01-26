if (WIN32)
    set(SRC wpa_ctrl.c os_win32.c)
else (WIN32)
    set(SRC wpa_ctrl.c os_unix.c)
endif (WIN32)

add_library(onyx_wpa ${SRC})
strict_warning(onyx_wpa)
