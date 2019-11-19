% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный 

/* List add */
append([],R,R).
append([H|T],Z,[H|S]) :- append(T,Z,S).

/* Segmentation list */
partition(_,[],[],[]).
partition(P,[H|T],[H|S],B) :- H=<P,partition(P,T,S,B).
partition(P,[H|T],S,[H|B]) :- H>P,partition(P,T,S,B).

/* Sort recursive */
qsort([],[]).
qsort([H|T],R) :-
	partition(H,T,S,B),
	qsort(S,SS),
	qsort(B,BS),
	append(SS,[H|BS],R).
