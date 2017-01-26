#!/bin/sh
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd )"

FILE1=ILA.command
echo "#!/bin/sh"	>$FILE1
echo ""			>>$FILE1
echo "cd \"$SCRIPTPATH\""	>>$FILE1
echo "java -Xms640m -Djava.library.path=\"$SCRIPTPATH/SpeechData/Pocketsphinx/Mac\" -Xdock:icon=$SCRIPTPATH/Assets/ILA.png -jar ./ILA_Beta_v3.8.jar"	>>$FILE1
chmod +x $FILE1
