:- dynamic visited/1.

edge(a, b). edge(a, c). edge(b, d). edge(b, e). edge(c, f).

dfs(Node) :-
    write(Node), write(' '),
    assert(visited(Node)),
    edge(Node, Next),
    \+ visited(Next),
    dfs(Next).
dfs(_).

run_dfs(Start) :- 
    retractall(visited(_)), 
    dfs(Start).