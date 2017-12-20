% polygon definition (with vertex list)

polygon_vertex(V):-
    length(V, L),
    L == 1,
    !.
    
polygon_vertex(V):-
    length(V, L),
    L > 1,
    X = [X1, X2 | Xs],
    X1 \= X2,
    recursion_limit(N),
    edge_line_seg(X1, X2, N),
    VV = [X2 | Xs],
    polygon_vertex(VV).

polygon_XY(V):-
    length(V, Len),
    Len == 1,
    !.
    
polygon_XY(V):-
    length(V, Len),
    Len > 1,
    V = [V1, V2 | Vs],
    V1 = [X1, Y1],
    V2 = [X2, Y2],
    recursion_limit(N),
    edge_line_seg(X1, Y1, X2, Y2, N),
    VV = [V2 | Vs],
    polygon_XY(VV).

% edge quantity of polygon
total_edges(P, N):-
    polygon(P, Edge_list),
    !,
    length(Edge_list, N).

total_edges(P, N):-
    length(P, N).

