include (ExternalProject)
include (ExternalSource)
include (BuildSupport)
 
external_git_repo (tclap
    tclap-1-2-1-release-final
    http://git.code.sf.net/p/tclap/code)

externalproject_add (${tclap_NAME}
    PREFIX            ${BUILDEM_DIR}
    GIT_REPOSITORY    ${tclap_URL}
    GIT_TAG           ${tclap_TAG}
    UPDATE_COMMAND    ""
    BUILD_IN_SOURCE   1
    PATCH_COMMAND     ./autotools.sh && mkdir ${tclap_SRC_DIR}/docs/html
    CONFIGURE_COMMAND ${BUILDEM_ENV_STR} ${tclap_SRC_DIR}/configure --prefix=${BUILDEM_DIR}
    BUILD_COMMAND     ${BULDEM_ENV_STRING} make 
    INSTALL_COMMAND   ${BUILDEM_ENV_STRING} make install
)



