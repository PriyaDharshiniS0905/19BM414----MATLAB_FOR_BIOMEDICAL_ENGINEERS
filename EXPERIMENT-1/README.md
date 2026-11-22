## EXPERIMENT 1: ECG NOISE REMOVAL AND QRS DETECTION
## AIM:
To remove noise from an ECG signal and detect QRS complexes using MATLAB.
## INPUT FILE / PARAMETERS:
File name/model : ecg_sample.mat
## THEORY / PRINCIPLE:
ECG contains characteristic P, QRS and T waves and may be contaminated by baseline wander, power-line interference and high-frequency noise. A band-pass filter is used to emphasize QRS energy.Differentiation, squaring and moving-window integration further enhance the QRS complexes before 
peak detection.
## PROCESSING FLOWCHART:
<img width="694" height="198" alt="image" src="https://github.com/user-attachments/assets/acb41f8f-5787-4d84-9494-275154628861" />

## PROCEDURE:
1. Load the ECG and inspect its duration and amplitude.
2. Remove the DC component.
3. Design and apply a 5–15 Hz Butterworth band-pass filter.
4. Differentiate and square the filtered ECG.
5. Apply a 150 ms moving-window integration.
6. Detect QRS candidates using minimum height and minimum distance.
7. Calculate RR intervals and estimated heart rate.

## OBSERVATIONS:
1. Sampling frequency = 360Hz.
2. Signal Duration =10.00 seconds.
3. Detected QRS Complexes = 12.
4. Estimated heart rate/ mean RR interval= 75.19 bpm.

## OUTPUT:
## FIGURE 1: Raw ECG Signal
<img width="1672" height="785" alt="691828084-7b9d5038-bac6-4297-aba9-761d1fcd4445" src="https://github.com/user-attachments/assets/8950c5b7-dfe4-4589-b968-84a65749e564" />

## FIGURE 2: ECG after Baseline Correction and Smoothing
<img width="1640" height="785" alt="691828665-3fe2f2fa-1409-4528-88ae-c2338fb0d78f" src="https://github.com/user-attachments/assets/ee5ee638-bfd3-48e0-b06c-2cb652f0fbe9" />

## FIGURE 3: Moving-Window Integrated ECG
<img width="1598" height="792" alt="691830285-2f8a32c5-4e46-4624-b229-0b02d6f6d670" src="https://github.com/user-attachments/assets/20f8f67f-487f-4b53-93b6-42a0d670a338" />

## FIGURE 4: Filtered ECG with Detected QRS Candidates
<img width="1582" height="788" alt="691830648-90dda0ac-10d7-43e2-b1ec-ba1905dc26f5" src="https://github.com/user-attachments/assets/5314e3e4-d9c2-4190-a063-9256486d8547" />

## RESULT:
The experiment was performed successfully using MATLAB. The input was processed according to the 
stated method and the expected biomedical output was obtained.
