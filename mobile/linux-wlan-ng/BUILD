cfg()
{
  cat <<EOF
  $PCMCIA
  $PCI9052
  $ISL3874
  $ISL3873
EOF
}

(
  cfg |  make config		&&
#  make auto_config         	&&
  make all 			&&
  prepare_install               &&
  make   install     

) > $C_FIFO 2>&1
