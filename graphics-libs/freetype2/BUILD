case  $BYTECODE  in
  y|Y|j|J)  sedit  "s/#undef  TT_CONFIG_OPTION_BYTECODE_INTERPRETER/#define  TT_CONFIG_OPTION_BYTECODE_INTERPRETER/"  \
                   include/freetype/config/ftoption.h  ;;
        *)  true  ;;
esac
cd $SOURCE_DIRECTORY/builds/unix &&
./configure --prefix="$INSTALL_ROOT/usr" &&
cd $SOURCE_DIRECTORY &&
make  setup  &&
make

