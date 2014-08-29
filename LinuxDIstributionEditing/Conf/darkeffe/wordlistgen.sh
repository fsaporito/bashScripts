#!/bin/bash

# PdfToText
f_pdf_to_text () {

clear

echo -en "If You Need To Install pdftotext, Tape yes: "
read install

y=yes
if [ $install == $y ]; then
	echo
	echo [*] Installing PdfToText ...
	apt-get install -y --force-yes pdftotext 1> /dev/null 2> /dev/null
fi

clear

echo "::: Pdf to text :::"
echo
echo -en "Select the dir where PDFs are contained (es: /home/user/pdf) : "
read dir
echo
echo -en "Select the tmp dir (es: /tmp) : "

echo -en "Select the output dir (es: /home/user/wordlist) : "
read out

clear

echo "::: Pdf to text :::"

echo
echo "[*] Trasforming every PDF to TXT"

cd $dir

n=1

FILE="/$tmp/count.txt"
ls *.pdf > $FILE

t=$(grep [^*$] $FILE -c)

for i in *.pdf; do
	if [ -e "$i" ]; then
		file=`basename "$i" .pdf`
		echo $n / $t
		pdftotext "$i" "$tmp/$file.txt" 2> /dev/null
		n=$[ $n + 1 ]
	fi
done

rm -f $FILE

echo
echo "[*] Merging All TXT"
cat *.txt | sed -e 's/[^a-zA-Z]/ /g' | sed -e '/aaa/d' | sed -e '/bbb/d' | sed -e '/ccc/d' | sed -e '/ddd/d' | sed -e '/eee/d' | sed -e '/fff/d' | sed -e '/ggg/d' | sed -e '/hhh/d' | sed -e '/iii/d' | sed -e '/jjj/d' | sed -e '/kkk/d' | sed -e '/lll/d' | sed -e '/mmm/d' | sed -e '/nnn/d' | sed -e '/ooo/d' | sed -e '/ppp/d' | sed -e '/qqq/d' | sed -e '/rrr/d' | sed -e '/sss/d' | sed -e '/ttt/d' | sed -e '/uuu/d' | sed -e '/vvv/d' | sed -e '/www/d' | sed -e '/xxx/d' | sed -e '/yyy/d' | sed -e '/zzz/d' | sed -e '/ààà/d' | sed -e '/èèè/d' | sed -e '/ììì/d' | sed -e '/òòò/d' | sed -e '/ùùù/d' | sed -e '/£££/d' | sed -e '/&&&/d' | sed -e '/ççç/d' | sed -e '/§§§/d' | sed -e '/$$$/d' | tr ' ' '\012' | tr '[:upper:]' '[:lower:]' | sed -e '/^$/d' | sort -u >> $out/pdf.txt 2> /dev/null

cd $tmp
rm -f *.txt
cd $HOME

echo
echo "Done!"

}

# Catdoc
f_catdoc () {

clear

echo -en "If You Need To Install catdoc, Tape yes: "
read install

y=yes
if [ $install == $y ]; then
	echo
	echo [*] Installing CatDoc ...
	apt-get install -y --force-yes catdoc 1> /dev/null 2> /dev/null
fi

clear

echo "::: CatDoc:::"
echo
echo -en "Select the dir where DOCs are contained (es: /home/user/doc) : "
read dir
echo
echo -en "Select the tmp dir (es: /tmp) : "

echo -en "Select the output dir (es: /home/user/wordlist) : "
read out

clear

echo "::: CatDoc :::"

echo
echo "[*] Trasforming every DOC to TXT"

cd $dir

n=1

FILE="/$tmp/count.txt"
ls *.doc > $FILE

t=$(grep [^*$] $FILE -c)

for i in *.doc; do
	if [ -e "$i" ]; then
		file=`basename "$i" .doc`
		echo $n / $t
		catdoc -a  "$i" >> "$tmp/$file.txt" 2> /dev/null
		n=$[ $n + 1 ]
	fi
done

rm -f $FILE

echo
echo "[*] Merging All TXT"

cat *.txt | sed -e 's/[^a-zA-Z]/ /g' | sed -e '/aaa/d' | sed -e '/bbb/d' | sed -e '/ccc/d' | sed -e '/ddd/d' | sed -e '/eee/d' | sed -e '/fff/d' | sed -e '/ggg/d' | sed -e '/hhh/d' | sed -e '/iii/d' | sed -e '/jjj/d' | sed -e '/kkk/d' | sed -e '/lll/d' | sed -e '/mmm/d' | sed -e '/nnn/d' | sed -e '/ooo/d' | sed -e '/ppp/d' | sed -e '/qqq/d' | sed -e '/rrr/d' | sed -e '/sss/d' | sed -e '/ttt/d' | sed -e '/uuu/d' | sed -e '/vvv/d' | sed -e '/www/d' | sed -e '/xxx/d' | sed -e '/yyy/d' | sed -e '/zzz/d' | sed -e '/ààà/d' | sed -e '/èèè/d' | sed -e '/ììì/d' | sed -e '/òòò/d' | sed -e '/ùùù/d' | sed -e '/£££/d' | sed -e '/&&&/d' | sed -e '/ççç/d' | sed -e '/§§§/d' | sed -e '/$$$/d' | tr ' ' '\012' | tr '[:upper:]' '[:lower:]' | sed -e '/^$/d' | sort -u >> $out/doc.txt 2> /dev/null

cd $tmp
rm -f *.txt
cd $HOME

echo
echo "Done!"

}

# Html2Text
f_html_to_text () {

clear

echo -en "If You Need To Install html2text, Tape yes: "
read install

y=yes
if [ $install == $y ]; then
	echo
	echo [*] Installing Html2Text ...
	apt-get install -y --force-yes html2text 1> /dev/null 2> /dev/null
fi

clear

echo "::: Html to text :::"
echo
echo -en "Select the dir where HTMLs are contained (es: /home/user/html) : "
read dir
echo
echo -en "Select the tmp dir (es: /tmp) : "

echo -en "Select the output dir (es: /home/user/wordlist) : "
read out

clear

echo "::: Html to text :::"

echo
echo "[*] Trasforming every HTML to TXT"

cd $dir

n=1

FILE="/$tmp/count.txt"
ls *.html > $FILE

t=$(grep [^*$] $FILE -c)

for i in *.html; do
	if [ -e "$i" ]; then
		file=`basename "$i" .html`
		echo $n / $t
		cat "$i" | html2text >> "$tmp/$file.txt" 2> /dev/null
		n=$[ $n + 1 ]
	fi
done

rm -f $FILE

echo
echo "[*] Merging All TXT"

cat *.txt | sed -e 's/[^a-zA-Z]/ /g' | sed -e '/aaa/d' | sed -e '/bbb/d' | sed -e '/ccc/d' | sed -e '/ddd/d' | sed -e '/eee/d' | sed -e '/fff/d' | sed -e '/ggg/d' | sed -e '/hhh/d' | sed -e '/iii/d' | sed -e '/jjj/d' | sed -e '/kkk/d' | sed -e '/lll/d' | sed -e '/mmm/d' | sed -e '/nnn/d' | sed -e '/ooo/d' | sed -e '/ppp/d' | sed -e '/qqq/d' | sed -e '/rrr/d' | sed -e '/sss/d' | sed -e '/ttt/d' | sed -e '/uuu/d' | sed -e '/vvv/d' | sed -e '/www/d' | sed -e '/xxx/d' | sed -e '/yyy/d' | sed -e '/zzz/d' | sed -e '/ààà/d' | sed -e '/èèè/d' | sed -e '/ììì/d' | sed -e '/òòò/d' | sed -e '/ùùù/d' | sed -e '/£££/d' | sed -e '/&&&/d' | sed -e '/ççç/d' | sed -e '/§§§/d' | sed -e '/$$$/d' | tr ' ' '\012' | tr '[:upper:]' '[:lower:]' | sed -e '/^$/d' | sort -u >> $out/html.txt 2> /dev/null

cd $tmp
rm -f *.txt
cd $HOME

echo
echo "Done!"

}

# Id3v2
f_id3v2 () {

clear

echo -en "If You Need To Install id3v2, Tape yes: "
read install

y=yes
if [ $install == $y ]; then
	echo
	echo [*] Installing Id3v2 ...
	apt-get install -y --force-yes id3v2 1> /dev/null 2> /dev/null
fi

clear

echo "::: Id3v2 :::"
echo
echo -en "Select the dir where MP3s are contained (es: /home/user/music) : "
read dir
echo
echo -en "Select the tmp dir (es: /tmp) : "

echo -en "Select the output dir (es: /home/user/wordlist) : "
read out

clear

echo "::: Id3v2 :::"

echo
echo "[*] Estracting The MP3 tags"

cd $dir

n=1

FILE="/$tmp/count.txt"
ls *.mp3 > $FILE

t=$(grep [^*$] $FILE -c)

for i in *.mp3; do
	if [ -e "$i" ]; then
		file=`basename "$i" .mp3`
		echo $n / $t
		id3v2 -l "$i" >> "$tmp/$file.txt" 2> /dev/null
		n=$[ $n + 1 ]
	fi
done

rm -f $FILE

echo
echo "[*] Merging All TXT"

cat *.txt | sed -e 's/[^a-zA-Z]/ /g' | sed -e '/aaa/d' | sed -e '/bbb/d' | sed -e '/ccc/d' | sed -e '/ddd/d' | sed -e '/eee/d' | sed -e '/fff/d' | sed -e '/ggg/d' | sed -e '/hhh/d' | sed -e '/iii/d' | sed -e '/jjj/d' | sed -e '/kkk/d' | sed -e '/lll/d' | sed -e '/mmm/d' | sed -e '/nnn/d' | sed -e '/ooo/d' | sed -e '/ppp/d' | sed -e '/qqq/d' | sed -e '/rrr/d' | sed -e '/sss/d' | sed -e '/ttt/d' | sed -e '/uuu/d' | sed -e '/vvv/d' | sed -e '/www/d' | sed -e '/xxx/d' | sed -e '/yyy/d' | sed -e '/zzz/d' | sed -e '/ààà/d' | sed -e '/èèè/d' | sed -e '/ììì/d' | sed -e '/òòò/d' | sed -e '/ùùù/d' | sed -e '/£££/d' | sed -e '/&&&/d' | sed -e '/ççç/d' | sed -e '/§§§/d' | sed -e '/$$$/d' | tr ' ' '\012' | tr '[:upper:]' '[:lower:]' | sed -e '/^$/d' | sort -u >> $out/music.txt 2> /dev/null

cd $tmp
rm -f *.txt
cd $HOME

echo
echo "Done!"

}



# Menu
f_menu () {

clear

while :

do

"======================================================

This Script Lets You Transform Your File to Wordlist

=======================================================
Dependecies:

PdfToText
Catdoc
Html2text
id32v

=======================================================

1) Create a Wordlist from your PDF Files
2) Create a Wordlist from your DOC files
3) Create a Wordlist from your HTML files
4) Create a WordList from your MP3 files TAG

=======================================================

"
echo -en " Select a operation from the menu: "

read choice

case $choice in

1) f_pdf_to_text ;;

2) f_catdoc ;;

3) f_html_to_text ;;

4) f_id3v2 ;;

*) echo "$choice is not valid "; sleep 3 ;;

esac

done

}


f_menu
