cmake_minimum_required(VERSION 3.21)

project(rocksdb_study
    VERSION 0.0.1
    DESCRIPTION "Study rocksdb"
    LANGUAGES CXX
)

if (CMAKE_VERSION VERSION_GREATER_EQUAL "3.24.0")
    cmake_policy(SET CMP0135 NEW)
endif()

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED true)
set(CMAKE_EXPORT_COMPILE_COMMANDS true)

set(CMAKE_BUILD_TYPE Debug)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/bin)
# set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/bin)
# set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/bin)

# Rocksdb
set(WITH_GFLAGS OFF CACHE INTERNAL "")
set(WITH_TESTS OFF CACHE INTERNAL "")
set(FAIL_ON_WARNINGS OFF CACHE INTERNAL "")
set(WITH_BENCHMARK_TOOLS OFF CACHE INTERNAL "")
set(WITH_CORE_TOOLS OFF CACHE INTERNAL "")
set(WITH_TOOLS OFF CACHE INTERNAL "")
add_subdirectory(rocksdb)
include_directories(rocksdb/include)

# APPEND LIBS
list(APPEND EXTERNAL_LIBS rocksdb)

# SRC
add_executable(main src/main.cc)
target_link_libraries(main ${EXTERNAL_LIBS})
target_include_directories(main PUBLIC ${PROJECT_SOURCE_DIR}/src/include)