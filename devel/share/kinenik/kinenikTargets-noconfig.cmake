#----------------------------------------------------------------
# Generated CMake target import file.
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "kinenik::kinenik" for configuration ""
set_property(TARGET kinenik::kinenik APPEND PROPERTY IMPORTED_CONFIGURATIONS NOCONFIG)
set_target_properties(kinenik::kinenik PROPERTIES
  IMPORTED_LOCATION_NOCONFIG "${_IMPORT_PREFIX}/lib/libkinenik.so"
  IMPORTED_SONAME_NOCONFIG "libkinenik.so"
  )

list(APPEND _IMPORT_CHECK_TARGETS kinenik::kinenik )
list(APPEND _IMPORT_CHECK_FILES_FOR_kinenik::kinenik "${_IMPORT_PREFIX}/lib/libkinenik.so" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
