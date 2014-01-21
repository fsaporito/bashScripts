#!/bin/bash

clear

# This Script Download All The Major Wikies In Various Languages
# And Merge Them All To A Wordlist (wikipedia.txt)

f_working () {

echo
echo "##############################"
echo

echo "[*] Cating, Seding and Sorting ..."

n=1

FILE="/tmp/count.txt"
ls x* > $FILE

t=$(grep [^*$] $FILE -c)

for i in x*; do
	if [ -e "$i" ]; then
		file=$( basename "$i" )
		echo $n / $t
		cat "$i" | sed -e 's/[^a-zA-Z]/ /g' | sed -e 's/[:print:]^//g' | sed -e 's/[:cntrl:]*//g' | sed -e '/aaa/d' | sed -e '/bbb/d' | sed -e '/ccc/d' | sed -e '/ddd/d' | sed -e '/eee/d' | sed -e '/fff/d' | sed -e '/ggg/d' | sed -e '/hhh/d' | sed -e '/iii/d' | sed -e '/jjj/d' | sed -e '/kkk/d' | sed -e '/lll/d' | sed -e '/mmm/d' | sed -e '/nnn/d' | sed -e '/ooo/d' | sed -e '/ppp/d' | sed -e '/qqq/d' | sed -e '/rrr/d' | sed -e '/sss/d' | sed -e '/ttt/d' | sed -e '/uuu/d' | sed -e '/vvv/d' | sed -e '/www/d' | sed -e '/xxx/d' | sed -e '/yyy/d' | sed -e '/zzz/d' | sed -e '/ààà/d' | sed -e '/èèè/d' | sed -e '/ììì/d' | sed -e '/òòò/d' | sed -e '/ùùù/d' | sed -e '/£££/d' | sed -e '/&&&/d' | sed -e '/ççç/d' | sed -e '/§§§/d' | sed -e '/$$$/d' | tr ' ' '\012' | tr '[:upper:]' '[:lower:]' | sed -e '/^$/d' | sort -u >> "$file.txt" 2> /dev/null
	    n=$[ $n + 1 ]
	fi
done

echo
echo "##############################"
echo

clear

}


# Afrikaans (af)
f_af () {

${downloader} http://dumps.wikimedia.org/afwiki/latest/afwiki-latest-pages-articles.xml.bz2
bzip2 -d -c afwiki-latest-pages-articles.xml.bz2 >> afwiki.xml
rm -f afwiki-latest-pages-articles.xml.bz2

echo "[*] Spliting ..."
split --lines=50000 afwiki.xml
rm -f afwiki.xml

f_working

echo "[*] Unifyng and Sorting ..."
cat x*.txt | tr ' ' '\012' | sed -e '/^$/d' | sort -u >> afwiki.txt
echo
echo "##############################"
echo

echo "[*] Deleting x* ..."
rm -f x*
echo
echo "##############################"
echo

}

# Albanian (sq)
f_sq () {

${downloader} http://dumps.wikimedia.org/sqwiki/latest/sqwiki-latest-pages-articles.xml.bz2
bzip2 -d -c sqwiki-latest-pages-articles.xml.bz2 >> sqwiki.xml
rm -f sqwiki-latest-pages-articles.xml.bz2

echo "[*] Spliting ..."
split --lines=500000 sqwiki.xml
rm -f sqwiki.xml

f_working

echo "[*] Unifyng and Sorting ..."
cat x*.txt | tr ' ' '\012' | sed -e '/^$/d' | sort -u >> sqwiki.txt
echo
echo "##############################"
echo

echo "[*] Deleting x* ..."
rm -f x*
echo
echo "##############################"
echo

}

# Arabic (ar)
f_ar () {

${downloader} http://dumps.wikimedia.org/arwiki/latest/arwiki-latest-pages-articles.xml.bz2
bzip2 -d -c arwiki-latest-pages-articles.xml.bz2 >> arwiki.xml
rm -f arwiki-latest-pages-articles.xml.bz2

echo "[*] Spliting ..."
split --lines=500000 arwiki.xml
rm -f arwiki.xml

f_working

echo "[*] Unifyng and Sorting ..."
cat x*.txt | tr ' ' '\012' | sed -e '/^$/d' | sort -u >> arwiki.txt
echo
echo "##############################"
echo

echo "[*] Deleting x* ..."
rm -f x*
echo
echo "##############################"
echo

}

# Armenian (hy)
f_hy () {

${downloader} http://dumps.wikimedia.org/hywiki/latest/hywiki-latest-pages-articles.xml.bz2
bzip2 -d -c hywiki-latest-pages-articles.xml.bz2 >> hywiki.xml
rm -f hywiki-latest-pages-articles.xml.bz2

echo "[*] Spliting ..."
split --lines=500000 hywiki.xml
rm -f hywiki.xml

f_working

echo "[*] Unifyng and Sorting ..."
cat x*.txt | tr ' ' '\012' | sed -e '/^$/d' | sort -u >> hywiki.txt
echo
echo "##############################"
echo

echo "[*] Deleting x* ..."
rm -f x*
echo
echo "##############################"
echo

}

# Azerbaijani (az)
f_az () {

${downloader} http://dumps.wikimedia.org/azwiki/latest/azwiki-latest-pages-articles.xml.bz2
bzip2 -d -c azwiki-latest-pages-articles.xml.bz2 >> azwiki.xml
rm -f azwiki-latest-pages-articles.xml.bz2

echo "[*] Spliting ..."
split --lines=500000 azwiki.xml
rm -f azwiki.xml

f_working

echo "[*] Unifyng and Sorting ..."
cat x*.txt | tr ' ' '\012' | sed -e '/^$/d' | sort -u >> azwiki.txt
echo
echo "##############################"
echo

echo "[*] Deleting x* ..."
rm -f x*
echo
echo "##############################"
echo

}

# Basque (eu)
f_eu () {

${downloader} http://dumps.wikimedia.org/euwiki/latest/euwiki-latest-pages-articles.xml.bz2
bzip2 -d -c euwiki-latest-pages-articles.xml.bz2 >> euwiki.xml
rm -f euwiki-latest-pages-articles.xml.bz2

echo "[*] Spliting ..."
split --lines=500000 euwiki.xml
rm -f euwiki.xml

f_working

echo "[*] Unifyng and Sorting ..."
cat x*.txt | tr ' ' '\012' | sed -e '/^$/d' | sort -u >> euwiki.txt
echo
echo "##############################"
echo

echo "[*] Deleting x* ..."
rm -f x*
echo
echo "##############################"
echo

}

# Belarusian (be)
f_be () {

${downloader} http://dumps.wikimedia.org/bewiki/latest/bewiki-latest-pages-articles.xml.bz2
bzip2 -d -c bewiki-latest-pages-articles.xml.bz2 >> bewiki.xml
rm -f bewiki-latest-pages-articles.xml.bz2

echo "[*] Spliting ..."
split --lines=500000 bewiki.xml
rm -f bewiki.xml

f_working

echo "[*] Unifyng and Sorting ..."
cat x*.txt | tr ' ' '\012' | sed -e '/^$/d' | sort -u >> bewiki.txt
echo
echo "##############################"
echo

echo "[*] Deleting x* ..."
rm -f x*
echo
echo "##############################"
echo

}

# Bulgarian (bg)
f_bg () {

${downloader} http://dumps.wikimedia.org/bgwiki/latest/bgwiki-latest-pages-articles.xml.bz2
bzip2 -d -c bgwiki-latest-pages-articles.xml.bz2 >> bgwiki.xml
rm -f bgwiki-latest-pages-articles.xml.bz2

echo "[*] Spliting ..."
split --lines=500000 bgwiki.xml
rm -f bgwiki.xml

f_working

echo "[*] Unifyng and Sorting ..."
cat x*.txt | tr ' ' '\012' | sed -e '/^$/d' | sort -u >> bgwiki.txt
echo
echo "##############################"
echo

echo "[*] Deleting x* ..."
rm -f x*
echo
echo "##############################"
echo

}

# Catalan (ca)
f_ca () {

${downloader} http://dumps.wikimedia.org/cawiki/latest/cawiki-latest-pages-articles.xml.bz2
bzip2 -d -c cawiki-latest-pages-articles.xml.bz2 >> cawiki.xml
rm -f cawiki-latest-pages-articles.xml.bz2

echo "[*] Spliting ..."
split --lines=500000 cawiki.xml
rm -f cawiki.xml

f_working

echo "[*] Unifyng and Sorting ..."
cat x*.txt | tr ' ' '\012' | sed -e '/^$/d' | sort -u >> cawiki.txt
echo
echo "##############################"
echo

echo "[*] Deleting x* ..."
rm -f x*
echo
echo "##############################"
echo

}

# Chinese (zh)
f_zh () {

${downloader} http://dumps.wikimedia.org/zhwiki/latest/zhwiki-latest-pages-articles.xml.bz2
bzip2 -d -c zhwiki-latest-pages-articles.xml.bz2 >> zhwiki.xml
rm -f zhwiki-latest-pages-articles.xml.bz2

echo "[*] Spliting ..."
split --lines=500000 zhwiki.xml
rm -f zhwiki.xml

f_working

echo "[*] Unifyng and Sorting ..."
cat x*.txt | tr ' ' '\012' | sed -e '/^$/d' | sort -u >> zhwiki.txt
echo
echo "##############################"
echo

echo "[*] Deleting x* ..."
rm -f x*
echo
echo "##############################"
echo

}

# Croatian (hr)
f_hr () {

${downloader} http://dumps.wikimedia.org/hrwiki/latest/hrwiki-latest-pages-articles.xml.bz2
bzip2 -d -c hrwiki-latest-pages-articles.xml.bz2 >> hrwiki.xml
rm -f hrwiki-latest-pages-articles.xml.bz2

echo "[*] Spliting ..."
split --lines=500000 hrwiki.xml
rm -f hrwiki.xml

f_working

echo "[*] Unifyng and Sorting ..."
cat x*.txt | tr ' ' '\012' | sed -e '/^$/d' | sort -u >> hrwiki.txt
echo
echo "##############################"
echo

echo "[*] Deleting x* ..."
rm -f x*
echo
echo "##############################"
echo

}

# Czech (cs)
f_cs () {

${downloader} http://dumps.wikimedia.org/cswiki/latest/cswiki-latest-pages-articles.xml.bz2
bzip2 -d -c cswiki-latest-pages-articles.xml.bz2 >> cswiki.xml
rm -f cswiki-latest-pages-articles.xml.bz2

echo "[*] Spliting ..."
split --lines=500000 cswiki.xml
rm -f cswiki.xml

f_working

echo "[*] Unifyng and Sorting ..."
cat x*.txt | tr ' ' '\012' | sed -e '/^$/d' | sort -u >> cswiki.txt
echo
echo "##############################"
echo

echo "[*] Deleting x* ..."
rm -f x*
echo
echo "##############################"
echo

}

# Danish (da)
f_da () {

${downloader} http://dumps.wikimedia.org/dawiki/latest/dawiki-latest-pages-articles.xml.bz2
bzip2 -d -c dawiki-latest-pages-articles.xml.bz2 >> dawiki.xml
rm -f dawiki-latest-pages-articles.xml.bz2

echo "[*] Spliting ..."
split --lines=500000 dawiki.xml
rm -f dawiki.xml

f_working

echo "[*] Unifyng and Sorting ..."
cat x*.txt | tr ' ' '\012' | sed -e '/^$/d' | sort -u >> dawiki.txt
echo
echo "##############################"
echo

echo "[*] Deleting x* ..."
rm -f x*
echo
echo "##############################"
echo

}

# Deutch (de)
f_de () {

${downloader} http://dumps.wikimedia.org/dewiki/latest/dewiki-latest-pages-articles.xml.bz2
bzip2 -d -c dewiki-latest-pages-articles.xml.bz2 >> dewiki.xml
rm -f dewiki-latest-pages-articles.xml.bz2

echo "[*] Spliting ..."
split --lines=500000 dewiki.xml
rm -f dewiki.xml

f_working

echo "[*] Unifyng and Sorting ..."
cat x*.txt | tr ' ' '\012' | sed -e '/^$/d' | sort -u >> dewiki.txt
echo
echo "##############################"
echo

echo "[*] Deleting x* ..."
rm -f x*
echo
echo "##############################"
echo

}

# Emilian-Romagnol (eml)
f_eml () {

${downloader} http://dumps.wikimedia.org/emlwiki/latest/emlwiki-latest-pages-articles.xml.bz2
bzip2 -d -c emlwiki-latest-pages-articles.xml.bz2 >> emlwiki.xml
rm -f emlwiki-latest-pages-articles.xml.bz2

echo "[*] Spliting ..."
split --lines=50000 emlwiki.xml
rm -f emlwiki.xml

f_working

echo "[*] Unifyng and Sorting ..."
cat x*.txt | tr ' ' '\012' | sed -e '/^$/d' | sort -u >> emlwiki.txt
echo
echo "##############################"
echo

echo "[*] Deleting x* ..."
rm -f x*
echo
echo "##############################"
echo

}

# English (en)
f_en () {

${downloader} http://dumps.wikimedia.org/enwiki/latest/enwiki-latest-pages-articles.xml.bz2
bzip2 -d -c enwiki-latest-pages-articles.xml.bz2 >> enwiki.xml
rm -f enwiki-latest-pages-articles.xml.bz2

echo "[*] Spliting ..."
split --lines=10000000 enwiki.xml
rm -f enwiki.xml

f_working

echo "[*] Unifyng and Sorting ..."
cat x*.txt | tr ' ' '\012' | sed -e '/^$/d' | sort -u >> enwiki.txt
echo
echo "##############################"
echo

echo "[*] Deleting x* ..."
rm -f x*
echo
echo "##############################"
echo

}

# Espanol (es)
f_es () {

${downloader} http://dumps.wikimedia.org/eswiki/latest/eswiki-latest-pages-articles.xml.bz2
bzip2 -d -c eswiki-latest-pages-articles.xml.bz2 >> eswiki.xml
rm -f eswiki-latest-pages-articles.xml.bz2

echo "[*] Spliting ..."
split --lines=500000 eswiki.xml
rm -f eswiki.xml

f_working

echo "[*] Unifyng and Sorting ..."
cat x*.txt | tr ' ' '\012' | sed -e '/^$/d' | sort -u >> eswiki.txt
echo
echo "##############################"
echo

echo "[*] Deleting x* ..."
rm -f x*
echo
echo "##############################"
echo

}

# Esperanto (eo)
f_eo () {

${downloader} http://dumps.wikimedia.org/eowiki/latest/eowiki-latest-pages-articles.xml.bz2
bzip2 -d -c eowiki-latest-pages-articles.xml.bz2 >> eowiki.xml
rm -f eowiki-latest-pages-articles.xml.bz2

echo "[*] Spliting ..."
split --lines=500000 eowiki.xml
rm -f eowiki.xml

f_working

echo "[*] Unifyng and Sorting ..."
cat x*.txt | tr ' ' '\012' | sed -e '/^$/d' | sort -u >> eowiki.txt
echo
echo "##############################"
echo

echo "[*] Deleting x* ..."
rm -f x*
echo
echo "##############################"
echo

}

# Estonian (et)
f_et () {

${downloader} http://dumps.wikimedia.org/etwiki/latest/etwiki-latest-pages-articles.xml.bz2
bzip2 -d -c etwiki-latest-pages-articles.xml.bz2 >> etwiki.xml
rm -f etwiki-latest-pages-articles.xml.bz2

echo "[*] Spliting ..."
split --lines=5000000 etwiki.xml
rm -f etwiki.xml

f_working

echo "[*] Unifyng and Sorting ..."
cat x*.txt | tr ' ' '\012' | sed -e '/^$/d' | sort -u >> etwiki.txt
echo
echo "##############################"
echo

echo "[*] Deleting x* ..."
rm -f x*
echo
echo "##############################"
echo

}

# French (fr)
f_fr () {

${downloader} http://dumps.wikimedia.org/frwiki/latest/frwiki-latest-pages-articles.xml.bz2
bzip2 -d -c frwiki-latest-pages-articles.xml.bz2 >> frwiki.xml
rm -f frwiki-latest-pages-articles.xml.bz2

echo "[*] Spliting ..."
split --lines=5000000 frwiki.xml
rm -f frwiki.xml

f_working

echo "[*] Unifyng and Sorting ..."
cat x*.txt | tr ' ' '\012' | sed -e '/^$/d' | sort -u >> frwiki.txt
echo
echo "##############################"
echo

echo "[*] Deleting x* ..."
rm -f x*
echo
echo "##############################"
echo

}

# Galician (gl)
f_gl () {

${downloader} http://dumps.wikimedia.org/glwiki/latest/glwiki-latest-pages-articles.xml.bz2
bzip2 -d -c glwiki-latest-pages-articles.xml.bz2 >> glwiki.xml
rm -f glwiki-latest-pages-articles.xml.bz2

echo "[*] Spliting ..."
split --lines=500000 glwiki.xml
rm -f glwiki.xml

f_working

echo "[*] Unifyng and Sorting ..."
cat x*.txt | tr ' ' '\012' | sed -e '/^$/d' | sort -u >> glwiki.txt
echo
echo "##############################"
echo

echo "[*] Deleting x* ..."
rm -f x*
echo
echo "##############################"
echo

}

# Gothic (got)
f_got () {

${downloader} http://dumps.wikimedia.org/gotwiki/latest/gotwiki-latest-pages-articles.xml.bz2
bzip2 -d -c gotwiki-latest-pages-articles.xml.bz2 >> gotwiki.xml
rm -f gotwiki-latest-pages-articles.xml.bz2

echo "[*] Spliting ..."
split --lines=500000 gotwiki.xml
rm -f gotwiki.xml

f_working

echo "[*] Unifyng and Sorting ..."
cat x*.txt | tr ' ' '\012' | sed -e '/^$/d' | sort -u >> gotwiki.txt
echo
echo "##############################"
echo

echo "[*] Deleting x* ..."
rm -f x*
echo
echo "##############################"
echo

}

# Greek (el)
f_el () {

${downloader} http://dumps.wikimedia.org/elwiki/latest/elwiki-latest-pages-articles.xml.bz2
bzip2 -d -c elwiki-latest-pages-articles.xml.bz2 >> elwiki.xml
rm -f elwiki-latest-pages-articles.xml.bz2

echo "[*] Spliting ..."
split --lines=500000 elwiki.xml
rm -f elwiki.xml

f_working

echo "[*] Unifyng and Sorting ..."
cat x*.txt | tr ' ' '\012' | sed -e '/^$/d' | sort -u >> elwiki.txt
echo
echo "##############################"
echo

echo "[*] Deleting x* ..."
rm -f x*
echo
echo "##############################"
echo

}

# Hebrew (he)
f_he () {

${downloader} http://dumps.wikimedia.org/hewiki/latest/hewiki-latest-pages-articles.xml.bz2
bzip2 -d -c hewiki-latest-pages-articles.xml.bz2 >> hewiki.xml
rm -f hewiki-latest-pages-articles.xml.bz2

echo "[*] Spliting ..."
split --lines=500000 hewiki.xml
rm -f hewiki.xml

f_working

echo "[*] Unifyng and Sorting ..."
cat x*.txt | tr ' ' '\012' | sed -e '/^$/d' | sort -u >> hewiki.txt
echo
echo "##############################"
echo

echo "[*] Deleting x* ..."
rm -f x*
echo
echo "##############################"
echo

}

# Hungarian (hu)
f_hu () {

${downloader} http://dumps.wikimedia.org/huwiki/latest/huwiki-latest-pages-articles.xml.bz2
bzip2 -d -c huwiki-latest-pages-articles.xml.bz2 >> huwiki.xml
rm -f huwiki-latest-pages-articles.xml.bz2

echo "[*] Spliting ..."
split --lines=500000 huwiki.xml
rm -f huwiki.xml

f_working

echo "[*] Unifyng and Sorting ..."
cat x*.txt | tr ' ' '\012' | sed -e '/^$/d' | sort -u >> huwiki.txt
echo
echo "##############################"
echo

echo "[*] Deleting x* ..."
rm -f x*
echo
echo "##############################"
echo

}

# Irish (ga)
f_ga () {

${downloader} http://dumps.wikimedia.org/gawiki/latest/gawiki-latest-pages-articles.xml.bz2
bzip2 -d -c gawiki-latest-pages-articles.xml.bz2 >> gawiki.xml
rm -f gawiki-latest-pages-articles.xml.bz2

echo "[*] Spliting ..."
split --lines=500000 gawiki.xml
rm -f gawiki.xml

f_working

echo "[*] Unifyng and Sorting ..."
cat x*.txt | tr ' ' '\012' | sed -e '/^$/d' | sort -u >> gawiki.txt
echo
echo "##############################"
echo

echo "[*] Deleting x* ..."
rm -f x*
echo
echo "##############################"
echo

}

# Italian (it)
f_it () {

${downloader} http://dumps.wikimedia.org/itwiki/latest/itwiki-latest-pages-articles.xml.bz2
bzip2 -d -c itwiki-latest-pages-articles.xml.bz2 >> itwiki.xml
rm -f itwiki-latest-pages-articles.xml.bz2

echo "[*] Spliting ..."
split --lines=500000 itwiki.xml
rm -f itwiki.xml

f_working

echo "[*] Unifyng and Sorting ..."
cat x*.txt | tr ' ' '\012' | sed -e '/^$/d' | sort -u >> itwiki.txt
echo
echo "##############################"
echo

echo "[*] Deleting x* ..."
rm -f x*
echo
echo "##############################"
echo

}

# Japanese (ja)
f_ja () {

${downloader} http://dumps.wikimedia.org/jawiki/latest/jawiki-latest-pages-articles.xml.bz2
bzip2 -d -c jawiki-latest-pages-articles.xml.bz2 >> jawiki.xml
rm -f jawiki-latest-pages-articles.xml.bz2

echo "[*] Sjaiting ..."
split --lines=5000000 jawiki.xml
rm -f jawiki.xml

f_working

echo "[*] Unifyng and Sorting ..."
cat x*.txt | tr ' ' '\012' | sed -e '/^$/d' | sort -u >> jawiki.txt
echo
echo "##############################"
echo

echo "[*] Deleting x* ..."
rm -f x*
echo
echo "##############################"
echo

}

# Korean (ko)
f_ko () {

${downloader} http://dumps.wikimedia.org/kowiki/latest/kowiki-latest-pages-articles.xml.bz2
bzip2 -d -c kowiki-latest-pages-articles.xml.bz2 >> kowiki.xml
rm -f kowiki-latest-pages-articles.xml.bz2

echo "[*] Spliting ..."
split --lines=500000 kowiki.xml
rm -f kowiki.xml

f_working

echo "[*] Unifyng and Sorting ..."
cat x*.txt | tr ' ' '\012' | sed -e '/^$/d' | sort -u >> kowiki.txt
echo
echo "##############################"
echo

echo "[*] Deleting x* ..."
rm -f x*
echo
echo "##############################"
echo

}

# Latin (la)
f_la () {

${downloader} http://dumps.wikimedia.org/lawiki/latest/lawiki-latest-pages-articles.xml.bz2
bzip2 -d -c lawiki-latest-pages-articles.xml.bz2 >> lawiki.xml
rm -f lawiki-latest-pages-articles.xml.bz2

echo "[*] Spliting ..."
split --lines=50000 lawiki.xml
rm -f lawiki.xml

f_working

echo "[*] Unifyng and Sorting ..."
cat x*.txt | tr ' ' '\012' | sed -e '/^$/d' | sort -u >> lawiki.txt
echo
echo "##############################"
echo

echo "[*] Deleting x* ..."
rm -f x*
echo
echo "##############################"
echo

}

# Ligurian (lij)
f_lij () {

${downloader} http://dumps.wikimedia.org/lijwiki/latest/lijwiki-latest-pages-articles.xml.bz2
bzip2 -d -c lijwiki-latest-pages-articles.xml.bz2 >> lijwiki.xml
rm -f lijwiki-latest-pages-articles.xml.bz2

echo "[*] Spliting ..."
split --lines=50000 lijwiki.xml
rm -f lijwiki.xml

f_working

echo "[*] Unifyng and Sorting ..."
cat x*.txt | tr ' ' '\012' | sed -e '/^$/d' | sort -u >> lijwiki.txt
echo
echo "##############################"
echo

echo "[*] Deleting x* ..."
rm -f x*
echo
echo "##############################"
echo

}

# Indonesian (id)
f_id () {

${downloader} http://dumps.wikimedia.org/idwiki/latest/idwiki-latest-pages-articles.xml.bz2
bzip2 -d -c idwiki-latest-pages-articles.xml.bz2 >> idwiki.xml
rm -f idwiki-latest-pages-articles.xml.bz2

echo "[*] Spliting ..."
split --lines=500000 idwiki.xml
rm -f idwiki.xml

f_working

echo "[*] Unifyng and Sorting ..."
cat x*.txt | tr ' ' '\012' | sed -e '/^$/d' | sort -u >> idwiki.txt
echo
echo "##############################"
echo

echo "[*] Deleting x* ..."
rm -f x*
echo
echo "##############################"
echo

}

# Lithuanian (lt)
f_lt () {

${downloader} http://dumps.wikimedia.org/ltwiki/latest/ltwiki-latest-pages-articles.xml.bz2
bzip2 -d -c ltwiki-latest-pages-articles.xml.bz2 >> ltwiki.xml
rm -f ltwiki-latest-pages-articles.xml.bz2

echo "[*] Spliting ..."
split --lines=500000 ltwiki.xml
rm -f ltwiki.xml

f_working

echo "[*] Unifyng and Sorting ..."
cat x*.txt | tr ' ' '\012' | sed -e '/^$/d' | sort -u >> ltwiki.txt
echo
echo "##############################"
echo

echo "[*] Deleting x* ..."
rm -f x*
echo
echo "##############################"
echo

}

# Luxembourgish (lb)
f_lb () {

${downloader} http://dumps.wikimedia.org/lbwiki/latest/lbwiki-latest-pages-articles.xml.bz2
bzip2 -d -c lbwiki-latest-pages-articles.xml.bz2 >> lbwiki.xml
rm -f lbwiki-latest-pages-articles.xml.bz2

echo "[*] Spliting ..."
split --lines=500000 lbwiki.xml
rm -f lbwiki.xml

f_working

echo "[*] Unifyng and Sorting ..."
cat x*.txt | tr ' ' '\012' | sed -e '/^$/d' | sort -u >> lbwiki.txt
echo
echo "##############################"
echo

echo "[*] Deleting x* ..."
rm -f x*
echo
echo "##############################"
echo

}

# Malay (ms)
f_ms () {

${downloader} http://dumps.wikimedia.org/mswiki/latest/mswiki-latest-pages-articles.xml.bz2
bzip2 -d -c mswiki-latest-pages-articles.xml.bz2 >> mswiki.xml
rm -f mswiki-latest-pages-articles.xml.bz2

echo "[*] Spliting ..."
split --lines=500000 mswiki.xml
rm -f mswiki.xml

f_working

echo "[*] Unifyng and Sorting ..."
cat x*.txt | tr ' ' '\012' | sed -e '/^$/d' | sort -u >> mswiki.txt
echo
echo "##############################"
echo

echo "[*] Deleting x* ..."
rm -f x*
echo
echo "##############################"
echo

}

# Neapolitan (nap)
f_nap () {

${downloader} http://dumps.wikimedia.org/napwiki/latest/napwiki-latest-pages-articles.xml.bz2
bzip2 -d -c napwiki-latest-pages-articles.xml.bz2 >> napwiki.xml
rm -f napwiki-latest-pages-articles.xml.bz2

echo "[*] Spliting ..."
split --lines=500000 napwiki.xml
rm -f napwiki.xml

f_working

echo "[*] Unifyng and Sorting ..."
cat x*.txt | tr ' ' '\012' | sed -e '/^$/d' | sort -u >> napwiki.txt
echo
echo "##############################"
echo

echo "[*] Deleting x* ..."
rm -f x*
echo
echo "##############################"
echo

}

# Nederland (nr)
f_nr () {

${downloader} http://dumps.wikimedia.org/nlwiki/latest/nlwiki-latest-pages-articles.xml.bz2
bzip2 -d -c nrwiki-latest-pages-articles.xml.bz2 >> nrwiki.xml
rm -f nrwiki-latest-pages-articles.xml.bz2

echo "[*] Spliting ..."
split --lines=500000 nrwiki.xml
rm -f nrwiki.xml

f_working

echo "[*] Unifyng and Sorting ..."
cat x*.txt | tr ' ' '\012' | sed -e '/^$/d' | sort -u >> nrwiki.txt
echo
echo "##############################"
echo

echo "[*] Deleting x* ..."
rm -f x*
echo
echo "##############################"
echo

}

# Norwegian (Bokmål) (no)
f_no () {

${downloader} http://dumps.wikimedia.org/nowiki/latest/nowiki-latest-pages-articles.xml.bz2
bzip2 -d -c nowiki-latest-pages-articles.xml.bz2 >> nowiki.xml
rm -f nowiki-latest-pages-articles.xml.bz2

echo "[*] Spliting ..."
split --lines=500000 nowiki.xml
rm -f nowiki.xml

f_working

echo "[*] Unifyng and Sorting ..."
cat x*.txt | tr ' ' '\012' | sed -e '/^$/d' | sort -u >> nowiki.txt
echo
echo "##############################"
echo

echo "[*] Deleting x* ..."
rm -f x*
echo
echo "##############################"
echo

}

# Persian (fa)
f_fa () {

${downloader} http://dumps.wikimedia.org/fawiki/latest/fawiki-latest-pages-articles.xml.bz2
bzip2 -d -c fawiki-latest-pages-articles.xml.bz2 >> fawiki.xml
rm -f fawiki-latest-pages-articles.xml.bz2

echo "[*] Spliting ..."
split --lines=500000 fawiki.xml
rm -f fawiki.xml

f_working

echo "[*] Unifyng and Sorting ..."
cat x*.txt | tr ' ' '\012' | sed -e '/^$/d' | sort -u >> fawiki.txt
echo
echo "##############################"
echo

echo "[*] Deleting x* ..."
rm -f x*
echo
echo "##############################"
echo

}

# Piedmontese (pms)
f_pms () {

${downloader} http://dumps.wikimedia.org/pmswiki/latest/pmswiki-latest-pages-articles.xml.bz2
bzip2 -d -c pmswiki-latest-pages-articles.xml.bz2 >> pmswiki.xml
rm -f pmswiki-latest-pages-articles.xml.bz2

echo "[*] Spliting ..."
split --lines=50000 pmswiki.xml
rm -f pmswiki.xml

f_working

echo "[*] Unifyng and Sorting ..."
cat x*.txt | tr ' ' '\012' | sed -e '/^$/d' | sort -u >> pmswiki.txt
echo
echo "##############################"
echo

echo "[*] Deleting x* ..."
rm -f x*
echo
echo "##############################"
echo

}

# Polski (pl)
f_pl () {

${downloader} http://dumps.wikimedia.org/plwiki/latest/plwiki-latest-pages-articles.xml.bz2
bzip2 -d -c plwiki-latest-pages-articles.xml.bz2 >> plwiki.xml
rm -f plwiki-latest-pages-articles.xml.bz2

echo "[*] Spliting ..."
split --lines=500000 plwiki.xml
rm -f plwiki.xml

f_working

echo "[*] Unifyng and Sorting ..."
cat x*.txt | tr ' ' '\012' | sed -e '/^$/d' | sort -u >> plwiki.txt
echo
echo "##############################"
echo

echo "[*] Deleting x* ..."
rm -f x*
echo
echo "##############################"
echo

}

# Portuguese (pt)
f_pt () {

${downloader} http://dumps.wikimedia.org/ptwiki/latest/ptwiki-latest-pages-articles.xml.bz2
bzip2 -d -c ptwiki-latest-pages-articles.xml.bz2 >> ptwiki.xml
rm -f ptwiki-latest-pages-articles.xml.bz2

echo "[*] Spliting ..."
split --lines=500000 ptwiki.xml
rm -f ptwiki.xml

f_working

echo "[*] Unifyng and Sorting ..."
cat x*.txt | tr ' ' '\012' | sed -e '/^$/d' | sort -u >> ptwiki.txt
echo
echo "##############################"
echo

echo "[*] Deleting x* ..."
rm -f x*
echo
echo "##############################"
echo

}

# Romanian (ro)
f_ro () {

${downloader} http://dumps.wikimedia.org/rowiki/latest/rowiki-latest-pages-articles.xml.bz2
bzip2 -d -c rowiki-latest-pages-articles.xml.bz2 >> rowiki.xml
rm -f rowiki-latest-pages-articles.xml.bz2

echo "[*] Spliting ..."
split --lines=500000 rowiki.xml
rm -f rowiki.xml

f_working

echo "[*] Unifyng and Sorting ..."
cat x*.txt | tr ' ' '\012' | sed -e '/^$/d' | sort -u >> rowiki.txt
echo
echo "##############################"
echo

echo "[*] Deleting x* ..."
rm -f x*
echo
echo "##############################"
echo

}

# Russian (ru)
f_ru () {

${downloader} http://dumps.wikimedia.org/ruwiki/latest/ruwiki-latest-pages-articles.xml.bz2
bzip2 -d -c ruwiki-latest-pages-articles.xml.bz2 >> ruwiki.xml
rm -f ruwiki-latest-pages-articles.xml.bz2

echo "[*] Spliting ..."
split --lines=500000 ruwiki.xml
rm -f ruwiki.xml

f_working

echo "[*] Unifyng and Sorting ..."
cat x*.txt | tr ' ' '\012' | sed -e '/^$/d' | sort -u >> ruwiki.txt
echo
echo "##############################"
echo

echo "[*] Deleting x* ..."
rm -f x*
echo
echo "##############################"
echo

}

# Scottish Gaelic (gd)
f_gd () {

${downloader} http://dumps.wikimedia.org/gdwiki/latest/gdwiki-latest-pages-articles.xml.bz2
bzip2 -d -c gdwiki-latest-pages-articles.xml.bz2 >> gdwiki.xml
rm -f gdwiki-latest-pages-articles.xml.bz2

echo "[*] Spliting ..."
split --lines=50000 gdwiki.xml
rm -f gdwiki.xml

f_working

echo "[*] Unifyng and Sorting ..."
cat x*.txt | tr ' ' '\012' | sed -e '/^$/d' | sort -u >> gdwiki.txt
echo
echo "##############################"
echo

echo "[*] Deleting x* ..."
rm -f x*
echo
echo "##############################"
echo

}

# Serbian (sr)
f_sr () {

${downloader} http://dumps.wikimedia.org/srwiki/latest/srwiki-latest-pages-articles.xml.bz2
bzip2 -d -c srwiki-latest-pages-articles.xml.bz2 >> srwiki.xml
rm -f srwiki-latest-pages-articles.xml.bz2

echo "[*] Spliting ..."
split --lines=500000 srwiki.xml
rm -f srwiki.xml

f_working

echo "[*] Unifyng and Sorting ..."
cat x*.txt | tr ' ' '\012' | sed -e '/^$/d' | sort -u >> srwiki.txt
echo
echo "##############################"
echo

echo "[*] Deleting x* ..."
rm -f x*
echo
echo "##############################"
echo

}

# Sicilian 	(scn)
f_scn () {

${downloader} http://dumps.wikimedia.org/skwiki/latest/skwiki-latest-pages-articles.xml.bz2
bzip2 -d -c skwiki-latest-pages-articles.xml.bz2 >> skwiki.xml
rm -f skwiki-latest-pages-articles.xml.bz2

echo "[*] Spliting ..."
split --lines=500000 skwiki.xml
rm -f skwiki.xml

f_working

echo "[*] Unifyng and Sorting ..."
cat x*.txt | tr ' ' '\012' | sed -e '/^$/d' | sort -u >> skwiki.txt
echo
echo "##############################"
echo

echo "[*] Deleting x* ..."
rm -f x*
echo
echo "##############################"
echo

}

# Slovak (sk)
f_sk () {

${downloader} http://dumps.wikimedia.org/skwiki/latest/skwiki-latest-pages-articles.xml.bz2
bzip2 -d -c skwiki-latest-pages-articles.xml.bz2 >> skwiki.xml
rm -f skwiki-latest-pages-articles.xml.bz2

echo "[*] Spliting ..."
split --lines=500000 skwiki.xml
rm -f skwiki.xml

f_working

echo "[*] Unifyng and Sorting ..."
cat x*.txt | tr ' ' '\012' | sed -e '/^$/d' | sort -u >> skwiki.txt
echo
echo "##############################"
echo

echo "[*] Deleting x* ..."
rm -f x*
echo
echo "##############################"
echo

}

# Slovene (sl)
f_sl () {

${downloader} http://dumps.wikimedia.org/slwiki/latest/slwiki-latest-pages-articles.xml.bz2
bzip2 -d -c slwiki-latest-pages-articles.xml.bz2 >> slwiki.xml
rm -f slwiki-latest-pages-articles.xml.bz2

echo "[*] Spliting ..."
split --lines=500000 slwiki.xml
rm -f slwiki.xml

f_working

echo "[*] Unifyng and Sorting ..."
cat x*.txt | tr ' ' '\012' | sed -e '/^$/d' | sort -u >> slwiki.txt
echo
echo "##############################"
echo

echo "[*] Deleting x* ..."
rm -f x*
echo
echo "##############################"
echo

}

# Swedish (sv)
f_sv () {

${downloader} http://dumps.wikimedia.org/svwiki/latest/svwiki-latest-pages-articles.xml.bz2
bzip2 -d -c svwiki-latest-pages-articles.xml.bz2 >> svwiki.xml
rm -f svwiki-latest-pages-articles.xml.bz2

echo "[*] Spliting ..."
split --lines=500000 svwiki.xml
rm -f svwiki.xml

f_working

echo "[*] Unifyng and Sorting ..."
cat x*.txt | tr ' ' '\012' | sed -e '/^$/d' | sort -u >> svwiki.txt
echo
echo "##############################"
echo

echo "[*] Deleting x* ..."
rm -f x*
echo
echo "##############################"
echo

}

# Swahili (sw)
f_sw () {

${downloader} http://dumps.wikimedia.org/swwiki/latest/swwiki-latest-pages-articles.xml.bz2
bzip2 -d -c swwiki-latest-pages-articles.xml.bz2 >> swwiki.xml
rm -f swwiki-latest-pages-articles.xml.bz2

echo "[*] Spliting ..."
split --lines=500000 swwiki.xml
rm -f swwiki.xml

f_working

echo "[*] Unifyng and Sorting ..."
cat x*.txt | tr ' ' '\012' | sed -e '/^$/d' | sort -u >> swwiki.txt
echo
echo "##############################"
echo

echo "[*] Deleting x* ..."
rm -f x*
echo
echo "##############################"
echo

}

# Tarantino (roa-tara)
f_roa_tara () {

${downloader} http://dumps.wikimedia.org/roa-tarawiki/latest/roa-tarawiki-latest-pages-articles.xml.bz2
bzip2 -d -c roa-tarawiki-latest-pages-articles.xml.bz2 >> roa-tarawiki.xml
rm -f roa-tarawiki-latest-pages-articles.xml.bz2

echo "[*] Spliting ..."
split --lines=500000 roa-tarawiki.xml
rm -f roa-tarawiki.xml

f_working

echo "[*] Unifyng and Sorting ..."
cat x*.txt | tr ' ' '\012' | sed -e '/^$/d' | sort -u >> roa-tarawiki.txt
echo
echo "##############################"
echo

echo "[*] Deleting x* ..."
rm -f x*
echo
echo "##############################"
echo

}

# Turkish (tr)
f_tr () {

${downloader} http://dumps.wikimedia.org/trwiki/latest/trwiki-latest-pages-articles.xml.bz2
bzip2 -d -c trwiki-latest-pages-articles.xml.bz2 >> trwiki.xml
rm -f trwiki-latest-pages-articles.xml.bz2

echo "[*] Spliting ..."
split --lines=500000 trwiki.xml
rm -f trwiki.xml

f_working

echo "[*] Unifyng and Sorting ..."
cat x*.txt | tr ' ' '\012' | sed -e '/^$/d' | sort -u >> trwiki.txt
echo
echo "##############################"
echo

echo "[*] Deleting x* ..."
rm -f x*
echo
echo "##############################"
echo

}

# Ukrainian (uk)
f_uk () {

${downloader} http://dumps.wikimedia.org/ukwiki/latest/ukwiki-latest-pages-articles.xml.bz2
bzip2 -d -c ukwiki-latest-pages-articles.xml.bz2 >> ukwiki.xml
rm -f ukwiki-latest-pages-articles.xml.bz2

echo "[*] Spliting ..."
split --lines=500000 ukwiki.xml
rm -f ukwiki.xml

f_working

echo "[*] Unifyng and Sorting ..."
cat x*.txt | tr ' ' '\012' | sed -e '/^$/d' | sort -u >> ukwiki.txt
echo
echo "##############################"
echo

echo "[*] Deleting x* ..."
rm -f x*
echo
echo "##############################"
echo

}

# Venetian 	(vec)
f_vec () {

${downloader} http://dumps.wikimedia.org/vecwiki/latest/vecwiki-latest-pages-articles.xml.bz2
bzip2 -d -c vecwiki-latest-pages-articles.xml.bz2 >> vecwiki.xml
rm -f vecwiki-latest-pages-articles.xml.bz2

echo "[*] Spliting ..."
split --lines=50000 vecwiki.xml
rm -f vecwiki.xml

f_working

echo "[*] Unifyng and Sorting ..."
cat x*.txt | tr ' ' '\012' | sed -e '/^$/d' | sort -u >> vecwiki.txt
echo
echo "##############################"
echo

echo "[*] Deleting x* ..."
rm -f x*
echo
echo "##############################"
echo

}

# Vietnamese (vi)
f_vi () {

${downloader} http://dumps.wikimedia.org/viwiki/latest/viwiki-latest-pages-articles.xml.bz2
bzip2 -d -c viwiki-latest-pages-articles.xml.bz2 >> viwiki.xml
rm -f viwiki-latest-pages-articles.xml.bz2

echo "[*] Spliting ..."
split --lines=500000 viwiki.xml
rm -f viwiki.xml

f_working

echo "[*] Unifyng and Sorting ..."
cat x*.txt | tr ' ' '\012' | sed -e '/^$/d' | sort -u >> viwiki.txt
echo
echo "##############################"
echo

echo "[*] Deleting x* ..."
rm -f x*
echo
echo "##############################"
echo

}

# Volapük (vo)
f_vo () {

${downloader} http://dumps.wikimedia.org/vowiki/latest/vowiki-latest-pages-articles.xml.bz2
bzip2 -d -c vowiki-latest-pages-articles.xml.bz2 >> vowiki.xml
rm -f vowiki-latest-pages-articles.xml.bz2

echo "[*] Spliting ..."
split --lines=500000 vowiki.xml
rm -f vowiki.xml

f_working

echo "[*] Unifyng and Sorting ..."
cat x*.txt | tr ' ' '\012' | sed -e '/^$/d' | sort -u >> vowiki.txt
echo
echo "##############################"
echo

echo "[*] Deleting x* ..."
rm -f x*
echo
echo "##############################"
echo

}

# Waray-Waray (war)
f_war () {

${downloader} http://dumps.wikimedia.org/warwiki/latest/warwiki-latest-pages-articles.xml.bz2
bzip2 -d -c warwiki-latest-pages-articles.xml.bz2 >> warwiki.xml
rm -f warwiki-latest-pages-articles.xml.bz2

echo "[*] Spliting ..."
split --lines=500000 warwiki.xml
rm -f warwiki.xml

f_working

echo "[*] Unifyng and Sorting ..."
cat x*.txt | tr ' ' '\012' | sed -e '/^$/d' | sort -u >> warwiki.txt
echo
echo "##############################"
echo

echo "[*] Deleting x* ..."
rm -f x*
echo
echo "##############################"
echo

}

# Yiddish (yi)
f_yi () {

${downloader} http://dumps.wikimedia.org/yiwiki/latest/yiwiki-latest-pages-articles.xml.bz2
bzip2 -d -c yiwiki-latest-pages-articles.xml.bz2 >> yiwiki.xml
rm -f yiwiki-latest-pages-articles.xml.bz2

echo "[*] Spliting ..."
split --lines=500000 yiwiki.xml
rm -f yiwiki.xml

f_working

echo "[*] Unifyng and Sorting ..."
cat x*.txt | tr ' ' '\012' | sed -e '/^$/d' | sort -u >> yiwiki.txt
echo
echo "##############################"
echo

echo "[*] Deleting x* ..."
rm -f x*
echo
echo "##############################"
echo

}

# Zulu (zu)
f_zu () {

${downloader} http://dumps.wikimedia.org/zutwiki/latest/zutwiki-latest-pages-articles.xml.bz2
bzip2 -d -c zutwiki-latest-pages-articles.xml.bz2 >> zutwiki.xml
rm -f zutwiki-latest-pages-articles.xml.bz2

echo "[*] Spliting ..."
split --lines=500000 zutwiki.xml
rm -f zutwiki.xml

f_working

echo "[*] Unifyng and Sorting ..."
cat x*.txt | tr ' ' '\012' | sed -e '/^$/d' | sort -u >> zutwiki.txt
echo
echo "##############################"
echo

echo "[*] Deleting x* ..."
rm -f x*
echo
echo "##############################"
echo

}

downloader=axel

hash axel &> /dev/null
if [ $? -eq 1 ]; then
    downloader=wget
fi

echo -en "Select the output dir (es: /home/user/wikiwordlist) : "
read out

echo -en "Select a temporal dir (es: /tmp) : "
read tmp

cd $tmp

# Downloading Wikies
f_download () {
	
f_af
f_ar
f_az
f_be
f_bg
f_ca
f_cs
f_da
f_de &
f_el
f_eml
f_en &
f_eo
f_es
f_et
f_eu
f_fa
f_fr &
f_ga
f_gd
f_gl
f_got
f_he
f_hr
f_hu
f_hy
f_id
f_it
f_ja
f_ko
f_la
f_lb
f_lij
f_lmo
f_lt
f_ms
f_nap
f_no
f_nr
f_pl
f_pms
f_pt
f_ro
f_roa_tara
f_ru
f_scn
f_sk
f_sl
f_sq
f_sr
f_sv
f_sw
f_tr
f_uk
f_vec
f_vi
f_vo
f_war
f_yi
f_zh
f_zu

}

f_download

clear

cat *.txt | sort -u >> wikipedia.txt
wc -l *.txt

mv wikipedia.txt $out/wikipedia.txt

cd $HOME

echo "Your wordlist is in $out"

exit 0


