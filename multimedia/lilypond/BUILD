CFLAGS=`echo $CFLAGS | sed 's/-funroll-loops//g'`
CXXFLAGS=`echo $CXXFLAGS | sed 's/-funroll-loops//g'`
export CFLAGS CXXFLAGS

patch -p0 <<EOF
--- lily/GNUmakefile	Sun Feb 10 14:13:58 2002
+++ lily/GNUmakefile	Sun Feb 10 14:13:28 2002
@@ -26,3 +26,8 @@
 \$(outdir)/kpath.o: \$(outdir)/version.hh
 \$(outdir)/lily-guile.o: \$(outdir)/version.hh
 \$(outdir)/lily-version.o: \$(outdir)/version.hh
+
+\$(outdir)/parser.hh \$(outdir)/parser.cc : parser.yy
+	bison -d parser.yy
+	mv parser.tab.hh \$(outdir)/parser.hh
+	mv parser.tab.cc \$(outdir)/parser.cc
EOF
patch -p0 <<EOF
--- scripts/lilypond-book.py	Sat Mar  2 14:00:11 2002
+++ scripts/lilypond-book.py	Sat Mar  2 14:00:15 2002
@@ -487,7 +487,7 @@
 		 'lilypond-file': '(?m)^(?!@c)(?P<match>@lilypondfile(\[(?P<options>.*?)\])?{(?P<filename>[^}]+)})',
 		 'lilypond' : '(?m)^(?!@c)(?P<match>@lilypond(\[(?P<options>.*?)\])?{(?P<code>.*?)})',
 # pyton2.2b2 barfs on this
-		 'lilypond-block': r"""(?m)^(?!@c)(?P<match>(?s)(?P<match>@lilypond(\[(?P<options>.*?)\])?\s(?P<code>.*?)@end lilypond\s))""",
+		 'lilypond-block': r"""(?m)^(?!@c)(?P<match>(?s)(?P<match1>@lilypond(\[(?P<options>.*?)\])?\s(?P<code>.*?)@end lilypond\s))""",
 
 # 1.5.2 barfs on this. 
 # 'lilypond-block': r"""(?m)^(?!@c)(?P<match>@lilypond(\[(?P<options>.*?)\])?\s(?P<code>.*?)@end lilypond\s)""",
EOF

default_build
