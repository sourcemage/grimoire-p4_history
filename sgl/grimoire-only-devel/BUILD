for section in $GRIMOIRE/*; do
  dispel  $section 1>/dev/null  2>&1
done

(

  prepare_install  &&
  cp -a var/lib/sorcery/grimoire /var/lib/sorcery

) > $C_FIFO 2>&1
