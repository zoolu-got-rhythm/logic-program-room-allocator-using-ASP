
person(nahal, female, private).
person(tara, female, shared).
person(adib, male, shared).
person(john, male, shared).
person(rachael, female, shared).
person(kristin, female, shared).

room(a;b;c).

1 { allocate(N,R) : person(N,_,_) } 3 :- room(R).

:- allocate(N,R1), allocate(N,R2), R1!=R2, person(N,_,_).
% :- allocate(N1,R;N2,R), person(N1,G1;N2,G2), room(R), G1!=G2.

%:- allocate(nahal,a), allocate(adib,a).
%:- allocate(nahal,a), allocate(john,a).
%:- allocate(nahal,b), allocate(adib,b).
%:- allocate(nahal,b), allocate(john,b).


:- allocate(N1,R), allocate(N2,R), room(R), person(N1,G1,_), person(N2,G2,_), G1!=G2.

% this statement below is kinda' working
% :- #count { N,R,P : allocate(N,R), room(R), person(N,_,P), P==shared} 2.



% :- not N #count{ M,P,C : allocate(M,P,C), C==expert} N, nOfExperts(N).



#show allocate/2.
