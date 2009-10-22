if (WIN32 AND ${CMAKE_C_COMPILER} MATCHES /bin/gcc.exe)
    SET(CYGWIN 1)
else()
    SET(CYGWIN 0)
endif()

IF (CMAKE_GENERATOR MATCHES "Visual Studio")
    SET(MSVC 1)
ELSE()
    SET(MSVC 0)
ENDIF ()

IF(NOT VIGRA_DEFAULTS_INIT)
    SET(VIGRA_DEFAULTS_INIT TRUE CACHE INTERNAL "initial flags set")

    IF (NOT MSVC AND NOT CMAKE_BUILD_TYPE)
        SET(CMAKE_BUILD_TYPE "Release"
            CACHE STRING "Choose the type of build, options are None Release Debug RelWithDebInfo MinSizeRel." FORCE)
    ENDIF ()

    IF(NOT DEFINED DEPENDENCY_SEARCH_PREFIX)
        SET(DEPENDENCY_SEARCH_PREFIX "")
    ENDIF()    
    SET(DEPENDENCY_SEARCH_PREFIX ${DEPENDENCY_SEARCH_PREFIX}
        CACHE PATH "additional search prefixes (used by Find... macros)"
        FORCE)
    
    IF(NOT DEFINED WITH_VIGRANUMPY)
        SET(WITH_VIGRANUMPY "ON")
    ENDIF()
    SET(WITH_VIGRANUMPY ${WITH_VIGRANUMPY}
        CACHE BOOL "Build VIGRA Python bindings"
        FORCE)
    
#    # initial compiler flags can be set here, this is only
#    # executed once in the first configure run.
#    IF(CMAKE_COMPILER_IS_GNUCXX)
#        IF(NOT CMAKE_C_FLAGS)
#            SET(CMAKE_C_FLAGS
#                "-W -Wall"
#                CACHE STRING
#                "Flags used by the compiler during all build types."
#                FORCE
#            )
#        ENDIF(NOT CMAKE_C_FLAGS)
#        IF(NOT CMAKE_CXX_FLAGS)
#            SET(CMAKE_CXX_FLAGS
#                "-W -Wall"
#                CACHE STRING
#                "Flags used by the compiler during all build types."
#                FORCE
#            )
#        ENDIF(NOT CMAKE_CXX_FLAGS)
#    ENDIF(CMAKE_COMPILER_IS_GNUCXX)
ENDIF(NOT VIGRA_DEFAULTS_INIT)

