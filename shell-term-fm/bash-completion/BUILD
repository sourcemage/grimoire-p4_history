(

  prepare_install                                      &&
  cp -v $SOURCE_DIRECTORY/bash_completion              \
        /etc/profile.d/bash_completion                 &&
  chmod 644 /etc/profile.d/bash_completion             &&

  mkdir -pv /etc/bash_completion.d                     &&
  cp -rv contrib /etc/bash_completion.d                &&
  cp -v $SCRIPT_DIRECTORY/smgl_completion              \
        /etc/bash_completion.d/smgl_completion         &&
  chmod 644 /etc/bash_completion.d/smgl_completion     &&

  case $BASHCOMP_P4 in
    y|Y|j|J)  cp -v /etc/bash_completion.d/contrib/p4  \
              /etc/bash_completion.d/                  &&
              chmod 644 /etc/bash_completion.d/p4
              ;;
          *)  ;;
  esac                                                 &&
  mkdir -pv /usr/doc/$SPELL                            &&
  cp -v README Changelog COPYING /usr/doc/$SPELL       &&
  chmod 644 /usr/doc/$SPELL/*

) > $C_FIFO 2>&1
