echo starting cmusphinx en-us model adaption step 1
pause
sphinx_fe -argfile en-us/feat.params -samprate 16000 -c ILA_voice_train.listoffiles -di . -do . -ei wav -eo mfc -mswav yes
echo done - starting model adaption step 2
pause
bw -hmmdir en-us -moddeffn en-us/mdef -ts2cbfn .ptm. -feat 1s_c_d_dd -svspec 0-12/13-25/26-38 -agc none -cmn current -dictfn en-us/dict/dictionary.dic -ctlfn ILA_voice_train.listoffiles -lsnfn ILA_voice_train.transcription -accumdir .
echo done - starting model adaption step 3
pause
mllr_solve -meanfn en-us/means -varfn en-us/variances -outmllrfn mllr_matrix -accumdir .
echo done - starting model adaption step 4
pause
map_adapt -meanfn en-us/means -varfn en-us/variances -mixwfn en-us/mixture_weights -tmatfn en-us/transition_matrices -accumdir . -mapmeanfn en-us-adapt/means -mapvarfn en-us-adapt/variances -mapmixwfn en-us-adapt/mixture_weights -maptmatfn en-us-adapt/transition_matrices
echo adaption complete
pause