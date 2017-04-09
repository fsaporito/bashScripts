#!/bin/bash

clear

echo "::: Pdf to text :::"
echo

hash pdftotext &> /dev/null

if [ $? -eq 1 ]; then

	echo "Error, pdftotext not found!!!"
	sleep 3
	exit 0

fi

echo -en "Select the dir where PDFs are contained (es: /home/user/pdf) : "
read dir
echo

echo -en "Select the tmp dir (es: /tmp) : "
read tmp
echo

echo -en "Select the output dir (es: /home/user/wordlist) : "
read out
echo

echo -en "Select the wordlist name (es: mypdf) : "
read out_name

clear

echo "::: Pdf to text :::"

f_computing ${dir} ${out_name}

########################################################################
# f_computing
# First Argument: PDF Directory
# Second Argument: Out Name
# es: f_computing pdf_d out_name
f_computing () {

echo
echo "[*] Trasforming every PDF to TXT"

cd ${1} #${dir}

n=1

FILE="/$tmp/count.txt"
ls *.pdf > ${FILE}

t=$(grep [^*$] $FILE -c)

for i in *.pdf; do
	if [ -e "$i" ]; then
		file=$( basename "$i" .pdf )
		echo -e -n "\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b ${n} / ${t}"
		pdftotext "$i" "$tmp/$file.txt" 2> /dev/null
		n=$[ $n + 1 ]
	fi
done

rm -f ${FILE}

cd ${tmp}

echo
echo "[*] Merging All TXT"

# tr ' ' '\012'  Transform every blanck space into a new line
# tr '[:upper:]' '[:lower:]' From Upper to Lower case
# sed -e '/^$/d' Delete all white lines
# $2 = out_name
cat *.txt | sed -e 's/[^a-zA-Z]/ /g' | tr ' ' '\012' | tr '[:upper:]' '[:lower:]' | sed -e '/^$/d' | sed -e '/aaa/d' | sed -e '/bbb/d' | sed -e '/ccc/d' | sed -e '/ddd/d' | sed -e '/eee/d' | sed -e '/fff/d' | sed -e '/ggg/d' | sed -e '/hhh/d' | sed -e '/iii/d' | sed -e '/jjj/d' | sed -e '/kkk/d' | sed -e '/lll/d' | sed -e '/mmm/d' | sed -e '/nnn/d' | sed -e '/ooo/d' | sed -e '/ppp/d' | sed -e '/qqq/d' | sed -e '/rrr/d' | sed -e '/sss/d' | sed -e '/ttt/d' | sed -e '/uuu/d' | sed -e '/vvv/d' | sed -e '/www/d' | sed -e '/xxx/d' | sed -e '/yyy/d' | sed -e '/zzz/d' | sed -e '/ààà/d' | sed -e '/èèè/d' | sed -e '/ììì/d' | sed -e '/òòò/d' | sed -e '/ùùù/d' | sort -u >> ${out}/${2}.txt 2> /dev/null

cd ${tmp}
rm -f *.txt

cd ${HOME}

echo "Done!"	

echo ""
	
}

exit 0
