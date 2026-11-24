%% EXPERIMENT 5: DISEASE CLASSIFICATION
% Aim:
% To classify diseases using biomedical datasets
% with a Decision Tree classifier. clear;
close all; clc; rng(10);
fprintf('EXPERIMENT 5: DISEASE CLASSIFICATION\n');
%% STEP 1: GENERATE BIOMEDICAL DATASET n = 100;
total = 3*n;
Age = zeros(total,1); Glucose = zeros(total,1); Cholesterol = zeros(total,1); BMI = zeros(total,1);
BloodPressure = zeros(total,1); Disease = cell(total,1);
% Healthy group i1 = 1:n;
Age(i1) = 25 + 10*randn(n,1); Glucose(i1) = 85 + 8*randn(n,1); Cholesterol(i1) = 170 + 18*randn(n,1); BMI(i1) = 22 + 2.5*randn(n,1); BloodPressure(i1) = 112 + 8*randn(n,1); Disease(i1) = {'Healthy'};
% Moderate-risk group i2 = n+1:2*n;
Age(i2) = 45 + 10*randn(n,1); Glucose(i2) = 120 + 12*randn(n,1); Cholesterol(i2) = 205 + 20*randn(n,1); BMI(i2) = 28 + 3*randn(n,1); BloodPressure(i2) = 130 + 10*randn(n,1); Disease(i2) = {'ModerateRisk'};
% High-risk group i3 = 2*n+1:3*n;
Age(i3) = 58 + 9*randn(n,1); Glucose(i3) = 165 + 18*randn(n,1); Cholesterol(i3) = 240 + 22*randn(n,1); BMI(i3) = 34 + 4*randn(n,1);
BloodPressure(i3) = 150 + 12*randn(n,1); Disease(i3) = {'HighRisk'};
% Limit feature values
Age = min(max(Age,18),85);
Glucose = min(max(Glucose,60),250); Cholesterol = min(max(Cholesterol,100),350); BMI = min(max(BMI,15),50);
BloodPressure = min(max(BloodPressure,80),220);
% Create dataset table
T = table(Age,Glucose,Cholesterol,BMI, ... BloodPressure,categorical(Disease), ...

'VariableNames',{'Age','Glucose','Cholesterol', ... 'BMI','BloodPressure','Disease'});
% Add missing values T.Glucose([12 145 278]) = NaN; T.BMI([45 198]) = NaN;
fprintf('Biomedical dataset generated.\n');
%% STEP 2: SAVE AND LOAD DATASET
writetable(T,'biomedical_dataset.csv'); T = readtable('biomedical_dataset.csv');
fprintf('Dataset saved and loaded successfully.\n'); fprintf('Number of samples: %d\n',height(T)); disp('First five rows:');
disp(T(1:5,:));
%% STEP 3: SEPARATE FEATURES AND LABELS
X = [T.Age T.Glucose T.Cholesterol ...
T.BMI T.BloodPressure]; Y = categorical(T.Disease);
featureNames = {'Age','Glucose','Cholesterol', ... 'BMI','BloodPressure'};
%% STEP 4: SPLIT TRAINING AND TESTING DATA
trainIdx = false(height(T),1); testIdx = false(height(T),1); classes = categories(Y);
for i = 1:numel(classes)
idx = find(Y == classes{i});
idx = idx(randperm(numel(idx))); nTrain = floor(0.8*numel(idx)); trainIdx(idx(1:nTrain)) = true; testIdx(idx(nTrain+1:end)) = true;
end
XTrain = X(trainIdx,:); YTrain = Y(trainIdx); XTest = X(testIdx,:); YTest = Y(testIdx);
fprintf('\nTraining samples: %d\n',sum(trainIdx)); fprintf('Testing samples: %d\n',sum(testIdx));
%% STEP 5: HANDLE MISSING VALUES
medians = zeros(1,size(XTrain,2)); for j = 1:size(XTrain,2)
values = XTrain(~isnan(XTrain(:,j)),j); medians(j) = median(values); XTrain(isnan(XTrain(:,j)),j) = medians(j); XTest(isnan(XTest(:,j)),j) = medians(j);
end
fprintf('Missing values handled successfully.\n');
%% STEP 6: TRAIN DECISION TREE CLASSIFIER
treeModel = fitctree(XTrain,YTrain, ... 'PredictorNames',featureNames, ... 'MaxNumSplits',20, ... 'MinLeafSize',5);
fprintf('Decision Tree training completed.\n');
%% STEP 7: PREDICT TEST DATA

YPred = predict(treeModel,XTest); fprintf('Disease prediction completed.\n');
%% STEP 8: CALCULATE CLASSIFICATION ACCURACY
correct = sum(YPred == YTest); totalTest = numel(YTest); accuracy = (correct/totalTest)*100;
fprintf('\n===== CLASSIFICATION RESULTS =====\n');
fprintf('Correct predictions: %d\n',correct); fprintf('Total test samples: %d\n',totalTest); fprintf('Accuracy: %.2f%%\n',accuracy);
%% STEP 9: CONFUSION MATRIX
classNames = categories(Y); numClasses = numel(classNames); C = zeros(numClasses,numClasses); for i = 1:numel(YTest)
actual = find(strcmp(classNames,char(YTest(i)))); predicted = find(strcmp(classNames,char(YPred(i)))); C(actual,predicted) = C(actual,predicted)+1;
end
figure('Name','Confusion Matrix'); imagesc(C);
axis image; colorbar;
xticks(1:numClasses); yticks(1:numClasses); xticklabels(classNames); yticklabels(classNames); xlabel('Predicted Class'); ylabel('Actual Class');
title('Disease Classification Confusion Matrix'); for i = 1:numClasses
for j = 1:numClasses text(j,i,num2str(C(i,j)), ...
'HorizontalAlignment','center');
end end
%% STEP 10: DISPLAY DECISION TREE (GRAPHICAL)
figure('Name','Decision Tree Classification', ... 'NumberTitle','off', ...
'Color','white'); view(treeModel,'Mode','graph'); title('Disease Classification Decision Tree'); drawnow;
%% STEP 11: ALTERNATIVE TREE DISPLAY (TEXT) fprintf('\n===== ALTERNATIVE DECISION TREE =====\n');
disp(treeModel);
%% STEP 12: FEATURE DISTRIBUTIONS
figure('Name','Biomedical Feature Distributions'); subplot(2,2,1);
histogram(T.Age); title('Age Distribution'); xlabel('Age');

ylabel('Count');
subplot(2,2,2); histogram(T.Glucose); title('Glucose Distribution'); xlabel('Glucose'); ylabel('Count');
subplot(2,2,3); histogram(T.Cholesterol); title('Cholesterol Distribution'); xlabel('Cholesterol'); ylabel('Count');
subplot(2,2,4); histogram(T.BMI); title('BMI Distribution'); xlabel('BMI');
ylabel('Count');
%% STEP 13: SAVE RESULTS
save('Exp5_results.mat','treeModel','C', ... 'accuracy','classNames','featureNames','medians');
fprintf('\nDataset saved: biomedical_dataset.csv\n'); fprintf('Results saved: Exp5_results.mat\n'); fprintf('\nExperiment 5 completed successfully.\n');
