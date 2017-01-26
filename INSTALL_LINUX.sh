#!/bin/bash
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd )"
CPUTYPE="$(uname -m)"

echo "note: please make sure to use 'bash INSTALL_LINUX.sh' (not 'sh ...)'"

if ( [[ "$CPUTYPE" == *"arm"* ]] || [[ "$CPUTYPE" == *"ARM"* ]] )
then
	echo "ILA: assuming you are using an ARM system"
	LIBFOLDER="Linux_ARM"
else
	echo "ILA: assuming you are using an Intel/AMD system"
	LIBFOLDER="Linux_x86"
fi

FILE1=START_Debug.sh
echo "#!/bin/bash"	>$FILE1
echo ""			>>$FILE1
echo "cd \"$SCRIPTPATH\""	>>$FILE1
echo "java -Djava.library.path=\"$SCRIPTPATH/SpeechData/Pocketsphinx/$LIBFOLDER\" -Xmx640m -jar ILA_Beta_v3.8.jar"	>>$FILE1
chmod +x $FILE1

FILE2=ILA_Linux.desktop
echo "#!/usr/bin/env xdg-open" 	> $FILE2
echo ""				>> $FILE2
echo "[Desktop Entry]"		>> $FILE2
echo "Name=ILA"			>> $FILE2
echo "Comment=ILA - teachable, customizable, open voice assistant"	>> $FILE2
echo "Exec=$SCRIPTPATH/START_Debug.sh"		>> $FILE2
echo "Terminal=false"		>> $FILE2
echo "Type=Application"		>> $FILE2
echo "Icon=$SCRIPTPATH/Assets/ILA.png"	>> $FILE2
chmod +x $FILE2

echo "ILA: I'm ready! :-)"
