# Find PythonQt_QtAll
#
# Sets PYTHONQT_QTALL_FOUND, PYTHONQT_QTALL_INCLUDE_DIR, PYTHONQT_QTALL_LIBRARY, PYTHONQT_QTALL_LIBRARIES
#


find_path(PYTHONQT_QTALL_INSTALL_DIR extensions/PythonQt_QtAll/PythonQt_QtAll.h DOC "Directory where PythonQt_QtAll.h was installed.")
find_path(PYTHONQT_QTALL_INCLUDE_DIR PythonQt_QtAll.h "${PYTHONQT_QTALL_INSTALL_DIR}/extensions/PythonQt_QtAll" DOC "Path to the PythonQt_QtAll include directory")
find_library(PYTHONQT_QTALL_LIBRARY PythonQt_QtAll PATHS "${PYTHONQT_QTALL_INSTALL_DIR}/extensions/PythonQt_QtAll" DOC "The PythonQt_QtAll library.")

mark_as_advanced(PYTHONQT_QTALL_INSTALL_DIR)
mark_as_advanced(PYTHONQT_QTALL_INCLUDE_DIR)
mark_as_advanced(PYTHONQT_QTALL_LIBRARY)

# On linux, also find libutil
if(UNIX AND NOT APPLE)
  find_library(PYTHONQT_QTALL_LIBUTIL util)
  mark_as_advanced(PYTHONQT_QTALL_LIBUTIL)
endif()

set(PYTHONQT_QTALL_FOUND 0)
if(PYTHONQT_QTALL_INCLUDE_DIR AND PYTHONQT_QTALL_LIBRARY)
  # Currently CMake'ified PYTHONQT_QTALL only supports building against a python Release build.
  # This applies independently of CTK build type (Release, Debug, ...)
  add_definitions(-DPYTHONQT_QTALL_USE_RELEASE_PYTHON_FALLBACK)
  set(PYTHONQT_QTALL_FOUND 1)
  set(PYTHONQT_QTALL_LIBRARIES ${PYTHONQT_QTALL_LIBRARY} ${PYTHONQT_QTALL_LIBUTIL})
endif()

