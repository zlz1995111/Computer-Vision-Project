% evaluateRecognitionSystem.m
% This script evaluates nearest neighbour recognition system on test images
% load traintest.mat and classify each of the test_imagenames files.
% Report both accuracy and confusion matrix
data = load('../data/traintest.mat');
test_imagenames = getfield(data,'test_imagenames');
test_labels = getfield(data,'test_labels');
CeuRandom = zeros(8,8);
CchRandom = zeros(8,8);
CeuHarris = zeros(8,8);
CchHarris = zeros(8,8);
mapping = getfield(data,'mapping');
T = size(test_imagenames,2);
imgPaths = string([T,1]);
predictLabels_harris_eu = zeros(T,1);
predictLabels_harris_ch = zeros(T,1);
predictLabels_random_eu = zeros(T,1);
predictLabels_random_ch = zeros(T,1);
K = size(dictionaryHarris,1);
train_data_random = load('visionRandom.mat');
train_features_random = getfield(train_data_random,'trainFeatures');
train_labels_random = getfield(train_data_random,'trainLabels');
train_data_harris = load('visionHarris.mat');
train_features_harris = getfield(train_data_harris,'trainFeatures');
train_labels_harris = getfield(train_data_harris,'trainLabels');
for i = 1:T
    I = imread(join(['../data/',test_imagenames{1,i}]));
    [wordMapHarris] = getVisualWords(I, dictionaryHarris, filterBank);
    [wordMapRandom] = getVisualWords(I, dictionaryRandom, filterBank);
    [hHarris] = getImageFeatures(wordMapHarris, K);
    [hRandom] = getImageFeatures(wordMapRandom, K);
    harris_distance_eu = pdist2(hHarris',train_features_harris);
    random_distance_eu = pdist2(hRandom',train_features_random);
    harris_distance_ch = pdist2(hHarris',train_features_harris,'chisq');
    random_distance_ch = pdist2(hRandom',train_features_random,'chisq');
    [~,N1] = min(harris_distance_eu(:));
    [~,N2] = min(random_distance_eu(:));
    [~,N3] = min(harris_distance_ch(:));
    [~,N4] = min(random_distance_ch(:));
    N1prelabel = train_labels_harris(1,N1);
    N2prelabel = train_labels_random(1,N2);
    N3prelabel = train_labels_harris(1,N3);
    N4prelabel = train_labels_random(1,N4);
    N1prerow = N1prelabel;
    N1realcol = test_labels(1,i);
    CeuHarris(N1prerow,N1realcol) = CeuHarris(N1prerow,N1realcol)+1;
    N2prerow = N2prelabel;
    N2realcol = test_labels(1,i);
    CeuRandom(N2prerow,N2realcol) = CeuRandom(N2prerow,N2realcol)+1;
    N3prerow = N3prelabel;
    N3realcol = test_labels(1,i);
    CchHarris(N3prerow,N3realcol) = CchHarris(N3prerow,N3realcol)+1;
    N4prerow = N4prelabel;
    N4realcol = test_labels(1,i);
    CchRandom(N4prerow,N4realcol) = CchRandom(N4prerow,N4realcol)+1;
end
    
    
