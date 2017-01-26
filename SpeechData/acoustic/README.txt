This is the folder for acoustic models used by Sphinx-4. Together with

your microphone this is the most important part for good quality high

precision speech recognition.

Right now the included models support german and english language. The

english model is the most accurate I could find.


If you are planning to switch between different models please consider 

defining a 'samplerate.properties' file in the AM folder to auto-load

the samplerate (see example in the included folders).


If you want to mix Pocketsphinx specific AMs and Sphinx-4 (for let's

say 'hey ILA') please include the string "pocket" in the foldername of

the Pocketsphinx model and set the "defaultAcousticModel" parameter in

settings ('Data/config.properties') so Sphinx-4 can fall back to another

model (Sphinx-4 and Pocketsphinx models are not 100% compatible I think)