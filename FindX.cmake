# - Try to find X (duped for pkgconfig usage)
# Once done this will define
#
# X_FOUND - system has X11
# X_INCLUDE_DIRS - the X11 include directory
# X_LIBRARIES - The X11 libraries

find_package(PkgConfig)
if(PKG_CONFIG_FOUND)
  pkg_check_modules (X x11)
  list(APPEND X_INCLUDE_DIRS ${X_INCLUDEDIR})
endif()
if(NOT X_FOUND)
  find_path(X_INCLUDE_DIRS X11/Xlib.h PATHS /usr/X11)
  find_library(X_LIBRARIES X11 PATHS /usr/X11/lib)
endif()

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(X DEFAULT_MSG X_INCLUDE_DIRS X_LIBRARIES)

list(APPEND X_DEFINITIONS -DHAVE_X11=1)

mark_as_advanced(X_INCLUDE_DIRS X_LIBRARIES X_DEFINITIONS)
