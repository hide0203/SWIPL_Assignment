edge(a, b). edge(a, c). edge(b, d). edge(c, e).

bfs(Start, Target, Path) :-
    bfs_queue([[Start]], Target, RevPath),
    reverse(RevPath, Path).

bfs_queue([[Target|Path]|_], Target, [Target|Path]).
bfs_queue([[Node|Path]|Rest], Target, FinalPath) :-
    findall([Next, Node|Path], (edge(Node, Next), \+ member(Next, [Node|Path])), NewPaths),
    append(Rest, NewPaths, Queue),
    bfs_queue(Queue, Target, FinalPath).