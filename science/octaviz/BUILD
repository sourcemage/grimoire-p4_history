(
  cmake .         &&
  
  # Bug fixing for version 0.4.0, check validity for future versions.
  sedit "s/#include <Xm\/Protocols.h>/ /" Common/vtkInitializeInteractor.cc &&
  touch Filtering/vtkHierarchicalBoxApplyFilterCommand.oct &&
  
  make            &&
  prepare_install &&
  make install
) > $C_FIFO 2>&1
