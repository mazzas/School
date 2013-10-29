%  SCRIPT:  graphSpecsTester.m
%
%  DESC:    This script loads/creates an adjacency matrix to test
%           student-created function which computes various graph 
%           properties.
%
%  CREATED: T.H.Chung, 2012
%  MODIFIED: Steve Mazza, 2013
%
clc; close all; clear

% Set the following flag to change function behavior.
HIST = 0;               % Display a histogram of the degree distribution.
DISP = 1;               % Show a graphical representation of the graph.
LEGACY_DISP = 0;        % Legacy display code.

%--------------------------
% Load or create an adjacency matrix you wish to be analyzed
%  - can create a customize adjacency matrix
%  - can load from existing dataset
%  - can call custom function to create a matrix

%----
% Create custom adjacency matrix
%  Options: (1) Use 'bucky' command to generate Bucky Ball adjacency matrix
%           (2) Create own randomized adjacency matrix
% A = bucky;

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

%----
% Call custom function
% 
% NOTE: If you want to create a matrix of larger than 50 nodes, turn off
% the graph visualization.
num_nodes = 15;         % number of nodes (machine-sized integer)
edge_prob = 0.2;        % edge probability (double from 0 to 1)
A = randomGraph_Mazza(num_nodes,edge_prob);


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
[D, L, adj_list, d_bar, diam] = graphSpecs_Mazza( A );



%--------------------------
% Show the degree distribution
if HIST
    hist(D);
    title(strcat(strcat(strcat('Nodes: ',num2str(num_nodes)),...
        ', Edge Probability: '),num2str(edge_prob)));
    xlabel('Node Degree');
    ylabel('Count');
end


%--------------------------
% Visualize the graph
if DISP
    % The Pajek tools seem only to be available for PC.  So I hope you will
    % accept the following graphical representation within MATLAB as a
    % suitable alternative.
    view(biograph(sparse(A)));
end


%--------------------------
% Visualize the graph (previous code)
if LEGACY_DISP
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
end






