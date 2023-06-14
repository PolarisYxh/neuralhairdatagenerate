set( _fftw_HEADER_SEARCH_DIRS
"/usr/include"
"/usr/local/include"
"${CMAKE_SOURCE_DIR}/includes"
"C:/Program Files (x86)/glfw/include" )
set( _fftw_LIB_SEARCH_DIRS
"/usr/lib"
"/usr/local/lib"
"/usr/lib/x86_64-linux-gnu"
"${CMAKE_SOURCE_DIR}/lib"
"C:/Program Files (x86)/glfw/lib-msvc110" )

# Check environment for root search directory
set( _fftw_ENV_ROOT $ENV{fftw_ROOT} )
if( NOT fftw_ROOT AND _fftw_ENV_ROOT )
	set(fftw_ROOT ${_fftw_ENV_ROOT} )
endif()

# Put user specified location at beginning of search

if( fftw_ROOT )
	list( INSERT _fftw_HEADER_SEARCH_DIRS 0 "${fftw_ROOT}/include" )
	list( INSERT _fftw_LIB_SEARCH_DIRS 0 "${fftw_ROOT}/lib" )
endif()

# Search for the header
FIND_PATH(FFTW3F_INCLUDE_DIR "fftw3.h" fftw PATHS ${_fftw_HEADER_SEARCH_DIRS} )
message(STATUS "\"${FFTW3F_INCLUDE_DIR}\"")
# Search for the library
FIND_LIBRARY(FFTW3F_LIBRARIES NAMES "libfftw3.a" PATHS ${_fftw_LIB_SEARCH_DIRS} )
message(STATUS "\"${FFTW3F_LIBRARY}\"")
INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(FFTW DEFAULT_MSG
FFTW3F_LIBRARIES FFTW3F_INCLUDE_DIR)
