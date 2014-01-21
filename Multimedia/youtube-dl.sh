#!/bin/bash

echo "[*] Youtube-dl Command Line Interface"
echo ""

hash youtube-dl &> /dev/null

if [ $? -eq 1 ]; then

    echo "Error, youtube-dl not found!!!"
    echo "Download it at https://github.com/rg3/youtube-dl"
    sleep 3
    exit 0

fi
 
echo -n "Input The Complete Url Of The Video: "
read url

cho=0
video=1
video_hd=2
audio =3
exit_cho=4

until [ ${cho} == ${video} ] || [ ${cho} == ${video_hd} ] || [ ${cho} == ${audio} ] || [ ${cho} == ${exit_cho} ]; do
	clear
	echo "[*] Options: "
	echo ""
	echo "1) Video Download"
	echo "2) Video Hd Download (If Avaiable)"
	echo "3) Audio Extraction (Require FFmpeg)"
	echo "4) Exit"
	echo ""
	echo -n "Choice  : "
	read cho
	echo "cho = $cho"
	sleep 2
done



case ${cho} in

1)  youtube-dl ${url} ;;

2)  youtube-dl --max-quality mp4 ${url} ;;

3)  youtube-dl --extract-audio --audio-format mp3 ${url} ;;

4)  exit 0 ;;

esac
	
