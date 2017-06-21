include (ExternalProject)
include (ExternalSource)
include (BuildSupport)
 
external_git_repo (boringssl
    HEAD
	https://boringssl.googlesource.com/boringssl)
 
ExternalProject_Add(  ${boringssl_NAME}
        PREFIX            ${BUILDEM_DIR}
        GIT_REPOSITORY    ${boringssl_URL}
        GIT_TAG           ${boringssl_TAG}
        UPDATE_COMMAND    "" 
        PATCH_COMMAND     ""
        BUILD_IN_SOURCE   1
        TEST_COMMAND      ""

        CONFIGURE_COMMAND ${BUILDEM_ENV_STR} ${CMAKE_COMMAND} ${boringssl_SRC_DIR} 
            -DCMAKE_EXE_LINKER_FLAGS=-L${BUILDEM_LIB_DIR}
            -DCMAKE_MODULE_LINKER_FLAGS=-L${BUILDEM_LIB_DIR}
            -DCMAKE_INSTALL_PREFIX:PATH=${BUILDEM_DIR}

        BUILD_COMMAND     ${BUILDEM_ENV_STRING} $(MAKE)
        INSTALL_COMMAND ""
)

ExternalProject_add_step(${boringssl_NAME} install_static_library_1
    COMMAND ${CMAKE_COMMAND} -E copy ${boringssl_SRC_DIR}/ssl/libssl.a
        ${BUILDEM_LIB_DIR}/ssl/libssl.a
        COMMENT "install libssl.a"
)

ExternalProject_add_step(${boringssl_NAME} install_static_library_2
    COMMAND ${CMAKE_COMMAND} -E copy ${boringssl_SRC_DIR}/decrepit/libdecrepit.a 
        ${BUILDEM_LIB_DIR}/decrepit/libdecrepit.a 
)

ExternalProject_add_step(${boringssl_NAME} install_static_library_3
    COMMAND ${CMAKE_COMMAND} -E copy ${boringssl_SRC_DIR}/crypto/libcrypto.a
        ${BUILDEM_LIB_DIR}/crypto/libcrypto.a
)


        


