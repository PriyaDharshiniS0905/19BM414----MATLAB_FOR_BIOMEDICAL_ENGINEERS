## EXPERIMENT 2: ECG FREQUENCY BAND ANALYSIS
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
1. Input file = eeg_sample.mat
2. Sampling frequency = 256.00 Hz.
3. Signal duration = 30.00 seconds.
4. Number of samples = 7680.
5. PSD segments averaged = 14.
## OUTPUT:
## FIGURE 1 - Raw EEG Signal
<img width="1651" height="780" alt="691916899-24438968-1c5c-4289-8f1b-0f4655f3a476" src="https://github.com/user-attachments/assets/5d666ec2-de99-4c6e-8725-ecbaad4cf91c" />

## FIGURE 2 - EEG after Trend Removal
<img width="1607" height="785" alt="691917351-c9b73582-3bd8-4aef-b854-20175126ed1a" src="https://github.com/user-attachments/assets/03e5d69e-fb32-45b0-a4ec-69cd20645231" />

## FIGURE 3 - EEG Power Spectral Density
<img width="1598" height="752" alt="691917862-92cbeda9-e269-430c-81e3-4569059a35fa" src="https://github.com/user-attachments/assets/bc6a2b7c-2c20-4628-b815-090669d2d9c8" />

## RESULT:
The experiment was performed successfully using MATLAB. The input was processed according to the 
stated method and the expected biomedical output was obtained.
