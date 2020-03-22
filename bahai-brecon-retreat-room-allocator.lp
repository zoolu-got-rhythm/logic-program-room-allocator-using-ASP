% min_per_room=2.
% max_per_room=3.
person(nahal, female, private).
person(tara, female, shared).
person(adib, male, shared).
person(john, male, shared).
person(rachael, female, shared).
person(kristin, female, shared).
person(chris, male, shared).

room(a;b;c).

n_of_people(N) :- N = #count{ X,Y,Z : person(X,Y,Z)}.

% generate all possible candidates: how do i replace number 100 with n of people?
% for now just put abritrarily high number (100)
1 { allocate(N,R) : person(N,_,_) } 100 :- room(R).

n_of_allocated(N) :- N = #count{ X,Y : allocate(X,Y)}.

% 1 person can't be in 2 rooms at once
:- allocate(N,R1), allocate(N,R2), R1!=R2, person(N,_,_).

% 2 different genders can't share same room integrity constraint
:- allocate(N1,R), allocate(N2,R), room(R), person(N1,G1,_), person(N2,G2,_), G1!=G2.

% people with shared pref can't share room with people with private pref
:- allocate(N1,R), allocate(N2,R), room(R), person(N1,_,P1), person(N2,_,P2), P1!=P2.

% this integrity constraint below sais that people with shared pref must be between -
% 2(minimum) and 4(max) people per room
:- 2 #count { N,R,P : allocate(N,R), room(R), person(N,_,P), P==shared} 4.

% everyone must be allocated a room
:- n_of_allocated(X), n_of_people(Y), X!=Y.


#show allocate/2.
#show n_of_people/1.
#show n_of_allocated/1.
