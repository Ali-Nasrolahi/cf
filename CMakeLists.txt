cmake_minimum_required(VERSION 3.20)

project(cf C CXX)

add_executable(cf cf.cpp)

find_package(Boost REQUIRED COMPONENTS system)

target_include_directories(cf PRIVATE ${Boost_INCLUDE_DIRS} inc/)
target_link_libraries(cf PRIVATE ${Boost_LIBRARIES} pthread)


