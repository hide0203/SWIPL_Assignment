dist(a, b, 10). dist(a, c, 15). dist(a, d, 20).
dist(b, c, 35). dist(b, d, 25). dist(c, d, 30).
path(X, Y, D) :- dist(X, Y, D) ; dist(Y, X, D).

tsp(Start, Path, MinCost) :-
    findall([P, C], (permutation([a,b,c,d], [Start|Rest]), append([Start|Rest], [Start], P), cost(P, C)), Routes),
    sort(2, @=<, Routes, [[Path, MinCost]|_]).

cost([_], 0).
cost([A, B|T], C) :- path(A, B, D), cost([B|T], C1), C is D + C1.