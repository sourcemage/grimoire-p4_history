(

  ./configure  --build=${BUILD}      \
               --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               ${OPTS}               &&


  make                              &&
  # Stupid bison 1.875 has problems, and stupid
  # GNU people are taking their time putting the
  # fixed 'a' release up!
# disable this patch as it no longer applies and bison is now 1.875b
#  patch  -p1  <  ${SCRIPT_DIRECTORY}/resolver_parser.c.patch  &&
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
