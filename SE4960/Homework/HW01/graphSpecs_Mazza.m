function [ D, L, adj_list, d_bar ] = graphSpecs_Mazza( A )
% Calculate and return summary graph statistics.
%   Determines degree, average degree, and diameter, and builds an
%   adjacency list and Laplacian matrix for A.
%
%   INPUTS: A (adjacency matrix)
%   OUTPUTS: D (vector), L (matrix), adj_list (cell array), 
%       d_bar (double)
%

% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
% ADJACENCY LIST
% We will compute this first since it facilitates some other answers.
% For each row of the adjacency matrix, build an adjacency list.
array_size = numel(A(1,:));
adj_list = cell(array_size);        % dimensoin the array
for i=1:numel(array_size)
    %TODO: fix this.
    adj_list(i,1) = A(i,1);         % store the node value
    adj_list(i,2) = find(A(i,:));   % store all edges
end

% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
% DEGREE
% For each element in the adjacency list, get the number of elements in the
%   array.
D = zeros(1,numel(adj_list));
for i=1:numel(adj_list)
    D(i) = numel(adj_list{i});
end

% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
% D-BAR
% Compute the average of the degree array.
d_bar = mean(D);

% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
% LAPLACIAN MATRIX
%


end

