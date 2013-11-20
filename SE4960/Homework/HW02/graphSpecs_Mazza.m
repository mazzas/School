function [ D, L, adj_list, d_bar, diam ] = graphSpecs_Mazza( A )
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
adj_list = cell(1,array_size);      % dimensoin the array

for i=1:array_size
    adj_list{i} = find(A(i,:));     % store all edges
end

% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
% DEGREE
% For each element in the adjacency list, get the number of elements in the
%   array.
D = zeros(1,array_size);
for i=1:array_size
    D(i) = numel(adj_list{i});
end

% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
% D-BAR
% Compute the average of the degree array.
d_bar = mean(D);

% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
% diam
% Find the diameter of the graph.
[ dist ] = graphallshortestpaths(sparse(A));
dist(find(dist == inf)) = 0;
diam = max(max(dist));

% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
% LAPLACIAN MATRIX
%
% Create a degree matrix from the degree array.
DM = zeros(array_size);
for i=1:array_size
    DM(i,i) = D(i);
end

% Calculate the Laplacian.
L = DM - A;

end
