%----
% Load from dataset
% (2) From UF Sparse Matrix Collection
%       - Ref: http://www.cise.ufl.edu/research/sparse/matrices/
% dataset = 'netscience.mat';                 % name of the dataset
% dataset = 'EPA.mat';                        % name of the dataset
dataset = 'California.mat';                 % name of the dataset
load( dataset, 'Problem');
A_sparse = getfield( Problem, 'A' );        % adjacency stored as sparse matrix
A = full(A_sparse);                         % convert to full square matrix

