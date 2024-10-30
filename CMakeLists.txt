cmake_minimum_required(VERSION 3.21)

project(just-rocksdb
    VERSION 0.0.1
    DESCRIPTION "read rocksdb source code"
    LANGUAGES CXX
)

if (CMAKE_VERSION VERSION_GREATER_EQUAL "3.24.0")
    cmake_policy(SET CMP0135 NEW)
endif()

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED true)
set(CMAKE_EXPORT_COMPILE_COMMANDS true)

set(CMAKE_BUILD_TYPE Release)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/bin)
# set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/bin)
# set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/bin)

# rocksdb lib
set(WITH_GFLAGS ON CACHE INTERNAL "")
set(WITH_TESTS ON CACHE INTERNAL "")
set(FAIL_ON_WARNINGS ON CACHE INTERNAL "")
set(WITH_BENCHMARK_TOOLS OFF CACHE INTERNAL "")
set(WITH_CORE_TOOLS ON CACHE INTERNAL "")
set(WITH_TOOLS ON CACHE INTERNAL "")
add_subdirectory(rocksdb)
include_directories(rocksdb/include)

# append libs
list(APPEND EXTERNAL_LIBS rocksdb)

# src
function(create_executable_file TARGET_NAME)
    add_executable(${TARGET_NAME} src/${TARGET_NAME}.cc)
    target_link_libraries(${TARGET_NAME} PUBLIC ${EXTERNAL_LIBS})
    target_include_directories(${TARGET_NAME} PUBLIC ${PROJECT_SOURCE_DIR}/src/include)
endfunction()

file(GLOB SRC_FILES ${PROJECT_SOURCE_DIR}/src/*.cc)
foreach(SRC_FILE ${SRC_FILES})
    get_filename_component(SRC_NAME ${SRC_FILE} NAME_WE)
    create_executable_file(${SRC_NAME})
endforeach()