(
  cd /usr/src/gkrellm-volume
  make &&
  prepare_install &&
  mkdir -p /usr/lib/gkrellm2/plugins &&
  make PLUGIN_DIR=/usr/lib/gkrellm2/plugins install

) > $C_FIFO 2>&1
