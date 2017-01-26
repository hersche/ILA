Hello and welcome to I.L.A. - Intelligent Learning Assistant
-------------------------------------------------------------

I'm happy you decided to try out ILA :-) to get started just extract the downloaded ZIP-file to your location of choice

(if you are reading this you probably already did ^^) then doubleclick one of the INSTALL_xyz scripts (Win, Mac, Linux)

Using Linux or Mac you probably have to set the script to be executable first by using 'chmod +x INSTALL*' from the

terminal and then run the script with 'bash INSTALL_LINUX.sh' or './INSTALL_MAC.command'. It will simply create a 

shortcut of ILA with parameters to increase the available JavaVM memory and set the path to the Pocketsphinx libraries

which will depend on your OS.  Connect a (good quality ^^) microphone, use the shortcut to start and you are ready to 

go! :-) - note: Please make sure you have the latest Java installed!

ILA is in beta status so you might experience some bugs and functions that are still work in progress, don't be to

hard to 'her' ;-). This program is rapidly evolving, be sure to check

 https://sites.google.com/site/ilavoiceassistant/

from time to time for updates and to get some help and tips.

Please use the START_Debug scripts to track down errors if you have problems running ILA. This will help you to identify

any problems like a missing/outdated Java version or wrong libraries for Pocketsphinx etc. ILA should work on Windows,

Mac and Linux, as long as you have at least Java v7 installed (https://www.java.com/de/download/) and about 400MB of free

memory (better 1GB ^^, ~200MB if you are using Pocketsphinx, ~80MB if you use only google's cloud speech recognition).

I recommend to install the latest Oracle Java v8 if you are using Linux:

 http://www.webupd8.org/2012/09/install-oracle-java-8-in-ubuntu-via-ppa.html

If you cannot start ILA try two things: first install the latest Java version (and make sure it is active, in Linux e.g.

try 'Java -version' to check) and if you have a 32bit operating system with not too much memory try to set the -Xmx640m

parameter inside the START_debug script to e.g. -Xmx400m (this will set the memory for the Java VM). The same file also

contains the link to the Pocketsphinx libraries and you might have to get proper ones before you can use it (see homepage

for details, windows libraries are included and should work).

In the Assets folder you can find some icons to create a nice desktop shortcut :-) If you pin this shortcut to your

Windows 8 start screen you should also see the ILA-avatar picture defined in the manifest.xml.


note: to use ILA with Google cloud recognition please install Chrome/Chromium, ILA will start it automatically.
---------------------------------------------------------------------------------------------------------------

Since version beta 3.7 the old key requirements for Google are gone. It uses the Google web speech API now! Unfortunately

the web speech API works only in Chrome/Chromium right now (correct me if I'm wrong) so you have to install one of these

browsers to use it (but I assure you it's worth it ^^). For more details please visit the ILA homepage.



Good luck and have fun!

- Florian
