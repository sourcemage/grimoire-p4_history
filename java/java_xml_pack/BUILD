(

  . $SCRIPT_DIRECTORY/../java-functions

  prepare_install 							&&

  extract_sun_src  ${SPELL} ${SPELL}-${VERSION} $SOURCE_DIRECTORY
  
) > $C_FIFO 2>&1  && 

(

  # crete profile
  cat > /etc/profile.$SPELL <<EOF
# $SPELL-$VERSION profile 
export JAXM_HOME=/opt/java/$SPELL/jaxm-1.1_01
export JAXP_HOME=/opt/java/$SPELL/jaxp-1.2_01
export JAXR_HOME=/opt/java/$SPELL/jaxr-1.0_02
export JAXRPC_HOME=/opt/java/$SPELL/jaxrpc-1.0_01

EOF

  echo "source /etc/profile.$SPELL" >> /etc/profile;
  echo -n >> /etc/profile;
  
)
