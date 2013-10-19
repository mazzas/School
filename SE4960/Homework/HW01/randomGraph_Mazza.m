function A = randomGraph_Mazza( n, p )
% Generates a directed random graph for a given number of nodes
%   and an edge probability.
%
% INPUTS: n (double), p (double)
% OUTPUTS: A (adjacency matrix)
%

% Set the following flag to change function behavior.
SELF = 0;                       % Allow or disallow self-edges.
DIRECTED = 1;                   % Edge type.
MLTIEDGE = 0;                   % Not implemented.

% Pre-allocate A.
A = zeros(n);

% Initialize the random number generator.
rng('shuffle');

for i = 1:n
    if DIRECTED             % My kingdom for an inline ternary operator!
        j_loop_start = 1;
    else
        j_loop_start = i;
    end
    
    for j = j_loop_start:n
        if p > rand
            if i == j
                if SELF
                    A(i,j) = 2; % Self-edge representation.
                end
            else
                A(i,j) = 1;     % Add an edge.
                if ~DIRECTED
                    A(j,i) = 1;     % Add the mirror edge.
                end
            end
        end
    end
end