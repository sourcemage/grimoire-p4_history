rm /var/lib/sorcery/grimoire/LICENSE			1>/dev/null  2>&1

dispel  archive audio chat                              1>/dev/null  2>&1
dispel  cluster collab crypto                           1>/dev/null  2>&1
dispel  devel disk doc                                  1>/dev/null  2>&1
dispel  editors ftp games                               1>/dev/null  2>&1
dispel  gnome graphics ham                              1>/dev/null  2>&1
dispel  http kde kernels                                1>/dev/null  2>&1
dispel  libs mail mobile                                1>/dev/null  2>&1
dispel  multimedia net news                             1>/dev/null  2>&1
dispel  perl-cpan printer shell-term-fm                 1>/dev/null  2>&1
dispel  science utils video                             1>/dev/null  2>&1
dispel  windowmanagers x11 z-rejected                   1>/dev/null  2>&1

dispel  ftp-http mail-news archive-disk devel-libs      1>/dev/null  2>&1
dispel  doc-printer mail-news-chat multimedia           1>/dev/null  2>&1

(

  prepare_install  &&
  cp -a var/lib/sorcery/grimoire /var/lib/sorcery
  cp -a etc/sorcery/config /etc/sorcery

) > $C_FIFO 2>&1
