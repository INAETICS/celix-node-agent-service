project(Dummy C)

cmake_minimum_required(VERSION 3.3)
find_package(PkgConfig REQUIRED)
pkg_check_modules(JANSSON REQUIRED jansson)

add_executable(jansson-dummy
    main.c
)
target_link_libraries(jansson-dummy ${JANSSON_LIBRARIES})

install(TARGETS jansson-dummy DESTINATION bin)
