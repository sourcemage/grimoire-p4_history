sedit  's:/usr/src/linux/include::'  DEFAULTS/Defaults.linux     &&
sedit  '1iMANDIR= share/man'         RULES/rules.man             &&
case ${ALLOW} in
  burning_group_users_with_suid_bit)	patch -p0 < $SPELL_DIRECTORY/patch_cdrecord_for_suid ;;
esac								 &&
make
