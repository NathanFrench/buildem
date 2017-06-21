include (ExternalProject)                                                                            
include (ExternalSource)
include (BuildSupport)
 
external_git_repo (nghttp2
    HEAD
    https://github.com/nghttp2/nghttp2)

externalproject_add (${nghttp2_NAME}
    PREFIX ${BUILDEM_DIR} 
    GIT_REPOSITORY ${nghttp2_URL}
    GIT_TAG ${nghttp2_TAG}
    UPDATE_COMMAND  ""
    CONFIGURE_COMMAND ${BUILDEM_ENV_STR} ${CMAKE_COMMAND} ${nghttp2_SRC_DIR} 
		-DCMAKE_EXE_LINKER_FLAGS=-L${BUILDEM_LIB_DIR}
        -DCMAKE_POSITION_INDEPENDENT_CODE:BOOL=ON
        -DCMAKE_INSTALL_PREFIX:PATH=${BUILDEM_DIR}
)


