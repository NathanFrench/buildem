include (ExternalProject)                                                                            
include (ExternalSource)
include (BuildSupport)
 
set (CMAKE_INCLUDE_CURRENT_DIR On)

external_git_repo (http_parser
    HEAD
	https://github.com/nodejs/http-parser)
 
ExternalProject_Add(  ${http_parser_NAME}
        PREFIX            ${BUILDEM_DIR}
        GIT_REPOSITORY    ${http_parser_URL}
        GIT_TAG           ${http_parser_TAG}
        UPDATE_COMMAND    "" 
        PATCH_COMMAND     ""
        BUILD_IN_SOURCE   1
        CONFIGURE_COMMAND ""
        BUILD_COMMAND     ${BUILDEM_ENV_STRING} make
        INSTALL_COMMAND
           ${CMAKE_COMMAND} -E copy
           ${http_parser_SRC_DIR}/libhttp_parser.a ${BUILDEM_LIB_DIR};
)
 

ExternalProject_add_step(${http_parser_NAME} install_include
    DEPENDEES install
    COMMAND ${CMAKE_COMMAND} -E copy ${http_parser_SRC_DIR}/http_parser.h ${BUILDEM_INCLUDE_DIR}
)
