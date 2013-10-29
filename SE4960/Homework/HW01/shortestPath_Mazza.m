function [ path, path_length ] = shortestPath_Mazza( A, start, dest )
% Find and return the shortest path for a directed graph
%
%   INPUTS: A (adjacency matrix), start (node in A), dest (node in A)
%   RETURNS: path (vector of nodes in A), path_length (double)
%
% Lemma: subpaths of the shortest path are shortest paths.
%

% NOTE: We are using a 2xn matrix where the first row stores the node
%     value and the corresponding cell in the second row stores the
%     value of the previous node in the graph.
working_list = [ start; 0 ];    % Possible nodes in our solution.
node_index = 1;                 % Points to the current node.
done = 0;                       % Loop invariant.

while ~done
    % Get the current node.
    cur_node = working_list(1,node_index);
    % Add all unvisited adjacent nodes.
    adjacent_nodes = find(A(cur_node,:));
    % Avoid the Griswald Effect: Hey, look kids, Big Ben, Parliment.
    for i = 1:numel(working_list(1,:))       
        adjacent_nodes(find(adjacent_nodes == working_list(1,i),1)) = [];
    end
    % REM % If there are no unvisited adjacent nodes, we discard cur_node.
    % REM % NOTE: I think this whole conditional level is unnecessary.
    % REM if numel(adjacent_nodes) == 0
	% REM % Delete the column with cur_node.
        % REM % NOTE: I think this is unnecessary.
        % REM working_list(:,node_index);
        % REM % Re-dimension the node pointer.
        % REM node_index = node_index - 1;
    % REM else
        % See if we have found dest.
        if find(adjacent_nodes == dest)
	    % REM % Remove all columns after node_index.
	    % REM % NOTE: I think this is unnecessary.
            % REM working_list = working_list(:,1:node_index);
	    % Append final column.
            working_list = [ working_list [ dest; cur_node ] ];
            % Exit the loop.
            done = 1;
        else
	    % Otherwise append new columns (this is the next hop).
	    % Re-dimension adjacent_nodes.
	    prev_nodes = zeros(1,numel(adjacent_nodes));
	    % Set the previous node pointer.
	    prev_nodes(prev_nodes == 0) = cur_node;
	    % Append the vectors to make 2xn matrix.
	    adjacent_nodes(2,:) = prev_nodes;
	    % Add adjacent nodes to the working list.
            working_list = [ working_list adjacent_nodes ];
        end
    % REM end
    % Clean up.
    clear adjacent_nodes prev_nodes;
    % Increment the node pointer.
    node_index = node_index + 1;
end

% Build result from working_list.
done = 0;
path = [ dest ];

while ~done
    % Look up the previous node and store it.
    path = [ (2,find(working_list(1,:) == path(1))) path ];

    % See if we are done.
    if path(1) == start
        done = 1;
        clear working_list;
    end
end

% Set path_length from path array.
path_length = numel(path);

end

