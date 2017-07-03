include (ExternalProject)
include (ExternalSource)
include (BuildSupport)

external_git_repo (yuck
    HEAD
    https://github.com/hroptatyr/yuck) 

ExternalProject_Add(  ${yuck_NAME}
        PREFIX            ${BUILDEM_DIR}
        GIT_REPOSITORY    ${yuck_URL}
        GIT_TAG           ${yuck_TAG}
        UPDATE_COMMAND    "" 
        PATCH_COMMAND     autoreconf -fi 
        CONFIGURE_COMMAND ${BUILDEM_ENV_STR}
            ./configure
                --prefix=${BUILDEM_DIR}
       BUILD_COMMAND     ${BUILDEM_ENV_STRING} $(MAKE)
       BUILD_IN_SOURCE   1
       TEST_COMMAND      ""
       INSTALL_COMMAND   ${BUILDEM_ENV_STRING} $(MAKE) install
)


