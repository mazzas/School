function [ path, path_length ] = shortestPath_Mazza( A, start, dest )
% Find and return the shortest path for a directed graph
%   Implements Dijkstra's slgorithm to find and return the shortest path of
%   A from start to dest.
%
%   INPUTS: A (adjacency matrix), start (node in A), dest (node in A)
%   RETURNS: path (vector of nodes in A), path_length (double)
%
% Lemma: subpaths of the shortest path are shortest paths.
%

% Create a couple of lists     
path = [ start ];               % Possible nodes in our solution.
unsuccessful = [];              % List of nodes to remove.
node_index = 1;                 % Points to the current node.
done = 0;                       % Loop invariant.

while ~done
    % Get the current node.
    cur_node = path(node_index);
    % Add all adjacent nodes.
    adjacent_nodes = find(A(cur_node,:));
    % ...except for ones we've already visited...
    for i = 1:numel(path)       
        adjacent_nodes(find(adjacent_nodes == path(i),1)) = [];
    end
    % If there are no unvisited adjacent nodes, we discard cur_node.
    if numel(adjacent_nodes) == 0
        path = path(path ~= cur_node);
        % Re-dimension the node pointer.
        node_index = node_index - 1;
    else
        % See if we have found dest.
        if find(adjacent_nodes == dest)
            % Remove all remaining nodes.
            path = path(1:node_index);
            % Remove cur_node from unsuccessful nodes.
            unsuccessful = unsuccessful(unsuccessful ~= cur_node);
            % Remove remaining unsuccessful nodes.
            for i = 1:numel(unsuccessful)       
                path(find(path == unsuccessful(i),1)) = [];
            end
            % Append cur_node and dest.
            path = [ path dest ];
            % Exit the loop.
            done = 1;
        else
            % Otherwise we append to our candidate list.
            path = [ path adjacent_nodes ];
            % NOTE: This is wrong. We need to figure out what hop we are
            % on.
            unsuccessful = [ unsuccessful adjacent_nodes];
        end
    end
    % Increment the node pointer.
    node_index = node_index + 1;
end

% Set path_length from path array.
path_length = numel(path);

end

