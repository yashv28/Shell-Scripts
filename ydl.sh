echo "#!/bin/bash
if [ -z \$1 ]; then 
	echo \"Usage: ydl [URL] [OPTIONS = audio/240/360/480/720/1080/1440/4k]\";
	echo \"       ydl [URL] -F\";
	exit;
elif [ \$1 = \"--help\" ]; then
	echo \"Usage: ydl [URL] [OPTIONS = audio/240/360/480/720/1080/1440/4k]\";
	echo \"       ydl [URL] -F\";
	exit;
fi
ID=\${1:\${#1}-11:\${#1}};
if [ -z \$2 ]; then 
	youtube-dl \$1 || exit;
elif [ \$2 = \"audio\" ]; then
	youtube-dl -x --audio-format mp3 --audio-quality 0 \$1;
elif [ \$2 = \"240\" ]; then
	youtube-dl -f 133+140 --merge-output-format mp4 \$1;
elif [ \$2 = \"360\" ]; then 
	youtube-dl -f 134+140 --merge-output-format mp4 \$1;
elif [ \$2 = \"480\" ]; then 
	youtube-dl -f 135+140 --merge-output-format mp4 \$1;
elif [ \$2 = \"720\" ]; then 
	youtube-dl -f 22 \$1;
elif [ \$2 = \"1080\" ]; then 
	youtube-dl -f 137+140 --merge-output-format mp4 \$1;
elif [ \$2 = \"1440\" ]; then 
	youtube-dl -f 264+140 --merge-output-format mp4 \$1;
elif [ \$2 = \"4k\" ]; then 
	youtube-dl -f 266+140 --merge-output-format mp4 \$1;
elif [ \$2 = \"-F\" ]; then 
	youtube-dl -F \$1;
	exit;
else 
	echo \"Usage: ydl [URL] [OPTIONS = audio/240/360/480/720/1080/1440/4k]\";
	echo \"       ydl [URL] -F\";
	exit;
fi
FILE=\"ls |grep \$ID\"
FILE=\`eval \$FILE\`
mv \"\`echo \$FILE\`\" ~/Downloads/\"\`echo \$FILE\`\"
rename \"\s/-\$ID\S/./\" * ~/Downloads/\"\$FILE\"" | sudo tee /bin/ydl > /dev/null && sudo chmod 755 /bin/ydl