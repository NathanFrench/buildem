#https://github.com/NLnetLabs/ldns.git

include (ExternalProject)
include (ExternalSource)
include (BuildSupport)

external_git_repo (libldns
    HEAD
    https://github.com/NLnetLabs/ldns)


ExternalProject_Add( ${libldns_NAME}
    PREFIX ${BUILDEM_DIR}
    GIT_REPOSITORY ${libldns_URL}
    GIT_TAG ${libldns_TAG}
    UPDATE_COMMAND ""
    PATCH_COMMAND libtoolize -c --install && autoreconf --install
    CONFIGURE_COMMAND ${BUILDEM_ENV_STR} ./configure --enable-shared --disable-static
    --prefix=${TSAUDITD_DEPS_INSTALL} --disable-dependency-tracking
    --disable-ldns-config --disable-sha2 --disable-gost --disable-ecdsa
    --disable-dane --enable-draft-rrtypes --without-pyldnsx
    BUILD_COMMAND ${BUILDEM_ENV_STRING} $(MAKE)
    TEST_COMMAND ""
    INSTALL_COMMAND ${BUILDEM_ENV_STRING} $(MAKE) install
)




