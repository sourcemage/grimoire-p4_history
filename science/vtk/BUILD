(

  export VTK_DATA_ROOT=/usr/share/vtk/VTKData    &&
  export VTK_INSTALL_PATH=/usr                   &&
  patch -p1 < $SCRIPT_DIRECTORY/vtk-4.0.config   &&
  cmake                                          &&

  sedit "s/^VTK_DATA_ROOT:PATH=.*$/VTK_DATA_ROOT:PATH=\/usr\/share\/vtk\/VTKData/" CMakeCache.txt  &&
  sedit "s/^PYTHON_INCLUDE_PATH:PATH=.*$/PYTHON_INCLUDE_PATH:PATH=\/usr\/include\/python2.2/" CMakeCache.txt  &&
  sedit "s/^PYTHON_LIBRARY:FILEPATH=.*$/PYTHON_LIBRARY:FILEPATH=\/usr\/lib\/python2.2/" CMakeCache.txt  &&
  sedit "s/^VTK_WRAP_JAVA:BOOL=.*$/VTK_WRAP_JAVA:BOOL=ON/" CMakeCache.txt  &&
  sedit "s/^JAVA_AWT_INCLUDE_PATH:PATH=.*$/JAVA_AWT_INCLUDE_PATH:PATH=\/usr\/lib\/j2sdk1.3.1\/include/" CMakeCache.txt  &&
  sedit "s/^JAVA_AWT_LIBRARY:FILEPATH=.*$/JAVA_AWT_LIBRARY:FILEPATH=\/usr\/lib\/j2sdk1.3.1\/jre\/lib\/i386/" CMakeCache.txt  &&
  sedit "s/^JAVA_INCLUDE_PATH:PATH=.*$/JAVA_INCLUDE_PATH:PATH=\/usr\/lib\/j2sdk1.3.1\/include/" CMakeCache.txt  &&
  sedit "s/^JAVA_INCLUDE_PATH2:PATH=.*$/JAVA_INCLUDE_PATH2:PATH=\/usr\/lib\/j2sdk1.3.1\/include\/linux/" CMakeCache.txt  &&
  sedit "s/^CMAKE_INSTALL_PREFIX:PATH=.*$/CMAKE_INSTALL_PREFIX:PATH=\/usr/" CMakeCache.txt  &&

  mkdir java                                     &&
  mkdir java/vtk                                 &&
  make                                           &&
  prepare_install				 &&
  make install
  ln -s /usr/lib/vtk/lib* /usr/lib/
 
) > $C_FIFO 2>&1

