% edge(Node1, Node2, Cost)
edge(a, b, 2). edge(a, c, 5). edge(b, d, 3). edge(c, d, 1).
% heuristic(Node, Value)
h(a, 5). h(b, 2). h(c, 1). h(d, 0).

astar(Start, Goal, Path) :-
    astar_q([[5, 0, Start]], Goal, RevPath),
    reverse(RevPath, Path).

astar_q([[_, _, Goal|Path]|_], Goal, [Goal|Path]).
astar_q([[_, G, Node|Path]|Rest], Goal, Final) :-
    findall([F, NewG, Next, Node|Path], (
        edge(Node, Next, Cost), \+ member(Next, Path),
        NewG is G + Cost, h(Next, H), F is NewG + H
    ), Children),
    append(Rest, Children, NewQueue),
    sort(NewQueue, Sorted),
    astar_q(Sorted, Goal, Final).