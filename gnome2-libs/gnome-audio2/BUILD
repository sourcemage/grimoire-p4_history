(

  prepare_install  &&
  cd sounds
  for I in *.wav */*.wav ; do \
     mkdir -p ${INSTALL_ROOT}/usr/share/sounds/`dirname $$I`; \
     installl -c -m 444 $$I $(prefix)/share/sounds/$$I; \
  done
  cd ${INSTALL_ROOT}/usr/share/sounds
  ln -sfn startup3.wav login.wav
  ln -sfn shutdown1.wav logout.wav

) > $C_FIFO 2>&1
