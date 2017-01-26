This folder contains the necessary libraries to run Pocketsphinx in Java. It is by no
means complete and you might have to build your own libraries if you experience 
problems with your OS. The Windows 8 libraries should work well for Win7 and Vista,
maybe even XP. So far this folder contains the following builds:

- Win32: Windows 8.1 32bit compiled with Visual Studio 2013 and Java jdk 1.8.0_11
- Win64: Windows 8.1 64bit compiled with Visual Studio 2013 and Java jdk 1.8.0_11
- Linux_x86: Debian 7.8.0-i386 compiled with gcc using the MakeFile of the latest Pocketsphinx (March 2015, /Swig/Java) and Oracle Java-8
- Linux_x64: Ubuntu 14.0.4 compiled with gcc using the MakeFile of the latest Pocketsphinx (March 2015, /Swig/Java) and Oracle Java-8
- Linux_ARM: Xubuntu on Odroid U3 Exynos4412 Prime Cortex-A9 compiled with gcc using the MakeFile of the latest Pocketsphinx (March 2015, /Swig/Java) and Oracle Java-8
- Mac: nothing yet, might work with Linux lib (?)

Q: How do you get the library files that work for your OS?
A: The easiest way is to ask someone who has already done it for the same OS ^^ You might be lucky and it works for you aswell :-) If it doesn't I'm afraid you have to follow one of these tutorials.

CMU Pocketsphinx tutorial and installation guide:
--------------------------------------------------
http://cmusphinx.sourceforge.net/wiki/tutorialpocketsphinx

my windows tutorial:
---------------------
If you are using Windows the main files you need are pocketsphinx.dll, pocketsphinx_jni.dll, sphinxbase.dll and (depending on your Visual Studio Version) msvcr120.dll. The pocketsphinx_jni.dll is the wrapper for JNI to run the C code in Java. The way I build it was to include the wrapper files (see folder \JAVA_WRAPPER_FILES\ in 'ILA'\SpeechData\Pocketsphinx) in the Visual Studio project supplied by CMU which makes the pocketsphinx.dll redundant. There are many ways to do this but here is what works for me:

1) install a version of Visual Studio (or find someone who has ^^). I'm using VS Community 2013 (its free)
2) download the latest Pocketsphinx and Sphinxbase masters from GitHub (see link at the bottom)
3) extract Pocketsphinx-Master and Sphinxbase-Master to the same folder and rename the folders by removing the "-master" in the name, so that you get "any_folder\pocketsphinx\pocketsphinx.sln" and "any_folder\sphinxbase\sphinxbase.sln"
4) load 'sphinxbase.sln' in Visual Studio 
5) on the right where you see "Solution 'sphinxbase'" make a right click and select properties, then Configuration Properties and then Configuration Manager. Set "Active solution configuration" to "Release". 
6) if you are running a 64bit system choose "Active solution platform" -> new.. and select x64
7) now close the Configuration Manager and right-click the solution for properties again. Click "Build Solution" and hope you don't get any errors :-) That's all for sphinxbase. You can copy the necessary .dll now from \sphinxbase\bin\Release
8) load 'pocketsphinx.sln' in Visual Studio 
9) in the solution explorer right-click on 'pocketsphinx'-> Add -> Existing Item ... and choose the two wrapper files from /JAVA_WRAPPER_FILES folder (pocketsphinx_wrap.c and sphinxbase_wrap.c).
10) repeat steps 5) and 6) for pocketsphinx
11) now we have to include the path to our Java version. Go to 'pocketsphinx'-> properties -> Configuration Properties -> C/C++ and select "Additional Include Directories" and add the folders "JAVA_HOME\include" and "JAVA_HOME\include\win32". For me it looks like this: "C:\Program Files\Java\jdk1.8.0_11\include\win32" and "C:\Program Files\Java\jdk1.8.0_11\include". If you don't have these folders you have to install Java JDK before you continue. Make sure there are "jni.h" and "jni_md.h" files in these folders.
12) now we can finally build pocketsphnix (see step 7). During compilation I got some warnings regarding type conversions (float64->float32 etc. ...). For now I'm ignoring them as they don't seem to influence the result. I'm going to update this when I know more.
13) Go to \pocketsphinx\bin\Release\ to find the pocketsphinx.dll. Copy sphinxbase.dll here to (hopefully) get a fully working Pocketsphinx command line tool. You should try to run one of the .exe files in cmd to see if you get any errors on missing libraries. See \TEST\TEST_POCKETSPHINX.bat in 'ILA'\SpeechData\Pocketsphinx to get an example of how to use the command line tool.
14) When you made sure that the command line tool is running properly copy 'sphinxbase.dll' and 'pocketsphinx.dll' to either 'ILA'\SpeechData\Pocketsphinx\Win32 or 'ILA'\SpeechData\Pocketsphinx\Win64 depending on what you've build and rename 'pocketsphinx.dll' to 'pocketsphinx_jni.dll' - done! :-) ILA should work now with Pocketsphinx in your version of windows :-D
15) last remark: depending on the version of Visual Studio that is installed on your system (if there is any at all) you (might) have to copy the corresponding .dll file (for me it's msvcr120.dll) to ILA's base directory.

my Linux Tutorial
------------------
In Linux it is rather simple to optain the correct libraries ... IF you have all the necessary repositories installed and pathes set ^^.
Here is what you need (I hope I didn't forget anything ^^):

Repositories: 	libtool, swig, python-dev, bison, gcc, automake, pkg-config, java (either openjdk-7-jdk or better oracle java 8), libpulse-dev
Files: 	sphinxbase-master and pocketsphinx-master from GitHub (see link at the bottom)
PATH:	$JAVA_HOME, $LD_LIBRARY_PATH and $PKG_CONFIG_PATH

Before you start please check all the repositories and if necessary set the pathes like this:
export LD_LIBRARY_PATH=/usr/local/lib
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig
export JAVA_HOME=/usr/lib/jvm/java-8-oracle (for example)

Now you can start to install Pocketsphinx:
1) download the latest Pocketsphinx and Sphinxbase masters from GitHub (see link at the bottom)
2) extract Pocketsphinx-Master and Sphinxbase-Master to the same folder so that you get "any_folder\pocketsphinx\autogen.sh" and "any_folder\sphinxbase\autogen.sh" (please remove the "-master" in the folder names)
3) go to the sphinxbase folder and execute the following commands:
./autogen.sh
make
sudo make install
4) go to the pocketsphinx folder and repeat step 3)
5) now you have already installed pocketsphinx and should be able to run it with "pocketsphinx_continuous -inmic yes"
6) if step 5) is a success go to "pocketsphinx/swig/java" and execute "make". This will create the "libpocketsphinx_jni.so" library we need to get it running in Java. Copy this file to "'ILA'/SpeechData/Pocketsphinx/Linux_ARM (or Linux_x86 depending on your machine)".
7) go to $LD_LIBRARY_PATH (presumably /usr/local/lib) and copy 'libsphinxbase.so' to "'ILA'/SpeechData/Pocketsphinx/Linux" aswell.
8) run ILA, go to settings -> ILA speech engine and select pocketsphinx to see if everything works :-)

my MAC tutorial
----------------
working on it. I assume you can use the Linux libraries (?).


Download Pocketsphinx files:
-----------------------------
Here you find the most recent version of pocketsphinx:

https://github.com/cmusphinx