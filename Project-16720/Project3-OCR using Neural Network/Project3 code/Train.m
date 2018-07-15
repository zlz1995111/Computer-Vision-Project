function [W, b] = Train(W, b, train_data, train_label, learning_rate)
% [W, b] = Train(W, b, train_data, train_label, learning_rate) trains the network
% for one epoch on the input training data 'train_data' and 'train_label'. This
% function should returned the updated network parameters 'W' and 'b' after
% performing backprop on every data sample.


% This loop template simply prints the loop status in a non-verbose way.
% Feel free to use it or discard it


%  for i = 1:size(train_data,1)
%  
%  
%  
%     if mod(i, 100) == 0
%          fprintf('\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b')
%         fprintf('Done %.2f %%', i/size(train_data,1)*100)
%      end
%  end
%  fprintf('\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b')

    numberofRows = size(train_data,1);
    neworder = randperm(numberofRows);
    data_shuffle = train_data(neworder,:);
    label_shuffle = train_label(neworder,:);
    for i = 1:size(data_shuffle,1)
        [~, act_h, act_a] = Forward(W, b, (data_shuffle(i,:))');
        [grad_W, grad_b] = Backward(W, b, (data_shuffle(i,:))', (label_shuffle(i,:))', act_h, act_a);
        [W, b] = UpdateParameters(W, b, grad_W, grad_b, learning_rate);
    end
%      grad_W_all = grad_W_all +grad_W;
%      grad_b_all = grad_b_all +grad_b;
%      fgrad_W = grad_W_all/size(train_data,1);
%      fgrad_b = grad_b_all/size(train_data,1);
%      [W, b] = UpdateParameters(W, b, fgrad_W, fgrad_b, learning_rate);
end
