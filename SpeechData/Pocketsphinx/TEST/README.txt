This is Pocketsphinx pre-compiled for Windows 8 32bit but without the .dll files.
If you want to use Pocketsphinx in ILA you need to have the correct OS dependant
libraries. To test the 32bit libraries you can copy all .dll files from the corresponding
folder (..\Win32) to this folder, rename pocketsphinx_jni.dll to pocketsphinx.dll
and run the TEST_POCKETSPHINX.bat. Check the output for errors to locate problems.

If you are using 64bit you need to compile Pocketsphinx first. Here you find more
information on how to create the necessary files:

http://cmusphinx.sourceforge.net/wiki/tutorialpocketsphinx

I used Visual Studio 2013 (its free ^^) to compile the libraries. This leads to basically
3 dependancies: pocketsphinx.dll, sphinxbase.dll and msvcr120.dll (because its VS2013).
To make Pocketsphinx compatible with Java you also need to include the wrapper files
when making your build (import the c-code from JAVA_WRAPPER_FILES folder to pocketsphinx
Visual Studio project).

Here you find the most recent version of pocketsphinx:

https://github.com/cmusphinx