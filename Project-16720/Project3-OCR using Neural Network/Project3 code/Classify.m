function [outputs] = Classify(W, b, data)
% [predictions] = Classify(W, b, data) should accept the network parameters 'W'
% and 'b' as well as an DxN matrix of data sample, where D is the number of
% data samples, and N is the dimensionality of the input data. This function
% should return a vector of size DxC of network softmax output probabilities.
    outputs = [];
    for i = 1:size(data,1)
        [out,~,~]= Forward(W,b,data(i,:)');
        outputs = [outputs;out'];
    end


end
