%  SCRIPT:  graphSpecsTester.m
%
%  DESC:    This script loads/creates an adjacency matrix to test
%           student-created function which computes various graph 
%           properties.
%
%  CREATED: T.H.Chung, 2012
%
clc; close all; clear


%--------------------------
% Load or create an adjacency matrix you wish to be analyzed
%  - can create a customize adjacency matrix
%  - can load from existing dataset

%----
% Create custom adjacency matrix
%  Options: (1) Use 'bucky' command to generate Bucky Ball adjacency matrix
%           (2) Create own randomized adjacency matrix
% A = bucky;
A = randomGraph_Mazza(20,0.3);

%----
% Load from dataset
% (1) From Stanford Large Network Dataset Collection
%       - Ref: http://snap.stanford.edu/data/
% % TODO (Uses 'fromNode,toNode' format)

% (2) From UF Sparse Matrix Collection
%       - Ref: http://www.cise.ufl.edu/research/sparse/matrices/
% % dataset = 'EPA.mat';                % name of the dataset
% % load( dataset, 'Problem');
% % A_sparse = getfield( Problem, 'A' );% adjacency stored as sparse matrix
% % A = full(A_sparse);                 % convert to full square matrix



%--------------------------
% Run function to characterize graph
%   Syntax:     [D, L, adj_list, d_bar, diam] = graphSpecs_XXX( A )
%
%   Inputs:     A - square adjacency matrix
%
%   Outputs:    D - degree vector
%               L - graph Laplacian
%               adj_list - adjacency list representation of A
%               d_bar - average node degree
%               diam - diameter of the graph

[D, L, adj_list, d_bar] = graphSpecs_Mazza( A );



%--------------------------
% Visualize the graph

%----
% Create randomized planar coordinates to assist with visualization
num_nodes = length(A);
xy_coords = num_nodes * rand( num_nodes, 2 );       % generate random x,y

%----
% Use 'gplot' to graphically display the graph
figure
set(gcf, 'Color', 'white')
[X,Y] = gplot( A, xy_coords );          % return points rather than plot
h_graph = plot( X, Y, 'bo', 'MarkerSize', 10, 'MarkerEdgeColor', 'b',...
    'MarkerFaceColor', 'b', 'Color', 'r', 'LineStyle', '-');
axis equal






