% Facts
teaches(dr_sharma, machine_learning).
teaches(prof_verma, networks).
enrolled(kunal, machine_learning).
enrolled(arjun, machine_learning).
enrolled(arjun, networks).

% Rules
teacher_of_student(S, T) :- enrolled(S, C), teaches(T, C).
classmates(S1, S2) :- enrolled(S1, C), enrolled(S2, C), S1 \= S2.
handled_by(T, C) :- teaches(T, C).