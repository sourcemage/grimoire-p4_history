(

# --enable-ecore-fb \
# --enable-ecore-evas-gl \

./autogen.sh \
--prefix=/usr \
--enable-ecore-x \
--enable-ecore-evas \
--enable-ecore-job \
--enable-ecore-con \
--enable-ecore-ipc \
--enable-ecore-txt &&

make             &&
prepare_install  &&
make install

) > $C_FIFO 2>&1
