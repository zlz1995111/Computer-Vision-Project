% buildRecognitionSystem.m
% This script loads the visual word dictionary (in dictionaryRandom.mat or dictionaryHarris.mat) and processes
% the training images so as to build the recognition system. The result is
% stored in visionRandom.mat and visionHarris.mat.
[filterBank] = createFilterBank();
Random = load('dictionaryRandom.mat');
Harris = load('dictionaryHarris.mat');
dictionaryHarris = getfield(Harris,'dictionary');
dictionaryRandom = getfield(Random,'dictionary');
data = load('../data/traintest.mat');
imageNames = getfield(data,'train_imagenames');
labels = getfield(data,'train_labels');
T = size(imageNames,2);
% imgPaths = strings([1,T]);
% for i = 1:T
%     imgPaths(1,i) = join(['../data/',imageNames{1,i}]);
% end
K = size(dictionaryHarris,1);
HarrisTrainFeatures = zeros(T,K);
RandomTrainFeatures = zeros(T,K);
for i = 1:T
    I = imread(join(['../data/',imageNames{1,i}]));
    [wordMapHarris] = getVisualWords(I, dictionaryHarris, filterBank);
    [wordMapRandom] = getVisualWords(I, dictionaryRandom, filterBank);
    [hHarris] = getImageFeatures(wordMapHarris, K);
    [hRandom] = getImageFeatures(wordMapRandom, K);
    HarrisTrainFeatures(i,:) = hHarris;
    RandomTrainFeatures(i,:) = hRandom;
end
s1.dictionary = dictionaryRandom;
s1.filterBank = filterBank;
s1.trainFeatures = RandomTrainFeatures;
s1.trainLabels = labels;
save('visionRandom.mat','-struct','s1')
s2.dictionary = dictionaryHarris;
s2.filterBank = filterBank;
s2.trainFeatures = HarrisTrainFeatures;
s2.trainLabels = labels;
save('visionHarris.mat','-struct','s2')
    
    


