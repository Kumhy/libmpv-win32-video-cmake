set(LIBRTMP_MAKE_PARAMS "-C librtmp prefix=${MINGW_INSTALL_PREFIX} CROSS_COMPILE=${TARGET_ARCH}- SYS=mingw SHARED=no")

ExternalProject_Add(librtmp
    DEPENDS openssl
    GIT_REPOSITORY "git://git.ffmpeg.org/rtmpdump"
    UPDATE_COMMAND ""
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ${MAKE} clean
    COMMAND ${MAKE} ${LIBRTMP_MAKE_PARAMS}
    INSTALL_COMMAND ${MAKE} ${LIBRTMP_MAKE_PARAMS} install
    BUILD_IN_SOURCE 1
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)

force_rebuild_git(librtmp)
