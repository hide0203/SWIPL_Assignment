solve_queens(Q) :-
    Q = [1, 2, 3, 4, 5, 6, 7, 8],
    permutation(Q, S),
    safe(S),
    write(S).

safe([]).
safe([Q|Others]) :- safe(Others), \+ attacks(Q, Others, 1).

attacks(Q, [Q1|_], N) :- Q is Q1 + N ; Q is Q1 - N.
attacks(Q, [_|Others], N) :- N1 is N + 1, attacks(Q, Others, N1).