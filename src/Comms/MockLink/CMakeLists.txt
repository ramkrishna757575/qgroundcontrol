if(CMAKE_BUILD_TYPE STREQUAL "Debug")
    target_sources(${CMAKE_PROJECT_NAME}
        PRIVATE
            MockConfiguration.cc
            MockConfiguration.h
            MockLink.cc
            MockLink.h
            MockLinkFTP.cc
            MockLinkFTP.h
            MockLinkWorker.cc
            MockLinkWorker.h
            MockLinkMissionItemHandler.cc
            MockLinkMissionItemHandler.h
    )

    target_link_libraries(${CMAKE_PROJECT_NAME}
        PRIVATE
            Qt6::Core
            Qt6::Positioning
    )

    target_include_directories(${CMAKE_PROJECT_NAME} PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
endif()
