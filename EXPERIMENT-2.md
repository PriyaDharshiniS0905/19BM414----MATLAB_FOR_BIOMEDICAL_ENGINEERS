## ECG FREQUENCY BAND ANALYSIS
## AIM:
To analyse EEG frequency content and calculate the power in standard EEG bands.
## INPUT FILE / PARAMETERS:
File name/model: eeg_sample.mat
## THEORY / PRINCIPLE:
EEG can be analysed in the frequency domain using power spectral density. The spectrum is divided 
into delta, theta, alpha, beta and gamma teaching bands, and numerical integration of PSD estimates the 
power in each band.
## PROCESSING FLOWCHART:
<img width="674" height="198" alt="image" src="https://github.com/user-attachments/assets/883a945f-fa8a-44c2-90ff-24b001ff26a0" />

## PROCEDURE:
1. Load the EEG channel.
2. Remove trend from the signal.
3. Estimate PSD using Welch's method.
4. Define the five frequency bands.
5. Integrate PSD inside each band.
6. Plot absolute and relative band power.
7. Identify the dominant band.
## OBSERVATIONS:
