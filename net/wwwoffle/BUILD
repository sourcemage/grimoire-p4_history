(

  OPTS="$OPTS --with-spooldir=/var/spool/wwwoffle"

  sedit  's/\(#define html_yywrap(\).*/\1a) 1/'  src/html.l  &&
  sedit  's/\(#define xml_yywrap(\).*/\1a) 1/'  src/xml.l  &&
  sedit  's/\(#define vrml_yywrap(\).*/\1a) 1/'  src/vrml.l  &&
  sedit  's/\(#define htmlmodify_yywrap(\).*/\1a) 1/'  src/htmlmodify.l  &&
  sedit  's/\(#define msg_yywrap(\).*/\1a) 1/'  src/messages.l  &&
  sedit  's/\(#define css_yywrap(\).*/\1a) 1/'  src/css.l  &&
  default_build

) > $C_FIFO 2>&1
