(

  # Fixes Bugs #2736 and 2355
  cp  ${SCRIPT_DIRECTORY}/resolver_parser.c.patch           \
      ${SOURCE_DIRECTORY}/coda-src/asr                      &&
  patch  -p0  <  ${SCRIPT_DIRECTORY}/asr-Makefile.in.patch  &&

  echo  CODA_SVR = ${CODA_SVR}       &&
  ./configure  --build=${BUILD}      \
               --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               ${OPTS}               &&
  make                               &&
  prepare_install                    &&

  case ${CODA_SVR}  in
    y|Y)  echo  "Building coda server"
          make  server-install
          ;;
      *)  echo  "Building coda client"
          make  client-install
          ;;
  esac

) > ${C_FIFO} 2>&1
