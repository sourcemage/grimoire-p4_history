(
prepare_install &&
cp -v $SOURCE_DIRECTORY/bash_completion /etc/bash_completion                  &&
chmod 644 /etc/bash_completion                                                &&
mkdir -pv /etc/bash_completion.d                                              &&
cp -v $SCRIPT_DIRECTORY/sgl_completion /etc/bash_completion.d/sgl_completion  &&
chmod 644 /etc/bash_completion.d/sgl_completion                               &&
mkdir -pv /usr/doc/$SPELL                                                     &&
cp -v README Changelog COPYING /usr/doc/$SPELL                                &&
chmod 644 /usr/doc/$SPELL/*                                                   &&
cp -rv contrib /etc/bash_completion.d
) > $C_FIFO 2>&1
