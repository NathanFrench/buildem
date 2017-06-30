include (ExternalProject)
include (ExternalSource)
include (BuildSupport)

external_git_repo (libevent
    HEAD
    http://www.github.com/libevent/libevent)

ExternalProject_Add(  ${libevent_NAME}
        PREFIX            ${BUILDEM_DIR}
        GIT_REPOSITORY    ${libevent_URL}
        GIT_TAG           ${libevent_TAG}
        UPDATE_COMMAND    "" 
        PATCH_COMMAND     "./autogen.sh"
        CONFIGURE_COMMAND ${BUILDEM_ENV_STR}
            ./configure
                --prefix=${BUILDEM_DIR}
       BUILD_COMMAND     ${BUILDEM_ENV_STRING} $(MAKE)
       BUILD_IN_SOURCE   1
       TEST_COMMAND      ""
       INSTALL_COMMAND   ${BUILDEM_ENV_STRING} $(MAKE) install
)


