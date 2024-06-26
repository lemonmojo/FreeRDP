#
# Find OSS include header for Unix platforms.
# used by FQTerm to detect the availability of OSS.

IF(UNIX)
  IF(CMAKE_SYSTEM_NAME MATCHES "Linux")
	set(PLATFORM_PREFIX "linux/")
  ELSEIF(CMAKE_SYSTEM_NAME MATCHES "FreeBSD")
	set(PLATFORM_PREFIX "sys/")
  ELSEIF(CMAKE_SYSTEM_NAME MATCHES "OpenBSD")
	set(PLATFORM_PREFIX "machine/")
  ENDIF()
ENDIF(UNIX)

set(OSS_HDR_NAME "${PLATFORM_PREFIX}soundcard.h" CACHE STRING "oss header include file name")
FIND_PATH(OSS_INCLUDE_DIRS ${OSS_HDR_NAME}
  PATHS
	"/usr/local/include"
  PATH_SUFFIXES
	${PLATFORM_SUFFIX}
)

IF(OSS_INCLUDE_DIRS)
  SET(OSS_FOUND ON CACHE BOOL "oss detection status")
ELSE(OSS_INCLUDE_DIRS)
  SET(OSS_FOUND OFF CACHE BOOL "oss detection status")
ENDIF(OSS_INCLUDE_DIRS)

IF(OSS_FOUND)
  MESSAGE(STATUS "Found OSS Audio")
ELSE(OSS_FOUND)
  IF(OSS_FIND_REQUIRED)
    MESSAGE(FATAL_ERROR "FAILED to found Audio - REQUIRED")
  ELSE(OSS_FIND_REQUIRED)
    MESSAGE(STATUS "Audio Disabled")
  ENDIF(OSS_FIND_REQUIRED)
ENDIF(OSS_FOUND)

MARK_AS_ADVANCED (
  OSS_FOUND
  OSS_HDR_NAME
  OSS_INCLUDE_DIRS
)
