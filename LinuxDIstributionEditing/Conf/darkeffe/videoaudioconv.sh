#!/bin/bash

f_video () {
	
clear

echo -en "Write the Video file path (es: /home/user/Video/video.mp4) : " 
read input

clear

echo -en "Write the output path (es: /home/user/output [ No extension ]) : " 
read output 

clear

echo -en "Write the output file's extension (es : avi ) : "
read ext

clear

echo "[*] Converting ..."
ffmpeg -i $input -f $ext -ab 192000 -sameq $output.$ext 1> /dev/null 2> /dev/null

echo "#############################################"
echo
echo "The file Has Been Converted, you will find it in $output.$ext "

}

f_audio () {
	
clear

echo -en "Write the Audio file path (es: /home/user/Music/music.mp3) : " 
read input

clear

echo -en "Write the output path (es: /home/user/output [ No extension ]) : " 
read output 

clear

echo -en "Write the output file's extension (es : acc ) : "
read ext

clear

echo "[*] Converting ..."

ffmpeg -i $input -f $ext -ab 192000 -vn $output.$ext 1> /dev/null 2> /dev/null

echo "#############################################"
echo
echo "The file Has Been Converted, you will find it in $output.$ext "

}

f_videoaudio () {
	
clear

echo -en "Write the Video file path (es: /home/user/Video/video.mp4) : " 
read input

clear

echo -en "Write the output path (es: /home/user/output [ No extension ]) : " 
read output 

clear

echo -en "Write the output file's extension (es : mp3 ) : "
read ext

clear

echo "[*] Converting ..."
ffmpeg -i $input -f $ext -ab 192000 -vn $output.$ext 1> /dev/null 2> /dev/null

echo "#############################################"
echo
echo "The Audio Has Been Extracted, you will find it in $output.$ext "

}

f_menu () {
	
convert=0
video=1
audio=2
videoaudio=3
until [ $convert == $video ] || [ $convert == $video ] || [ $convert == $audio ] || [ $convert == $videoaudio ]; do
	clear
	echo " Questo programma usa ffmpeg per effettuare conversioni tra file multimediali ed estrarre l'audio da file : "
	echo
	echo "1) Converti Un File Video In Un Altro Formato"
	echo "2) Converti Un File Audio In Un Altro Formato"
	echo "3) Estrai L'Audio Da Un File Video"
	echo
	echo -en "Seleziona l'opzione desiderata : "
	read convert
done

if [ $convert == $video ]; then
	f_video
fi
if [ $convert == $audio ]; then
	f_audio
fi
if [ $convert == $videoaudio ]; then
	f_videoaudio
fi

}
	
f_menu
