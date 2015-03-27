#
# Install libdvidcpp library from source
#
if (NOT libdvidcpp_NAME)

CMAKE_MINIMUM_REQUIRED(VERSION 2.8)

include (ExternalProject)
include (ExternalSource)
include (BuildSupport)

include (cppnetlib)


set(DEFAULT_LIBDVID_VERSION "df9ae21dc5ef24c8396e46c66e4d7db893376e93") # 2014-10-05
set(LIBDVID_VERSION "${DEFAULT_LIBDVID_VERSION}")

external_git_repo (libdvidcpp
    ${LIBDVID_VERSION}
    http://github.com/janelia-flyem/libdvidcpp)

# set libs and include
set (LIBDVIDCPP_LIBRARIES ${BUILDEM_DIR}/lib/libdvidcpp.a)
set (LIBDVIDCPP_INCLUDE_DIRS ${BUILDEM_DIR}/include/libdvid)

message ("Installing ${libdvidcpp_NAME} into FlyEM build area: ${BUILDEM_DIR} ...")
ExternalProject_Add(${libdvidcpp_NAME}
    DEPENDS             ${cppnetlib_NAME}
    PREFIX              ${BUILDEM_DIR}
    GIT_REPOSITORY      ${libdvidcpp_URL}
    GIT_TAG             ${libdvidcpp_TAG}
    UPDATE_COMMAND      ""
    PATCH_COMMAND       ""       
    LIST_SEPARATOR      ^^
    CONFIGURE_COMMAND   ${BUILDEM_ENV_STRING} ${CMAKE_COMMAND} ${libdvidcpp_SRC_DIR} 
        -DCMAKE_INSTALL_PREFIX=${BUILDEM_DIR}
        -DCMAKE_PREFIX_PATH=${BUILDEM_DIR}
        -DCMAKE_EXE_LINKER_FLAGS=${BUILDEM_LDFLAGS}
        -DDEPENDENCY_SEARCH_PREFIX=${BUILDEM_DIR}
        -DCMAKE_CXX_FLAGS_RELEASE=-O3
        -DCMAKE_CXX_FLAGS_DEBUG="${CMAKE_CXX_FLAGS_DEBUG}"
    BUILD_COMMAND       ${BUILDEM_ENV_STRING} $(MAKE)
    INSTALL_COMMAND     ${BUILDEM_ENV_STRING} $(MAKE) install
)

set_target_properties(${libdvidcpp_NAME} PROPERTIES EXCLUDE_FROM_ALL ON)

endif (NOT libdvidcpp_NAME)
