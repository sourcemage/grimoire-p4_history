(

  TEXMF=`kpsetool -v '$TEXMFLOCAL'`                   &&

  cp  mf/skakbase.mf  mf/skakbrikker.mf  \
      mf/skakinf.mf  .  &&

  for  font  in  mf/skak[123]*  mf/skakf*  ;  do
    (  mf  "\mode:=localfont;  input  $font"  )  ||  exit 1
  done  &&

  for  font  in  *.600gf  ;  do
    gftopk  $font  ||  exit 1
  done  &&

  prepare_install                                     &&
  
  mkdir  -p  $TEXMF/fonts/pk/ljfour/public/skak/      &&
  #mkdir  -p  $TEXMF/fonts/gf/public/skak/             &&
  mkdir  -p  $TEXMF/fonts/tfm/public/skak/            &&
  mkdir  -p  $TEXMF/fonts/source/public/skak/         &&
  mkdir  -p  $TEXMF/tex/latex/skak/                   &&
  
  cp  *.600pk    $TEXMF/fonts/pk/ljfour/public/skak/  &&
  #cp  *.600gf    $TEXMF/fonts/gf/public/skak/         &&
  cp  *.tfm      $TEXMF/fonts/tfm/public/skak/        &&
  cp  mf/*.mf    $TEXMF/fonts/source/public/skak/     &&
  cp  tex/*      $TEXMF/tex/latex/skak/

)  >  $C_FIFO  2>&1
