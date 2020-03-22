
person(nahal, female, private).
person(tara, female, shared).
person(adib, male, shared).
person(john, male, shared).
person(rachael, female, shared).
person(kristin, female, shared).

room(a;b;c).

1 { allocate(N,R) : person(N,_,_) } 3 :- room(R).

% 1 person can't be in 2 rooms at once
:- allocate(N,R1), allocate(N,R2), R1!=R2, person(N,_,_).

n_of_people(N) :- N = #count{ X,Y,Z : person(X,Y,Z)}.
n_of_allocated(N) :- N = #count{ X,Y : allocate(X,Y)}.


% :- allocate(N1,R;N2,R), person(N1,G1;N2,G2), room(R), G1!=G2.

%:- allocate(nahal,a), allocate(adib,a).
%:- allocate(nahal,a), allocate(john,a).
%:- allocate(nahal,b), allocate(adib,b).
%:- allocate(nahal,b), allocate(john,b).

% 2 different genders can't share same room integrity constraint
:- allocate(N1,R), allocate(N2,R), room(R), person(N1,G1,_), person(N2,G2,_), G1!=G2.

% people with shared pref can't share room with people with private pref
:- allocate(N1,R), allocate(N2,R), room(R), person(N1,_,P1), person(N2,_,P2), P1!=P2.




% this statement below is kinda' working
:- 2 #count { N,R,P : allocate(N,R), room(R), person(N,_,P), P==shared} 3.
% :- 1 #count { N,R,P : allocate(N,R), room(R), person(N,_,P), P==private}.




:- n_of_allocated(X), n_of_people(Y), X!=Y.





% :- not N #count{ M,P,C : allocate(M,P,C), C==expert} N, nOfExperts(N).



#show allocate/2.
#show n_of_people/1.
#show n_of_allocated/1.
