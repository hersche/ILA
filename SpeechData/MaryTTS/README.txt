here you can put new voices for Mary TTS, folders are as follows:

- conf: Config files (for logging mainly)
- java: put .jar files of new voices and language support here
- lib->voices: put unitselection voice files here
- log: automatically created log for missing pronunciations and Mary TTS server

after you've downloaded new voice files go to [ILA folder]/Data/config.properties
and look for MaryTTS_voice_xy="voice-name" to define it for your language. If you 
are using "other" languages you can also set the language code in the settings
(for french it'd be fr for example, this will also localize the google TTS).

If you are using other languages or experience problems please do the following:

- go to http://mary.dfki.de/download/index.html and download the latest runtime package
- extract the zip file and go to /marytts-5.X.Y/marytts-5.X.Y/lib
- copy all files of that folder to [ILA]/SpeechData/MaryTTS/java
- try again :-)

some voices I recommend:

http://mary.dfki.de/download/5.1/voice-dfki-spike-5.1.zip	-en (~190MB)
http://mary.dfki.de/download/5.1/voice-cmu-slt-5.1.zip		-en (~130MB)
http://mary.dfki.de/download/5.1/voice-bits3-5.1.zip		-de (~450MB)
http://mary.dfki.de/download/5.1/voice-dfki-prudence-5.1.zip	-en (~370MB)