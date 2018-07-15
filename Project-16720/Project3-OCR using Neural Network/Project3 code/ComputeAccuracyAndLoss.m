function [accuracy, loss] = ComputeAccuracyAndLoss(W, b, data, labels)
% [accuracy, loss] = ComputeAccuracyAndLoss(W, b, X, Y) computes the networks
% classification accuracy and cross entropy loss with respect to the data samples
% and ground truth labels provided in 'data' and labels'. The function should return
% the overall accuracy and the average cross-entropy loss.
    [outputs] = Classify(W,b,data);
    loss = -1*sum(sum(labels.*log(outputs)))/size(labels,1);
    differNumber = 0;
    outputOnehot = zeros(size(outputs,1),size(outputs,2));
    for i =1:size(outputs,1)
        for j = 1:size(outputs,2)
            if outputs(i,j) == max(outputs(i,:))
                outputOnehot(i,j) = 1;
            else
                outputOnehot(i,j) = 0;
            end
        end
    end
    for i = 1:size(labels,1)
        [~,index] = max(outputOnehot(i,:));
        if labels(i,index) ~=1
            differNumber = differNumber + 1;
        end 
    end
    accuracy = 1-(differNumber/size(labels,1));
   
    
        

end
