#!/bin/bash
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------


main_process () {

	input_1=$(zenity --file-selection --icon-name=applications-games --title="Select The *.ecm File You Wish To Convert" --file-filter="*.ecm" 2> /dev/null)

	echo ""ecm2bin "'$input_1'" "'$input_1.bin'""" | xclip;

	xclip -o | $SHELL;
	
	process_complete
}


process_complete () {

	zenity --notification --window-icon=face-smile-big.png --text="Complete!"  2> /dev/null

	zenity --question --icon-name=applications-games --text="Convert Another File(s)?" --timeout=10 --default-cancel --cancel-label=No --ok-label="Yes" 2>/dev/null
	if [ $? = 0 ] ; then
		
		main_process
		
	elif [ $? = 1 ] ; then
		
		exit
		
	fi
}


##################### Start Sequence

main_process

chmod +x ecm2bin.sh
