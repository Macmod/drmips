cmake_minimum_required(VERSION 2.8)
project(DrMIPS NONE)

# Configurations
set(DRMIPS_SHARE_DIR share/drmips CACHE STRING "Where to install program data and resources (relative to CMAKE_INSTALL_PREFIX)")
set(DRMIPS_DOC_DIR share/doc/drmips CACHE STRING "Where to install the documentation (relative to CMAKE_INSTALL_PREFIX)")
set(DRMIPS_MANUALS_DIR "${DRMIPS_DOC_DIR}/manuals")
set(DRMIPS_MANUALS_DIR_ABSOLUTE "${CMAKE_INSTALL_PREFIX}/${DRMIPS_MANUALS_DIR}")
set(DRMIPS_JAVADOC_DIR "${DRMIPS_DOC_DIR}/javadoc")
set(DRMIPS_DIST_BUILD_DIR "${CMAKE_BINARY_DIR}/dist")
set(DRMIPS_ZIP_BUILD_DIR "${DRMIPS_DIST_BUILD_DIR}/${PROJECT_NAME}")
option(DRMIPS_BUILD_PC_VERSION "Build and install the PC version of the simulator?" ON)
option(DRMIPS_BUILD_ANDROID_VERSION "Build and install the Android version of the simulator?" OFF)
option(DRMIPS_BUILD_SIMULATOR_JAVADOC "Build and install the Java API documentation of the simulation logic?" OFF)
if(DRMIPS_BUILD_PC_VERSION OR DRMIPS_BUILD_ANDROID_VERSION OR DRMIPS_BUILD_SIMULATOR_JAVADOC)
	set(DRMIPS_BUILD_SIMULATOR ON)
else()
	set(DRMIPS_BUILD_SIMULATOR OFF)
endif()
# force javac to use UTF-8 encoding and set JDK/JRE 7 as the target
set(CMAKE_JAVA_COMPILE_FLAGS -encoding UTF-8 -source 1.7 -target 1.7)

# Include required CMake modules and programs
set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/Modules")
if(DRMIPS_BUILD_SIMULATOR)
	# Find Java
	find_package(Java REQUIRED)
	include(UseJava)

	# Find JUnit
	find_file(JUNIT_PATH NAMES junit4.jar PATHS "${JAVA_LIB_INSTALL_DIR}" /usr/share/java
		                 DOC "Path to the JUnit library.")
	mark_as_advanced(JUNIT_PATH)
	if(JUNIT_PATH)
		option(DRMIPS_BUILD_TESTS "Build the unit tests of the simulator and enable testing?" ON)
		message(STATUS "Found JUnit: ${JUNIT_PATH}")
	else()
		message(WARNING "JUnit not found.")
	endif()
endif()

if(DRMIPS_BUILD_ANDROID_VERSION)
	# Find Android tools
	find_package(Android REQUIRED)
endif()

# Subdirectories
add_subdirectory(doc/manuals)
if(DRMIPS_BUILD_SIMULATOR)
	add_subdirectory(src/simulator/DrMIPSSimulator)
endif()
if(DRMIPS_BUILD_PC_VERSION)
	add_subdirectory(src/pc/DrMIPS)
endif()
if(DRMIPS_BUILD_ANDROID_VERSION)
	add_subdirectory(src/android/DrMIPS)
endif()

# Uninstall target
configure_file("${CMAKE_CURRENT_SOURCE_DIR}/cmake/cmake_uninstall.cmake.in"
               "${CMAKE_CURRENT_BINARY_DIR}/cmake/cmake_uninstall.cmake" IMMEDIATE @ONLY)
add_custom_target(uninstall COMMAND ${CMAKE_COMMAND} -P "${CMAKE_CURRENT_BINARY_DIR}/cmake/cmake_uninstall.cmake")

# Distribution target
if(DRMIPS_BUILD_PC_VERSION)
	add_custom_command(OUTPUT "${DRMIPS_DIST_BUILD_DIR}/${PROJECT_NAME}.zip"
	                   COMMAND "${Java_JAR_EXECUTABLE}" cfM "${DRMIPS_DIST_BUILD_DIR}/${PROJECT_NAME}.zip"
	                           -C "${DRMIPS_DIST_BUILD_DIR}" "${PROJECT_NAME}"
	                   DEPENDS pc_version COMMENT "Creating ZIP file for distribution of the PC version")
	add_custom_target(dist DEPENDS "${DRMIPS_DIST_BUILD_DIR}/${PROJECT_NAME}.zip")
endif()
