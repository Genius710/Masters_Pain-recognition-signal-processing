# Masters_Pain-recognition-signal-processing
Code from my masters thesis for processing of biomedical signals
Code files from my masters project,
The ones which are more interesting for code evaluation would be tje BlockFormer scripts. 
These scripts take an input of a .mat file consisting of raw signals.
Then filter, separate individual hearbeats and normalize the heartbeats.
Further on correlation analysis is used to quality control the heartbeats and reject cases with high noise values.
The third step was Feature_extraction scripts to extract features from these heartbeats.
These features were later used to evaluate the influence of external stimuli with statistical analysis or to train a neural network.
