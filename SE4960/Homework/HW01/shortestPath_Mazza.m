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

n = numel(A(1,:));
S(1,n) = 0;         % s, vector, set of visited vectors
dist(1,n) = inf;    % stores the shortest distance between the source node and any other node;
prev(1,n) = n+1;    % previous node, informs about the best previous node known to reach each  network node 

dist(start) = 0;

while sum(S)~=n
    test_path=[];
    for i=1:n
        if S(i)==0
            test_path=[test_path dist(i)];
        else
            test_path=[test_path inf];
        end
    end
    [~,u]=min(test_path);
    S(u)=1;
    for i=1:n
        if(dist(u)+A(u,i))<dist(i)
            dist(i)=dist(u)+A(u,i);
            prev(i)=u;
        end
    end
end

path = [dest];

while path(1) ~= start
    if prev(path(1))<=n
        path=[prev(path(1)) path];
    else
        error;
    end
end;
path_length = dist(dest);

end

