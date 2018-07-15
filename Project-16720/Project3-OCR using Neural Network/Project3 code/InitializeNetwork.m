function [W, b] = InitializeNetwork(layers)
% InitializeNetwork([INPUT, HIDDEN, OUTPUT]) initializes the weights and biases
% for a fully connected neural network with input data size INPUT, output data
% size OUTPUT, and HIDDEN number of hidden units.
% It should return the cell arrays 'W' and 'b' which contain the randomly
% initialized weights and biases for this neural network.
    %init W
    W = cell(1,length(layers)-1);
    for i = 1:length(layers)-1
        W{i}=0.01*rand(layers(i+1),layers(i));
    end
    %init b
    b = cell(1,length(layers)-1);
    for i = 1:length(layers)-1
        b{i} = 0.01*rand(layers(i+1),1);
    end
    
    


end
