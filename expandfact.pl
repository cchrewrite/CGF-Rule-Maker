/*
( plus 2 3 ) ==> ( plus 3 2 )
( plus 5 6 ) ==> ( plus 6 5 )
( mult 2 8 ) ==> ( mult 8 2 )
( plus 3 ( plus 3 9 ) ) ==> ( plus ( plus 9 3 ) 3 )
*/



expand_and_add_equality(T,Res):-
  expand_fact_all(T,R1),
  findall([X1,Y],(vble_map(X,Y),atom_concat(vble_,X,X1)),VM),
  findall(
    [X1,Y],
    (
      member([X,Y],R1),
      find_vble_block(X,[],V),
      add_equality(X,V,VM,X1)
    ),
    Res1
  ),
  setof(P,member(P,Res1),Res2),
  subproc(Res2,Res),
  writeByLine(Res,'mid.txt'),
  writeByLine(VM,'vble.txt'),
  findall(
    [A,B],
    (
      %A = [plus, U, V],
      %member([A,B],Res)
      %;
      %A = [plus, U, U],
      %member([A,B],Res)
      %;
      %A = [mult, U, V],
      %member([A,B],Res)
      %;
      %A = [mult, [mult, U, U], U],
      member([A,B],Res)
    ),
    Qry1
  ),
  setof(PP,member(PP,Qry1),Qry),
  writeByLine(Qry,'qry.txt').

subproc([[P,Q]],[[[P,ax_1],Q]]):-!.
subproc(L,Res):-
  L = [[P1,Q1],[P2,Q2]|L1],
  subproc([[P2,Q2]|L1],[[[P2,T2],Q2]|L2]),
  atom_concat(ax_,N1,T2),
  atom_number(N1,N2),
  N is N2 + 1,

  (
    P1 = P2,
    atom_concat(ax_,N,T),
    Res = [[[P1,T],Q1]|[[[P2,T2],Q2]|L2]]
    ;
    P1 \= P2,
    atom_concat(ax_,1,T),
    Res = [[[P1,T],Q1]|[[[P2,T2],Q2]|L2]]
  ).


% Usage: 
% thy(T,_),expand_fact_all(T,Res),writeByLine(Res,'mid.txt').

thy(T,N):-
T = [
  [[plus, 2, 3], [plus, 3, 2]],
  [[plus, 5, 6], [plus, 6, 5]],
  [[mult, 2, 8], [mult, 8, 2]],
  [[plus, 3, [plus, 3, 9]], [plus, [plus, 9, 3], 3]]
],
N = 13.

thy1(T,N):-
T = [
  [[5, 6, 7], [5, 7, 6]],
  [[5, 8, 9], [5, 9, 8]],
  [[10, 6, 11], [10, 11, 6]],
  [[5, 7, [5, 7, 12]], [5, [5, 12, 7], 7]]
],
N = 13.


:- dynamic new_vble/1.
:- retractall(new_vble(_)).
:- assert(new_vble(0)).

:- dynamic vble_map/2.
:- retractall(vble_map(_,_)).



expand_fact(P,Q,P,Q).
expand_fact(P,Q,Ps,Qs):-
  append(P1,[Q|P2],P),
  length(P1,L1),
  nth0(L1,P,Q),
  (
    vble_map(N,Q),
    atom_concat(vble_,N,V),
    append(P1,[V|P2],Ps)
    ;
    \+vble_map(_,Q),
    new_vble(N),
    retractall(new_vble(_)),
    N1 is N + 1,
    assert(new_vble(N1)),
    assert(vble_map(N1,Q)),
    atom_concat(vble_,N1,V),
    append(P1,[V|P2],Ps)
  ),
  atom_concat(copy_,L1,Qs).
expand_fact(P,Q,Ps,Qs):-
  append(P1,[X|P2],P),
  expand_fact(X,Q,Ps1,Qs1),
  atom(Qs1),
  atom_concat(copy,Lq,Qs1),
  append(P1,[Ps1|P2],Ps),
  length(P1,L1),
  atom_concat(L1,Lq,L2),
  atom_concat(copy_,L2,Qs).

expand_fact_full(P,Q,Ps,Qs):-
  expand_fact(P,Q,Ps,Qs).
expand_fact_full(P,Q,Ps,Qs):-
  expand_fact(P,Q,Ps1,Qs1),
  Ps1 == P,
  Qs1 == Q,
  append(Q1,[X|Q2],Qs1),
  expand_fact_full(Ps1,X,Ps2,Qs2),
  Ps2 \= P,
  Qs2 \= Q,
  (
    append(Q1,[Qs2|Q2],Qs),
    Ps = Ps2
    ;
    append(Q1,[Qs2|Q2],Qs3),
    expand_fact_full(Ps2,Qs3,Ps,Qs),
    Ps \= Ps2,
    Qs \= Qs3
  ).
 
expand_fact_all([],[]).
expand_fact_all([[P,Q]|L],Res):-
  setof([Ps,Qs],expand_fact_full(P,Q,Ps,Qs),Y),
  expand_fact_all(L,R1),
  append(Y,R1,Res).

find_vble_block(X,V,[X|V]):-
  \+is_list(X),
  atom_concat(vble_,_,X),
  !.
find_vble_block([],V,V):-!.
find_vble_block([X|L],V,Res):-
  \+is_list(X),
  atom_concat(vble_,_,X),
  find_vble_block(L,[X|V],Res),
  !.
find_vble_block([X|L],V,Res):-
  find_vble_block_sub(X,V,V1),
  find_vble_block(L,V,V2),
  append(V1,V2,Res),
  !.
find_vble_block_sub(P,V,Res):-
  is_list(P),
  find_vble_block(P,V,Res),
  !.
find_vble_block_sub(P,V,V):-
  \+is_list(P),
  !.
 
add_equality([],_,_,[]):-!.
add_equality([X|L],V,VM,[X1|L1]):-
  member([N,X],VM),
  member(N,V),
  add_equality(L,V,VM,L1),
  X1 = N.
add_equality([X|L],V,VM,[X1|L1]):-
  add_equality_sub(X,V,VM,X1),
  add_equality(L,V,VM,L1).
add_equality_sub(X,V,VM,X1):-
  is_list(X),
  add_equality(X,V,VM,X1).
add_equality_sub(X,_,_,X):-
  \+is_list(X).


printByLine([]).
printByLine([X|L]):-
  print(X),nl,
  printByLine(L).

writeByLine(L,FileName):-
  open(FileName,write,Stream),
  writeByLine2(L,Stream),
  close(Stream).

writeByLine2([],_).
writeByLine2([[X,Y]|L],Stream):-
  write(Stream,X),
  write(Stream, " ==> "),
  write(Stream,Y),
  nl(Stream),
  writeByLine2(L,Stream).
 
