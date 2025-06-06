target_sources(${CMAKE_PROJECT_NAME}
    PRIVATE
        Joystick.cc
        Joystick.h
        JoystickManager.cc
        JoystickManager.h
)

target_include_directories(${CMAKE_PROJECT_NAME} PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})

if(ANDROID)
    target_sources(${CMAKE_PROJECT_NAME}
        PRIVATE
            JoystickAndroid.cc
            JoystickAndroid.h
    )
    return()
endif()

target_sources(${CMAKE_PROJECT_NAME}
    PRIVATE
        JoystickSDL.cc
        JoystickSDL.h
)

target_compile_definitions(${CMAKE_PROJECT_NAME} PRIVATE QGC_SDL_JOYSTICK SDL_MAIN_HANDLED)

#===========================================================================#

CPMAddPackage(
    NAME sdl_gamecontrollerdb
    GITHUB_REPOSITORY mdqinc/SDL_GameControllerDB
    GIT_TAG master
)

set_source_files_properties(${sdl_gamecontrollerdb_SOURCE_DIR}/gamecontrollerdb.txt PROPERTIES QT_RESOURCE_ALIAS gamecontrollerdb.txt)

qt_add_resources(${CMAKE_PROJECT_NAME} "gamecontrollerdb.txt"
    PREFIX "/db/mapping/joystick"
    FILES ${sdl_gamecontrollerdb_SOURCE_DIR}/gamecontrollerdb.txt
)

#===========================================================================#

if(WIN32)
    set(SDL2_EXTRA_OPTIONS
        "SDL_DIRECTX OFF"
        "SDL_XINPUT ON"
    )
endif()

CPMAddPackage(
    NAME SDL2
    VERSION 2.32.4
    GITHUB_REPOSITORY libsdl-org/SDL
    GIT_TAG release-2.32.4
    OPTIONS
        "SDL2_DISABLE_INSTALL ON"
        "SDL2_DISABLE_INSTALL ON"
        "SDL2_DISABLE_UNINSTALL ON"
        "SDL2_DISABLE_SDL2MAIN ON"
        "SDL_SHARED OFF"
        "SDL_STATIC ON"
        "SDL_TEST OFF"
        "SDL_ATOMIC ON"
        "SDL_AUDIO OFF"
        "SDL_CPUINFO ON"
        "SDL_EVENTS ON"
        "SDL_FILE OFF"
        "SDL_FILESYSTEM OFF"
        "SDL_HAPTIC ON"
        "SDL_HIDAPI ON"
        "SDL_JOYSTICK ON"
        "SDL_LOADSO ON"
        "SDL_LOCALE OFF"
        "SDL_MISC OFF"
        "SDL_POWER ON"
        "SDL_RENDER OFF"
        "SDL_SENSOR OFF"
        "SDL_THREADS ON"
        "SDL_TIMERS OFF"
        "SDL_VIDEO OFF"
        "SDL_3DNOW OFF"
        "SDL_DBUS OFF"
        "SDL_IBUS OFF"
        "SDL_MMX OFF"
        "SDL_VIRTUAL_JOYSTICK ON"
        "${SDL2_EXTRA_OPTIONS}"
)

target_compile_definitions(SDL2-static PRIVATE SDL_MAIN_HANDLED)
target_link_libraries(${CMAKE_PROJECT_NAME} PRIVATE SDL2::SDL2-static)

# Default list of config overrides - TODO: Add to Custom Build Options
# set(ENV{SDL_GAMECONTROLLERCONFIG}

# )
