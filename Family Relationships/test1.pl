% Facts
parent(karan, kunal).
parent(karan, sanya).
parent(kunal, aryan).
parent(kunal, jaya).
parent(sanya, kabir).
male(karan). male(kunal). male(aryan). male(kabir).
female(sanya). female(jaya).

% Rules
grandparent(G, C) :- parent(G, P), parent(P, C).
sibling(X, Y) :- parent(P, X), parent(P, Y), X \= Y.
uncle(U, N) :- male(U), sibling(U, P), parent(P, N).
cousin(X, Y) :- parent(P1, X), parent(P2, Y), sibling(P1, P2).