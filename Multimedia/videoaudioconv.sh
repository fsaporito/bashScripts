#!/bin/bash



# Video Converter
f_video () {

	clear

	echo -en "Write the Video file path (es: /home/user/Video/video.mp4) : "
	read input

	clear

	echo -en "Write the output path (es: /home/user/output [ No extension ]) : "
	read output

	clear

	echo -en "Write the output files extension (es : avi ) : "
	read ext

	clear

	echo "[*] Converting ..."
	ffmpeg -i ${input} -f ${ext} -ab 192000 -sameq ${output}.${ext} 1> /dev/null 2> /dev/null

	echo "#############################################"
	echo
	echo "The file Has Been Converted, you will find it in $output.$ext "

	exit 0

}


# Audio Converter
f_audio () {

	clear

	echo -en "Write the Audio file path (es: /home/user/Music/music.mp3) : "
	read input

	clear

	echo -en "Write the output path (es: /home/user/output [ No extension ]) : "
	read output

	clear

	echo -en "Write the output files extension (es : acc ) : "
	read ext

	clear

	echo "[*] Converting ..."

	ffmpeg -i ${input} -f ${ext} -ab 192000 -vn ${output}.${ext} 1> /dev/null 2> /dev/null

	echo "#############################################"
	echo
	echo "The file Has Been Converted, you will find it in $output.$ext "

	exit 0

}


# Audio Extractor
f_audio_extractor () {

clear
	
	echo -en "Write the Video file path (es: /home/user/Video/video.mp4) : "
	read input

	clear

	echo -en "Write the output path (es: /home/user/output [ No extension ]) : "
	read output

	clear

	echo -en "Write the output files extension (es : mp3 ) : "
	read ext

	clear

	echo "[*] Converting ..."
	ffmpeg -i ${input} -f ${ext} -ab 192000 -vn ${output}.${ext} 1> /dev/null 2> /dev/null

	echo "#############################################"
	echo
	echo "The Audio Has Been Extracted, you will find it in $output.$ext "

	exit 0

}


# Menu
f_menu () {

	echo "[*] This Program Uses Ffmpeg to converts multimedial files or to extract the audio : "
	
	hash ffmpeg &> /dev/null

	if [ $? -eq 1 ]; then

		echo "Error, ffmpeg not found!!!"
		sleep 3
		exit 0

	fi


	convert=0
	video=1
	audio=2
	audio_extractor=3

	until [ ${convert} == ${video} ] || [ ${convert} == ${video} ] || [ ${convert} == ${audio} ] || [ ${convert} == ${audio_extractor} ]; do
		
		clear
		
		echo " This Program Uses Ffmpeg to converts multimedial files or to extract the audio : "
		echo
	
		echo "1) Converti Un File Video In Un Altro Formato"
		echo "2) Converti Un File Audio In Un Altro Formato"
		echo "3) Estrai L'Audio Da Un File Video"
		echo
		
		echo -en "Seleziona lopzione desiderata : "
		read convert
	
	done

	# Video Conversion
	if [ ${convert} == ${video} ]; then
		
		f_video
	
	fi

	# Audio Conversion
	if [ ${convert} == ${audio} ]; then
		
		f_audio
	fi

	# Audio Extraction
	if [ ${convert} == ${audio_extractor} ]; then
		
		f_audio_extractor
	
	fi

}

f_menu


