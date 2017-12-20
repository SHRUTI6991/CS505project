:- use_module('/Users/pradeepkumarnama/Desktop/metagol').

%% first-order background knowledge
vertical(2,3).
horizontal(3,5).
vertical(1,4).
horizontal(4,5).
vertical(1,3),
horizontal(3,5)

%% predicates that can be used in the learning
prim(horizontal/2).
prim(vertical/2).

%% metarules
metarule([P,Q],([P,A,B]:-[[Q,A,B]])).
metarule([P,Q,R],([P,A,B]:-[[Q,A,B],[R,A,B]])).
metarule([P,Q,R],([P,A,B]:-[[Q,A,C],[R,C,B]])).

%% learning task
a :-
  %% positive examples
  Pos = [
    stair(2,5),
    stair(1,5)
  ],
  %% negative examples
  Neg = [
    stair(2,4)
  ],
  learn(Pos,Neg).