function [out, act_h, act_a] = Forward(W, b, X)
% [OUT, act_h, act_a] = Forward(W, b, X) performs forward propogation on the
% input data 'X' uisng the network defined by weights and biases 'W' and 'b'
% (as generated by InitializeNetwork(..)).
%
% This function should return the final softmax output layer activations in OUT,
% as well as the hidden layer post activations in 'act_h', and the hidden layer
% pre activations in 'act_a'.
    act_a = cell(1,length(W));
    act_h = cell(1,length(W));
    act_a{1} = W{1}*X+b{1};
    act_h{1} = 1./(1+exp(-1*act_a{1}));
    for i = 2:length(W)-1
        act_a{i}=W{i}*act_h{i-1}+b{i};
        act_h{i}=1./(1+exp(-1*act_a{i}));
    end
    act_a{length(W)}=W{length(W)}*act_h{length(W)-1}+b{length(W)};
    act_h{length(W)}=exp(act_a{length(W)})./sum(exp(act_a{length(W)}));
    out = act_h{length(W)};

end
