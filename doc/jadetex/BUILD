TEXMF=`kpsetool -v '$TEXMFMAIN'`        &&

cp -r "$TEXMF/tex/latex/config" /tmp    &&
cd /tmp/config                          &&
tex -ini -progname=latex latex.ini
mv latex.fmt "$TEXMF/web2c"             &&
rm -r /tmp/config                       &&

cd $SOURCE_DIRECTORY                    &&

make jadetex.fmt                        &&
make pdfjadetex.fmt
