ILA acoustic model training
----------------------------

Welcome to ILA's acoustic model training folder! Since beta version 3.1 ILA has

an interface to help you record training data necessary to improve the quality

of the acoustic models used by sphinx-4. You can start it by typing "amt" 

(acoustic model training) in ILA's command line (the text input area inside ILA).

ILA will then start to plot the test-sentences from this folder 

(ILA_voice_train.txt) one-by-one and you can record them (mic-button), test them

(play-button) and if everything sounds good save them (save-button) or skip to 

the next sentence (skip-button). Feel free to add more sentences to the list just

make sure the dictionary (included in the model) knows all the words you are using.

If you are finished with recording please come back to this folder and follow the

instructions from the sphinx-4 homepage to adapt the model: 

http://cmusphinx.sourceforge.net/wiki/tutorialadapt

If you are using windows there are some batch-files that can help you adapt the

generic model included in ILA. A step-by-step procedure would look like this:


1) record the sound files (ILA->"amt"->record->test->save->record ...)

2) copy the acoustic model to this folder (e.g. from SpeechData/acoustic/en-us)

3) copy a second version of the model to this folder and call it e.g. "en-us-adapt"

4) run the "adapt_en-us-model_windows.bat" batch file and follow the instructions

5) make sure that there are no errors occuring during adaption

6) copy the model (e.g. en-us-adapt) back to the original folder 

7) set the adapted folder inside ILA as model (settings->acoustic model ...)

8) try out the new model and (hopefully) have fun :-)