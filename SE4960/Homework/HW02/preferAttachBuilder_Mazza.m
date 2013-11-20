function [ A_new, label_list ] = ...
    preferAttachBuilder_Mazza( A_orig, N_add, a, c )
% Generate a network model according to the Price model.
%
%   INPUTS: A_orig: adjacency matrix
%           N_add: integer number of additional nodes to add
%           a: offset parameter
%           c: mean node degree
%   OUTPUTS: A_new: augmented graph
%            label_list: vector containing labels of the nodes
%

% Seed the random number generator.
rng('shuffle');

% Set the remaining return value.
A_new = A_orig;

% Construct an initial label list.
for i = 1:numel(A_orig(1,:));
    label_list = cat(2,label_list,find(A_orig(i,:)));
end

for i = 1:numel(N_add)
    if rand() < c/(c+a)
        % Select random element from label_list.
        target = randi(numel(label_list));
    else
        % Select any random vertex.
        target = randi(numel(A_orig(1,:)));
    end
    % Add the edge in A_new.
    A_new(N_add(i), target) = 1;
    
    % Add the edge to label_list
    label_list = [label_list target];
end

end

