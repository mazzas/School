function A = randomGraph_Mazza( n, p )
% Generates a directed random graph for a given number of nodes
%   and an edge probability.
%
% INPUTS: n (double), p (double)
% OUTPUTS: A (adjacency matrix)
%

SELF = 0;                       % Allow or disallow self-edges.
ANALYZE = 0;                    % Generate a histogram?
VISUALIZE = 0;                  % Graph visualization.

% Pre-allocate A.
A = zeros(n);

% Initialize the random number generator.
rng('shuffle');

for i = 1:n
    for j = i:n                 % Only walk the bottom half.
        if p > rand
            if i == j
                if SELF
                    A(i,j) = 2; % Self-edge representation.
                    A(j,i) = 2; % Add the mirror edge.
                end
            else
                A(i,j) = 1;     % Add an edge.
                A(j,i) = 1;     % Add the mirror edge.
            end
        end
    end
end

if ANALYZE
    % TODO
end

if VISUALIZE
    % TODO
end