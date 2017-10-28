% Usage:
% thy(T,_),expand_fact_all(T,Res),writeByLine(Res,'mid.txt').

thy_ex1(T,N):-
T = [
  [[plus, 2, 3], [plus, 3, 2]],
  [[plus, 5, 6], [plus, 6, 5]],
  [[mult, 2, 8], [mult, 8, 2]],
  [[plus, 3, [plus, 3, 9]], [plus, [plus, 9, 3], 3]]
],
N = 13.

thy_one_plus_one(T,N):-
T = [
  [[plus, [apple, 1], [apple, 1]], [apple, 2]],
  [[plus, [orange, 1], [orange, 1]], [orange, 2]]
],
N = 13.

thy_big_data(T,N):-
T = [
  [[cat, sam], [mammal, sam]],
  [[cat, alice], [mammal, alice]],
  [[cat, tom], [mammal, tom]],
  [[cat, lucy], [mammal, lucy]],
  [[cat, bob], [mammal, bob]],
  [[mother, alice, bob], [parent, alice, bob]],
  [[mother, kate, sam], [parent, kate, sam]],
  [[mother, lucy, tom], [parent, lucy, tom]],
  [[mother, betty, cara], [parent, betty, cara]],

  [[plus, [apple, 1], [apple, 1]], [apple, 2]],
  [[plus, [orange, 1], [orange, 1]], [orange, 2]],
  [[plus, [water, [litre, 1]], [water, [litre, 1]]], [water, [litre, 2]]],
  [[plus, [ethylalcohol, [litre, 1]], [ethylalcohol, [litre, 1]]], [water, [litre, 2]]],
  [[plus, [banana, 1], [banana, 2]], [banana, 3]],
  [[plus, [pineapple, 1], [pineapple, 2]], [pineapple, 3]],
  [[plus, 3, 4], [plus, 4, 3]],
  [[plus, 4, 3], [plus, 3, 4]],
  [[plus, 7, 8], [plus, 8, 7]],
  [[plus, [plus, 2, 3], 4], [plus, 4, [plus, 2, 3]]],
  [[plus, [plus, 2, 3], 4], [plus, 2, [plus, 3, 4]]],
  [[plus, [plus, 5, 6], 7], [plus, 5, [plus, 6, 7]]],
  [[plus, [minus, 2, 3], 4], [plus, 4, [minus, 2, 3]]],
  [[plus, [minus, 2, 3], 4], [minus, 2, [minus, 3, 4]]],
  [[plus, [mult, 5, 6], 7], [plus, 7, [mult, 5, 6]]],
  [[minus, 2, 1], [neg, [minus, 1, 2]]],
  [[minus, 3, 4], [neg, [minus, 4, 3]]],
  [[minus, 1, 2], [neg, [minus, 2, 1]]],
  [[minus, 7, 8], [neg, [minus, 8, 7]]],
  %[[plus, [plus, 2, 3], [plus, 4, 5]], [plus, 2, [plus, 3, [plus, 4, 5]]]]
  /*[[[female, alice], [male, bob], [mother, alice, bob]], [son, bob, alice]],
  [[[female, kate], [male, sam], [mother, kate, sam]], [son, sam, kate]],
  [[[female, lucy], [male, tom], [son, tom, lucy]], [mother, lucy, tom]],
  [[[female, alice], [male, bob], [son, bob, alice]], [mother, alice, bob]],
  [[[female, kate], [male, sam], [son, sam, kate]], [mother, kate, sam]],
  [[[daughter, ada, kate], [female, ada], [female, kate]], [mother, kate, ada]],
  [[[daughter, betty, cara], [female, betty], [female, cara]], [mother, cara, betty]],
  [[[daughter, nancy, diana], [female, diana], [female, nancy]], [mother, diana, nancy]],
  [[daughter, ada, kate], [child, ada, kate]],
  [[daughter, betty, cara], [child, betty, cara]],
  [[daughter, nancy, diana], [child, nancy, diana]],
  [[son, tom, lucy], [child, tom, lucy]],*/
  [[mult, 1, 1], 1],
  [[mult, 2, 1], 2],
  [[mult, 3, 1], 3],
  [[mult, 1, 3], [mult, 3, 1]],
  [[mult, 3, 7], [mult, 7, 3]],
  [[mult, 2, 1], [mult, 1, 2]],
  [[mult, 8, 7], [mult, 7, 8]],
  
  [[mult, [mult, 1, 2], 3], [mult, 1, [mult, 2, 3]]], 
  %[[mult, [mult, 3, 7], 8], [mult, 3, [mult, 7, 8]]],
  %[[mult, [mult, 3, 2], 1], [mult, 3, [mult, 2, 1]]],
  [[mult, [plus, 1, 2], 3], [plus, [mult, 1, 3], [mult, 2, 3]]],

  %[[mult, [plus, 3, 7], 8], [plus, [mult, 3, 8], [mult, 7, 8]]],
  %[[mult, [plus, 3, 2], 1], [plus, [mult, 3, 1], [mult, 2, 1]]],
  [[[deri, cos], pi], [neg, [sin, pi]]],
  [[[deri, cos], pi], 0],
  [[[deri, cos], [divi, pi, 2]], [neg, [sin, [divi, pi, 2]]]],
  [[[deri, cos], [divi, pi, 2]], [neg, 1]],
  [[[deri, cos], 0], [neg, [sin, 0]]],
  [[[deri, cos], 0], 0],
  [[[deri, cos], [neg, [divi, pi, 2]]], [neg, [sin, [neg, [divi, pi, 2]]]]],
  [[[deri, cos], [neg, [divi, pi, 2]]], 1],
  [[[deri, cos], [neg, [divi, pi, 2]]], [sin, [divi, pi, 2]]],
  [[cos, pi], [sin, [plus, pi, [divi, pi, 2]]]],
  [[cos, [neg, pi]], [cos, pi]],
  [[cos, [divi, pi, 2]], [sin, [plus, [divi, pi, 2], [divi, pi, 2]]]],
  [[cos, [neg, [divi, pi, 2]]], [cos, [divi, pi, 2]]],
  [[cos, [neg, [divi, pi, 2]]], [sin, [plus, [neg, [divi, pi, 2]], [divi, pi, 2]]]],
  [[sin, [neg, pi]], [neg, [sin, pi]]],
  [[sin, [neg, [divi, pi, 2]]], [neg, [sin, [divi, pi, 2]]]],
  [[plus, [succ, 0], 0], [succ, 0]],
  [[plus, 0, 0], 0],
  [[plus, 0, [succ, 0]], [succ, [plus, 0, 0]]],
  [[plus, 0, [pred, 0]], [pred, 0]],
  [[plus, [succ, 0], [pred, 0]], 0],
  [[plus, [pred, 0], 0], [pred, 0]],
  [[plus, [pred, 0], [pred, 0]], [pred, [pred, 0]]]
  %[[plus, [succ, 0], [succ, 0]], [succ, [plus, [succ, 0], 0]]]
  %[[plus, [succ, 0], [succ, 0]], [succ, [succ, 0]]]

],
N = 13.




thy_arith(T,N):-
T = [
  [[plus, 2, 3], [plus, 3, 2]],
  [[plus, 5, 6], [plus, 6, 5]],
  [[mult, 2, 8], [mult, 8, 2]],
  [[plus, 1, 1], [mult, 1, 2]],
  [[plus, 2, 2], [mult, 2, 2]],
  [[plus, 3, 3], [mult, 3, 2]],
  [[mult, [mult, 1, 2], 3], [mult, 1, [mult, 2, 3]]],
  [[mult, [mult, 2, 3], 4], [mult, 2, [mult, 3, 4]]],
  [[mult, [mult, 2, 2], 2], [pow, 2, 3]],
  [[mult, [mult, 3, 3], 3], [pow, 3, 3]],
  [[mult, [mult, 4, 4], 4], [pow, 4, 3]],
  [[plus, 3, [plus, 3, 9]], [plus, [plus, 9, 3], 3]]
],
N = 13.


thy_parent(T,N):-
T = [
  [[mother, alice, bob], [parent, alice, bob]],
  [[father, millar, bob], [parent, millar, bob]],
  [[friend, alice, millar], [friend, millar, alice]],
  [[mother, alice, bob], [child, bob, alice]],
  [[father, millar, bob], [child, bob, millar]],
  [[mother, jean, sam], [parent, jean, sam]],
  [[father, tom, sam], [parent, tom, sam]],
  [unknown, unknown]



],
N = 13.


% 0 --- 0
% 1 --- [succ, 0]
% 2 --- [succ, [succ, 0]]
% 3 --- [succ, [succ, [succ, 0]]]
% 4 --- [succ, [succ, [succ, [succ, 0]]]]
% 5 --- [succ, [succ, [succ, [succ, [succ, 0]]]]]
% 6 --- [succ, [succ, [succ, [succ, [succ, [succ, 0]]]]]]
% 

thy_peano1(T,N):-
T = [
  % 0 + 0 ==> 0
  [[plus, 0, 0], 0],
  % 0 + 1 ==> 1
  [[plus, 0, [succ, 0]], [succ, 0]],
  % 0 + 2 ==> 2
  [[plus, 0, [succ, [succ, 0]]], [succ, [succ, 0]]],
  % 1 + 0 ==> 1
  [[plus, [succ, 0], 0], [succ, 0]],
  % 2 + 0 ==> 2
  [[plus, [succ, [succ, 0]], 0], [succ, [succ, 0]]],
  % 1 + 1 ==> 2
  [[plus, [succ, 0], [succ, 0]], [succ, [succ, 0]]],

  % 1 + 0 ==> 1 + (0 + 0)
  [[plus, [succ, 0], 0], [succ, [plus, 0, 0]]],
  % 1 + 1 ==> 1 + (0 + 1)
  [[plus, [succ, 0], [succ, 0]], [plus, [succ, 0], [plus, 0, [succ, 0]]]],
  
% 0 --- 0
% 1 --- [succ, 0]
% 2 --- [succ, [succ, 0]]
% 3 --- [succ, [succ, [succ, 0]]]
% 4 --- [succ, [succ, [succ, [succ, 0]]]]
% 5 --- [succ, [succ, [succ, [succ, [succ, 0]]]]]
% 6 --- [succ, [succ, [succ, [succ, [succ, [succ, 0]]]]]]
  [unknown, unknown]
],
N = 0.


thy_peano(T,N):-
T = [

  % --- 0 = 0 ---

  % 0 = 0
  [0, 0],
  % 0 + 0 = 0
  [[plus, 0, 0], 0],
  % (0 + 0) + 0 = 0
  [[plus, [plus, 0, 0], 0], 0],
  % 0 + (0 + 0) = 0
  [[plus, 0, [plus, 0, 0]], 0],
  % 0 = 0 + 0
  [0, [plus, 0, 0]],
  % 0 + 0 = 0 + 0
  [[plus, 0, 0], [plus, 0, 0]],
  % (0 + 0) + 0 = 0 + 0
  [[plus, [plus, 0, 0], 0], [plus, 0, 0]],
  % 0 + (0 + 0) = 0 + 0
  [[plus, 0, [plus, 0, 0]], [plus, 0, 0]],

  % 0 = (0 + 0) + 0
  [0, [plus, [plus, 0, 0], 0]],
  % 0 + 0 = (0 + 0) + 0
  [[plus, 0, 0], [plus, [plus, 0, 0], 0]],
  % (0 + 0) + 0 = (0 + 0) + 0
  [[plus, [plus, 0, 0], 0], [plus, [plus, 0, 0], 0]],
  % 0 + (0 + 0) = (0 + 0) + 0
  [[plus, 0, [plus, 0, 0]], [plus, [plus, 0, 0], 0]],

  % 0 = 0 + (0 + 0)
  [0, [plus, 0, [plus, 0, 0]]],
  % 0 + 0 = 0 + (0 + 0)
  [[plus, 0, 0], [plus, 0, [plus, 0, 0]]],
  % (0 + 0) + 0 = 0 + (0 + 0)
  [[plus, [plus, 0, 0], 0], [plus, 0, [plus, 0, 0]]],
  % 0 + (0 + 0) = 0 + (0 + 0)
  [[plus, 0, [plus, 0, 0]], [plus, 0, [plus, 0, 0]]],

  % 0 + 1 = 1
  %[[plus, 0, [succ, 0]], [succ, 0]],
  % 0 + 2 = 2
  %[[plus, 0, [succ, [succ, 0]]], [succ, [succ, 0]]],
  % 0 + 2 = 1 + 1
  % 0 + 2 = 2 + 0

  % --- 1 = 1 ---


  % 1 = 1
  [[succ, 0], [succ, 0]],
  % 1 = 0 + 1
  [[succ, 0], [plus, 0, [succ, 0]]],
  % 1 = (0 + 0) + 1
  [[succ, 0], [plus, [plus, 0, 0], [succ, 0]]],
  % 1 = 

  % 1 ==> 1 [succ, 0]
  % 1 ==> 0 + 1 [plus, 0, [succ, 0]]
  % 1 ==> (0 + 0) + 1 [plus, [plus, 0, 0], [succ, 0]]
  % 1 ==> ((0 + 0) + 0) + 1 ==> [plus, [plus, [plus, 0, 0], 0], [succ, 0]]
  % 1 ==> (0 + (0 + 0) + 1) ==> [plus, [plus, 0, [plus, 0, 0]], [succ, 0]]
  % 1 ==> (1 + 0) []

  % 1 + 0 = 1
  %[[plus, [succ, 0], 0], [succ, 0]],
  % 1 + 1 = 2
  %[[plus, [succ, 0], [succ, 0]], [succ, [succ, 0]]],
  % 1 + 2 = 3
  %[[plus, [succ, 0], [succ, [succ, 0]]], [succ, [succ, [succ, 0]]]],
 
  % 2 + 0 = 2
  %[[plus, [succ, [succ, 0]], 0], [succ, [succ, 0]]],
  % 

% 0 --- 0
% 1 --- [succ, 0]
% 2 --- [succ, [succ, 0]]
% 3 --- [succ, [succ, [succ, 0]]]
% 4 --- [succ, [succ, [succ, [succ, 0]]]]
% 5 --- [succ, [succ, [succ, [succ, [succ, 0]]]]]
% 6 --- [succ, [succ, [succ, [succ, [succ, [succ, 0]]]]]]


  % LINE
  [unknown, unknown]
  % 1 + 2 = 3
  %[[plus, [succ, 0], [succ, [succ, 0]]], [succ, [succ, [succ, 0]]]]
],
N = 0.



thy_presentation_1(T,N):-
T = [
  [[plus, [plus, 2, 3], 4], [plus, 2, [plus, 3, 4]]]
],
N = 13.

thy_presentation_2(T,N):-
T = [
  [[logical_and, [mother, alice, bob], [father, bob, kate]], [grandmother, alice, bob]]
],
N = 13.

thy_presentation_3(T,N):-
T = [
  [[plus, [succ, 0], 0], [succ, 0]]
],
N = 13.






thy_presentation_4(T,N):-
T = [
  [[equal, unk_x, [mult, [mult, 3, 3], 3]], [equal, unk_x, [pow, 3, 3]]]
],
N = 13.

