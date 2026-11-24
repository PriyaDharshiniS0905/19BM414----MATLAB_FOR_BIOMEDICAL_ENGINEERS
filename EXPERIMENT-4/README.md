## EXPERIMENT 4: DICOM IMAGE ANALYSIS
## AIM:
To read, visualize and quantitatively analyse a DICOM medical image using MATLAB.
## INPUT:
A de-identified DICOM file such as sample_ct.dcm. Patient identifiers must not be copied into the report.
## INPUT FILE / PARAMTERS:

## THEORY / PRINCIPLE:
DICOM stores image pixels together with acquisition and technical metadata. dicominfo reads the header and dicomread reads the image. For CT, rescale slope and intercept may
be used to obtain physical CT values.
## PROCESSING FLOWCHART:
<img width="653" height="188" alt="image" src="https://github.com/user-attachments/assets/5b2fde11-b6f5-45a5-b72c-bcd78b895fc5" />

## PROCEDURE:
1. Read DICOM metadata.
2. Display selected technical metadata.
3. Read the pixel array.
4. Display original and normalized images.
5. If applicable, convert CT values using rescale slope/intercept.
6. Apply an illustrative window.
7. Draw an ROI and calculate mean, standard deviation, minimum and maximum.
## OBSERVATIONS:

## OUTPUT:

## RESULT:
The experiment was performed successfully using MATLAB. The input was processed according to the stated method and the expected biomedical output was obtained.
