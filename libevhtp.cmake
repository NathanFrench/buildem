include (ExternalProject)
include (ExternalSource)
include (BuildSupport)

if (NOT libevhtp_NAME)

external_git_repo (libevhtp
    HEAD
    https://github.com/criticalstack/libevhtp) 

ExternalProject_Add(${libevhtp_NAME}
        PREFIX            ${BUILDEM_DIR}
        GIT_REPOSITORY    ${libevhtp_URL}
        GIT_TAG           ${libevhtp_TAG}
        UPDATE_COMMAND    "" 
        BUILD_IN_SOURCE 1
       TEST_COMMAND      ""
     CONFIGURE_COMMAND ${BUILDEM_ENV_STR} ${CMAKE_COMMAND} ${nghttp2_SRC_DIR} 
		-DCMAKE_EXE_LINKER_FLAGS=-L${BUILDEM_LIB_DIR}
        -DCMAKE_INSTALL_PREFIX:PATH=${BUILDEM_DIR}
)

endif()
