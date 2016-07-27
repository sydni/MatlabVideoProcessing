% testing a personal video 


clear;

dataDir = './data';
resultsDir = 'TestResults';

mkdir(resultsDir);

%% face
% inFile = fullfile(dataDir,'test.mp4');
% fprintf('Processing %s\n', inFile);
% amplify_spatial_Gdown_temporal_ideal(inFile,resultsDir,50,4, ...
%                      50/60,60/60,30, 1);

                 
%                  %% face2
% inFile = fullfile(dataDir,'test.mp4');
% fprintf('Processing %s\n', inFile);
% 
% % Motion
% amplify_spatial_lpyr_temporal_butter(inFile,resultsDir,20,80, ...
%                                      0.5,10,30, 0);
% % Color



inFile = fullfile(dataDir,'hannahCar.m4v');
fprintf('Processing %s\n', inFile);
amplify_spatial_lpyr_temporal_ideal(inFile, resultsDir, 75, 20, 5, 10, 30, 0);
% 
% %% subway
% inFile = fullfile(dataDir,'3Hz,2000px_aliased.avi');
% fprintf('Processing %s\n', inFile);
% amplify_spatial_lpyr_temporal_ideal(inFile,resultsDir,100,6, ...
%                                      2,4,24, 1);
