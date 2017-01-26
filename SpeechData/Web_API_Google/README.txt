ILA interface to Google's web speech API
-------------------------------------------

In the folder "html-interface" you will find the web interface page for ILA.
ILA needs to be able to access it via Chrome browser calling a https://... link.
Currently I'm hosting it on Googledrive for everyone and the corresponding link
is set inside ILA, but that might change in the future. 

If you want to upload the html interface to your own server you can use the file
"html-link-to-web-api.txt" to set your link. Simply copy the link
to the file (make sure there is no empty next line).

note:
due to the fact that I'm using websockets without encryption (because it's not 
yet supported :-( ) there is a general conflict between https:// and ws://
and Chrome will complain about unsafe connections. Unfortunately we have to ignore
these errors for now by forcing the browser to load it anyway.

another note:
due to the first note the connection is inherently unsafe, so if you are afraid
somebody (except Google) is listening to your voice input then stick to the local
recognizers (Sphinx-4, Pocketsphinx, ...)

Chrome/Chromium required:
------------------------

The new Google recognizer for ILA needs a Chrome/Chromium browser running in the
background to access google's web speech API. If you want this to be independant
of your other browser and your desktop in general you can install a portable version
of Chrome for example and point ILA to it by setting the path to the executeable
inside: 	Data/config.properties -> googleBrowser=...

A portable version can be found here: 
http://portableapps.com/de/apps/internet/google_chrome_portable