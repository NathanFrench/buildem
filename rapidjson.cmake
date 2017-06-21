include (ExternalProject)                                                                            
include (ExternalSource)
include (BuildSupport)
 
external_git_repo (rapidjson
    HEAD
    https://github.com/miloyip/rapidjson)
    

externalproject_add (${rapidjson_NAME}
    PREFIX ${BUILDEM_DIR} 
    GIT_REPOSITORY ${rapidjson_URL}
    GIT_TAG ${rapidjson_TAG}
    UPDATE_COMMAND  ""
    CONFIGURE_COMMAND ${BUILDEM_ENV_STR} ${CMAKE_COMMAND} ${rapidjson_SRC_DIR} 
		-DCMAKE_EXE_LINKER_FLAGS=-L${BUILDEM_LIB_DIR}
        -DCMAKE_POSITION_INDEPENDENT_CODE:BOOL=ON
        -DCMAKE_INSTALL_PREFIX:PATH=${BUILDEM_DIR}
)


