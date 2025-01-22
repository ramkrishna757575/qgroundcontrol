set(BUNDLE_PATH ${CMAKE_BINARY_DIR}/staging/${TARGET_NAME}.app)


message(STATUS "Creating Mac DMG")
file(REMOVE_RECURSE ${CMAKE_BINARY_DIR}/package)
file(MAKE_DIRECTORY ${CMAKE_BINARY_DIR}/package)
file(COPY ${BUNDLE_PATH} DESTINATION ${CMAKE_BINARY_DIR}/package)
execute_process(COMMAND create-dmg --volname "${TARGET_NAME}" --filesystem "APFS" "${TARGET_NAME}.dmg" "${CMAKE_BINARY_DIR}/package/")
