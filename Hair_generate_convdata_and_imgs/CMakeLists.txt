cmake_minimum_required (VERSION 3.0)
cmake_policy(VERSION 3.0)
project(Hair_generate_convdata_and_imgs)
set(CMAKE_CXX_STANDARD 17) # this does nothing for MSVC, use target_compile_options below
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS ON)
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake/modules/")

file(GLOB Hair_Code hair/*.h hair/*.cpp)

set(SOURCE_FILES main.cpp Renderer.h SimpleVertexShader.vertexshader SimpleFragmentShader.fragmentshader
        TrainingDataGenerator.h ${Hair_Code} HairHelper.h hair/cnpy.h hair/cnpy.cpp)
# link_directories(${CMAKE_SOURCE_DIR}/lib)
find_package(OpenGL REQUIRED)
find_package(GLEW REQUIRED)
find_package(GLFW3 REQUIRED)
find_package( OpenCV REQUIRED )

#find_package(PCL 1.3 REQUIRED COMPONENTS common io)

# Ask the user to give the paths to GLFW, GLEW and GLM.
# On Linux this can be found automatically with pkg-config;
# see http://stackoverflow.com/questions/6889264/cmake-flags-for-opengl-using-glew-and-glfw, for instance.

#set(GLFW_INCLUDE_PATH "" CACHE PATH "The directory that contains GL/glfw.h" )
#set(GLFW_LIBRARY "" CACHE FILEPATH "libglfw.a or glfw.lib" )

#set(GLEW_INCLUDE_PATH "" CACHE PATH "The directory that contains GL/glew.h" )
#set(GLEW_LIBRARY "" CACHE FILEPATH "libglew.a or glew.lib" )

#set(GLM_INCLUDE_PATH "" CACHE PATH "The directory that contains glm/glm.hpp" )

include_directories(
        ${GLFW3_INCLUDE_PATH}
        ${GLEW_INCLUDE_PATH}
        ${GLM_INCLUDE_PATH}
        ${OPENGL_INCLUDE_DIR}
        #        ${PCL_INCLUDE_DIRS}
        ${CMAKE_CURRENT_SOURCE_DIR}/../_deps/src
)

#link_directories(${PCL_LIBRARY_DIRS})
#add_definitions(${PCL_DEFINITIONS})


add_executable(Hair_generate_convdata_and_imgs ${SOURCE_FILES} )

target_link_libraries(Hair_generate_convdata_and_imgs
        ${OPENGL_LIBRARY} # filled by "find_package(OpenGL REQUIRED)"
        ${GLFW3_LIBRARY}
        ${GLEW_LIBRARY}
        ${CMAKE_CURRENT_SOURCE_DIR}/../_deps/libOpenMeshCore.so
        ${CMAKE_CURRENT_SOURCE_DIR}/../_deps/libOpenMeshTools.so
        ${OpenCV_LIBS}
        #        ${PCL_COMMON_LIBRARIES}
        #        ${PCL_IO_LIBRARIES}
        )
# set(EXECUTABLE_OUTPUT_PATH ${PROJECT_BINARY_DIR})

# file(COPY ${OPENGL_LIBRARY} ${GLFW3_LIBRARY} ${GLEW_LIBRARY} ${CMAKE_CURRENT_SOURCE_DIR}/../_deps/libOpenMeshCore.so ${CMAKE_CURRENT_SOURCE_DIR}/../_deps/libOpenMeshTools.so
#     DESTINATION ${EXECUTABLE_OUTPUT_PATH})