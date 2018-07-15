function [grad_W, grad_b] = Backward(W, b, X, Y, act_h, act_a)
% [grad_W, grad_b] = Backward(W, b, X, Y, act_h, act_a) computes the gradient
% updates to the deep network parameters and returns them in cell arrays
% 'grad_W' and 'grad_b'. This function takes as input:
%   - 'W' and 'b' the network parameters
%   - 'X' and 'Y' the single input data sample and ground truth output vector,
%     of sizes Nx1 and Cx1 respectively
%   - 'act_h' and 'act_a' the network layer pre and post activations when forward
%     forward propogating the input smaple 'X'
    grad_W = cell(1,length(act_a));
    grad_b = cell(1,length(act_a));
    grad_W{end} = (act_h{end}-Y)*(act_h{end-1})';
    reuse = act_h{end}-Y;
    grad_b{end} = reuse;
    for i = 1:length(act_a)-2
        grad_W{end-i} = (W{end-i+1})'*reuse.*act_h{end-i}.*(1-act_h{end-1})*(act_h{end-2})';
        reuse = (W{end-i+1})'*reuse.*act_h{end-i}.*(1-act_h{end-1});
        grad_b{end-i} = reuse;
    end
    grad_W{1}=(W{2})'*reuse.*act_h{1}.*(1-act_h{1})*X';
    grad_b{1} = (W{2})'*reuse.*act_h{1}.*(1-act_h{1});
end
