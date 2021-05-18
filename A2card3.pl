
%% -----------------------------------
%% you may try a test using play2 with a sample test case
%% -----------------------------------
play2 :-
  Deck = [[ace,clubs],[king,clubs],[queen,clubs],[jack,clubs],[10,clubs],[9,clubs],[8,clubs],[7,clubs],[6,clubs],[5,clubs],[4,clubs],[3,clubs],
           [2,clubs],
          [ace,spades],[king,spades],[queen,spades],[jack,spades],[10,spades],[9,spades],[8,spades],[7,spades],[6,spades],[5,spades],[4,spades],
           [3,spades],[2,spades],
          [ace,hearts],[king,hearts],[queen,hearts],[jack,hearts],[10,hearts],[9,hearts],[8,hearts],[7,hearts],[6,hearts],[5,hearts],[4,hearts],
           [3,hearts],[2,hearts],
          [ace,diamonds],[king,diamonds],[queen,diamonds],[jack,diamonds],[10,diamonds],[9,diamonds],[8,diamonds],[7,diamonds],[6,diamonds],
           [5,diamonds],[4,diamonds],[3,diamonds],[2,diamonds]],
  random_permutation( Deck ,Rdeck),
  Rdeck= [A,B,C,D,E,F,G,H,I,J|_],

  H1 = [A,C,E,G,I],
  H2 = [B,D,F,H,J],
  %H1 = [[queen,spade],[queen,diamond],[queen,heart],[5,diamond],[6,heart]],
  %H2 = [[3,spade],[3,diamond],[5,heart],[6,diamond],[7,heart]],


  sort_hand(H1, Sorted_Hand1),
  determine_hand(Sorted_Hand1,  FH1),
  sort_hand(H2, Sorted_Hand2),
  determine_hand(Sorted_Hand2,  FH2),





  winner(H1,H2, Winner),!,
  print(H1),print(FH1),nl, print(H2),print(FH2),nl, print('win='), print(Winner).


play([],0).
play([[Hand1,Hand2]|Rst], Num_Wins) :-
  winner(Hand1, Hand2, Winner),
  (Winner = Hand1, play(Rst,Remaining), Num_Wins is 1 + Remaining ;
   play(Rst, Num_Wins)).

%task3start

n_task3 :-
  print(number_of_iteration_10 ),nl,
  t3_main(10),
  print(number_of_iteration_100 ),nl,
  t3_main(100),
  print(number_of_iteration_1000 ),nl,
  t3_main(1000),
  print(number_of_iteration_10000 ),nl,
  t3_main(10000),
  print(number_of_iteration_100000 ),nl,
  t3_main(100000).

play3(Deck,FH1,FH2,H1,H2) :-



  Deck = [[ace,clubs],[king,clubs],[queen,clubs],[jack,clubs],[10,clubs],[9,clubs],[8,clubs],[7,clubs],[6,clubs],[5,clubs],[4,clubs],[3,clubs],
           [2,clubs],
          [ace,spades],[king,spades],[queen,spades],[jack,spades],[10,spades],[9,spades],[8,spades],[7,spades],[6,spades],[5,spades],[4,spades],
           [3,spades],[2,spades],
          [ace,hearts],[king,hearts],[queen,hearts],[jack,hearts],[10,hearts],[9,hearts],[8,hearts],[7,hearts],[6,hearts],[5,hearts],[4,hearts],
           [3,hearts],[2,hearts],
          [ace,diamonds],[king,diamonds],[queen,diamonds],[jack,diamonds],[10,diamonds],[9,diamonds],[8,diamonds],[7,diamonds],[6,diamonds],
           [5,diamonds],[4,diamonds],[3,diamonds],[2,diamonds]],
  random_permutation( Deck ,Rdeck),
  Rdeck= [A,B,C,D,E,F,G,H,I,J|_],

  H1 = [A,C,E,G,I],
  H2 = [B,D,F,H,J],


  sort_hand(H1, Sorted_Hand1),
  determine_hand(Sorted_Hand1,  FH1),
  sort_hand(H2, Sorted_Hand2),
  determine_hand(Sorted_Hand2,  FH2).

  %winner(H1,H2, Winner),!.
  %print(H1),print(FH1),nl, print(H2),print(FH2),nl, print('win='), print(Winner),nl.

copy(L,R) :- accCp(L,R).
accCp([],[]).
accCp([H|T1],[H|T2]) :- accCp(T1,T2).

same(L1, L2) :- maplist(=, L1, L2).

rank_acc1(RL,FH1,RL1):-
  RL = [RF,SF,FK,F_H,F,S,TK,TP,P,HC],
  (   FH1 = high_card ->
  HC2 is HC +1;
  HC2 is HC),

  (   FH1 = pair ->
  P2 is P +1;
  P2 is P),

  (   FH1 =two_pair  ->
  TP2 is TP +1;
  TP2 is TP),
   (   FH1 = three_of_a_kind ->
  TK2 is TK +1;
  TK2 is TK),
   (   FH1 = straight ->
  S2 is S +1;
  S2 is S),
   (   FH1 = flush ->
  F2 is F +1;
  F2 is F),
   (   FH1 = full_house ->
  F_H2 is F_H +1;
  F_H2 is F_H),
   (   FH1 = four_of_a_kind ->
  FK2 is FK +1;
  FK2 is FK),
    (   FH1 = straight_flush ->
  SF2 is SF +1;
  SF2 is SF),
    (   FH1 = royal_flush ->
  RF2 is RF +1;
  RF2 is RF),
  RL1=[RF2,SF2,FK2,F_H2,F2,S2,TK2,TP2,P2,HC2].

t3_main(X):-
  HC= [0,0,0,0,0,0,0,0,0,0],
  P= [0,0,0,0,0,0,0,0,0,0],
  TP= [0,0,0,0,0,0,0,0,0,0],
  TK= [0,0,0,0,0,0,0,0,0,0],
  S= [0,0,0,0,0,0,0,0,0,0],
  F= [0,0,0,0,0,0,0,0,0,0],
  F_H= [0,0,0,0,0,0,0,0,0,0],
  FK= [0,0,0,0,0,0,0,0,0,0],
  SF= [0,0,0,0,0,0,0,0,0,0],
  RF= [0,0,0,0,0,0,0,0,0,0],
  RL=[0,0,0,0,0,0,0,0,0,0],
  task3_main(X,HC,P,TP,TK,S,F,F_H,FK,SF,RF,RL).

task3_main(X,HC,P,TP,TK,S,F,F_H,FK,SF,RF,RL) :-
  Deck = [[ace,clubs],[king,clubs],[queen,clubs],[jack,clubs],[10,clubs],[9,clubs],[8,clubs],[7,clubs],[6,clubs],[5,clubs],[4,clubs],[3,clubs],
           [2,clubs],
          [ace,spades],[king,spades],[queen,spades],[jack,spades],[10,spades],[9,spades],[8,spades],[7,spades],[6,spades],[5,spades],[4,spades],
           [3,spades],[2,spades],
          [ace,hearts],[king,hearts],[queen,hearts],[jack,hearts],[10,hearts],[9,hearts],[8,hearts],[7,hearts],[6,hearts],[5,hearts],[4,hearts],
           [3,hearts],[2,hearts],
          [ace,diamonds],[king,diamonds],[queen,diamonds],[jack,diamonds],[10,diamonds],[9,diamonds],[8,diamonds],[7,diamonds],[6,diamonds],
           [5,diamonds],[4,diamonds],[3,diamonds],[2,diamonds]],

  (   X >0 ->

  play3(Deck,FH1,FH2,H1,H2),
  %print(H1),
  %nl,
  %print(H2),
  %table2
  winner(H1,H2, Winner),
  %print(ogwinner),print(Winner),

  (   same(H1,Winner) ->
  rank_acc1(RL,FH1,RL1);
  %print(winner),
  %print(H1),
  %print(FH1),

  copy(RL,RL1)),!,



      N1 is X - 1,

      (   FH1 = high_card ->
      hct(HC,HC2,FH2);copy(HC,HC2)),!,
      (      FH1 = pair ->
      pt(P,P2,FH2);copy(P,P2)),!,
      (   FH1 = two_pair ->
      tpt(TP,TP2,FH2);copy(TP,TP2)),!,
      (     FH1 = three_of_a_kind ->
      tkt(TK,TK2,FH2);copy(TK,TK2)),!,
      (    FH1 = straight ->
      st(S,S2,FH2);copy(S,S2)),!,
      (   FH1 = flush ->
      ft(F,F2,FH2);copy(F,F2)),!,
          (   FH1 = full_house ->
      f_ht(F_H,F_H2,FH2);copy(F_H,F_H2)),!,
          (   FH1 = four_of_a_kind ->
      fkt(FK,FK2,FH2);copy(FK,FK2)),!,
          (   FH1 = straight_flush ->
      sft(SF,SF2,FH2);copy(SF,SF2)),!,
          (   FH1 = royal_flush ->
      rft(RF,RF2,FH2); copy(RF,RF2)),!,


      task3_main(N1,HC2,P2,TP2,TK2,S2,F2,F_H2,FK2,SF2,RF2,RL1));
  tab(13),print(RF),tab(2),print(royal_flush_rowtotal),sumlist(RF,S1),tab(2),print(S1),
  nl,
  tab(13),print(SF),tab(2),print(straight_flush_rowtotal),sumlist(SF,S2),tab(2),print(S2),
  nl,
  tab(13),print(FK),tab(2),print(four_of_a_kind_rowtotal),sumlist(FK,S3),tab(2),print(S3),
  nl,
  tab(13),print(F_H),tab(2),print(full_house_rowtotal),sumlist(F_H,S4),tab(2),print(S4),
  nl,
  tab(13),print(F),tab(2),print(flush_rowtotal),sumlist(F,S5),tab(2),print(S5),
  nl,
  tab(13),print(S),tab(2),print(straight_rowtotal),sumlist(S,S6),tab(2),print(S6),
  nl,
  tab(13),print(TK),tab(2),print(three_of_a_kind_rowtotal),sumlist(TK,S7),tab(2),print(S7),
  nl,
  tab(13),print(TP),tab(2),print(two_pair_rowtotal),sumlist(TP,S8),tab(2),print(S8),
  nl,
  tab(13),print(P),tab(2),print(pair_rowtotal),sumlist(P,S9),tab(2),print(S9),
  nl,
  tab(13),print(HC),tab(2),print(high_card_rowtotal),sumlist(HC,S10),tab(2),print(S10),
  nl,
  add_col(HC,P,TP,TK,S,F,F_H,FK,SF,RF,[],L2),
  print(col_total),print(L2),nl,print(player1_win_table),tab(2),print(RL),
  nl,
  sum_list(RL,SRL),
  RL=[RRF,SSF,FFK,FFH,FF,SS,TTK,TTP,PP,HHC],
  PRF is (RRF/SRL)*100,
  print(rf_frequency),tab(2),print(RRF),tab(2),print(rf_prob),tab(2),print(PRF),
  nl,
  PSF is (SSF/SRL)*100,
  print(sf_frequency),tab(2),print(SSF),tab(2),print(sf_prob),tab(2),print(PSF),
  nl,
  PFK is (FFK/SRL)*100,
  print(fk_frequency),tab(2),print(FFK),tab(2),print(fk_prob),tab(2),print(PFK),
  nl,
  PFH is (FFH/SRL)*100,
  print(fh_frequency),tab(2),print(FFH),tab(2),print(fh_prob),tab(2),print(PFH),
  nl,
  PF is (FF/SRL)*100,
  print(f_frequency),tab(2),print(FF),tab(2),print(f_prob),tab(2),print(PF),
  nl,
  PS is (SS/SRL)*100,
  print(s_frequency),tab(2),print(SS),tab(2),print(s_prob),tab(2),print(PS),
  nl,
  PTK is (TTK/SRL)*100,
  print(tk_frequency),tab(2),print(TTK),tab(2),print(tk_prob),tab(2),print(PTK),
  nl,
  PTP is (TTP/SRL)*100,
  print(tp_frequency),tab(2),print(TTP),tab(2),print(tp_prob),tab(2),print(PTP),
  nl,
  P_P is (PP/SRL)*100,
  print(p_frequency),tab(2),print(PP),tab(2),print(p_prob),tab(2),print(P_P),
  nl,
  PHC is (HHC/SRL)*100,
  print(hc_frequency),tab(2),print(HHC),tab(2),print(hc_prob),tab(2),print(PHC),



  nl.




list_sum([Item], Item).
list_sum([Item1,Item2 | Tail], Total) :-
    list_sum([Item1+Item2|Tail], Total).



hct(HC,HC2,FH2) :-
  HC=[HC_RF,HC_SF,HC_FK,HC_FH,HC_F,HC_S,HC_TK,HC_TP,HC_P,HC_HC],

  (   FH2 = high_card ->
  HC_HC2 is HC_HC +1;
  HC_HC2 is HC_HC),

  (   FH2 = pair ->
  HC_P2 is HC_P +1;
  HC_P2 is HC_P),

  (   FH2 =two_pair  ->
  HC_TP2 is HC_TP +1;
  HC_TP2 is HC_TP),
   (   FH2 = three_of_a_kind ->
  HC_TK2 is HC_TK +1;
  HC_TK2 is HC_TK),
   (   FH2 = straight ->
  HC_S2 is HC_S +1;
  HC_S2 is HC_S),
   (   FH2 = flush ->
  HC_F2 is HC_F +1;
  HC_F2 is HC_F),
   (   FH2 = full_house ->
  HC_FH2 is HC_FH +1;
  HC_FH2 is HC_FH),
   (   FH2 = four_of_a_kind ->
  HC_FK2 is HC_FK +1;
  HC_FK2 is HC_FK),
    (   FH2 = straight_flush ->
  HC_SF2 is HC_SF +1;
  HC_SF2 is HC_SF),
    (   FH2 = royal_flush ->
  HC_RF2 is HC_RF +1;
  HC_RF2 is HC_RF),
  HC2=[HC_RF2,HC_SF2,HC_FK2,HC_FH2,HC_F2,HC_S2,HC_TK2,HC_TP2,HC_P2,HC_HC2].

pt(P,P2,FH2) :-
  P=[P_RF,P_SF,P_FK,P_FH,P_F,P_S,P_TK,P_TP,P_P,P_HC],

  (   FH2 = high_card ->
  P_HC2 is P_HC +1;
  P_HC2 is P_HC),

  (   FH2 = pair ->
  P_P2 is P_P +1;
  P_P2 is P_P),

  (   FH2 =two_pair  ->
  P_TP2 is P_TP +1;
  P_TP2 is P_TP),
   (   FH2 = three_of_a_kind ->
  P_TK2 is P_TK +1;
  P_TK2 is P_TK),
   (   FH2 = straight ->
  P_S2 is P_S +1;
  P_S2 is P_S),
   (   FH2 = flush ->
  P_F2 is P_F +1;
  P_F2 is P_F),
   (   FH2 = full_house ->
  P_FH2 is P_FH +1;
  P_FH2 is P_FH),
   (   FH2 = four_of_a_kind ->
  P_FK2 is P_FK +1;
  P_FK2 is P_FK),
    (   FH2 = straight_flush ->
  P_SF2 is P_SF +1;
  P_SF2 is P_SF),
    (   FH2 = royal_flush ->
  P_RF2 is P_RF +1;
  P_RF2 is P_RF),
  P2=[P_RF2,P_SF2,P_FK2,P_FH2,P_F2,P_S2,P_TK2,P_TP2,P_P2,P_HC2].


tpt(TP,TP2,FH2) :-
  TP=[TP_RF,TP_SF,TP_FK,TP_FH,TP_F,TP_S,TP_TK,TP_TP,TP_P,TP_HC],

  (   FH2 = high_card ->
  TP_HC2 is TP_HC +1;
  TP_HC2 is TP_HC),

  (   FH2 = pair ->
  TP_P2 is TP_P +1;
  TP_P2 is TP_P),

  (   FH2 =two_pair  ->
  TP_TP2 is TP_TP +1;
  TP_TP2 is TP_TP),
   (   FH2 = three_of_a_kind ->
  TP_TK2 is TP_TK +1;
  TP_TK2 is TP_TK),
   (   FH2 = straight ->
  TP_S2 is TP_S +1;
  TP_S2 is TP_S),
   (   FH2 = flush ->
  TP_F2 is TP_F +1;
  TP_F2 is TP_F),
   (   FH2 = full_house ->
  TP_FH2 is TP_FH +1;
  TP_FH2 is TP_FH),
   (   FH2 = four_of_a_kind ->
  TP_FK2 is TP_FK +1;
  TP_FK2 is TP_FK),
    (   FH2 = straight_flush ->
  TP_SF2 is TP_SF +1;
  TP_SF2 is TP_SF),
    (   FH2 = royal_flush ->
  TP_RF2 is TP_RF +1;
  TP_RF2 is TP_RF),
  TP2=[TP_RF2,TP_SF2,TP_FK2,TP_FH2,TP_F2,TP_S2,TP_TK2,TP_TP2,TP_P2,TP_HC2].


tkt(TK,TK2,FH2) :-
  TK=[TK_RF,TK_SF,TK_FK,TK_FH,TK_F,TK_S,TK_TK,TK_TP,TK_P,TK_HC],

  (   FH2 = high_card ->
  TK_HC2 is TK_HC +1;
  TK_HC2 is TK_HC),

  (   FH2 = pair ->
  TK_P2 is TK_P +1;
  TK_P2 is TK_P),

  (   FH2 =two_pair  ->
  TK_TP2 is TK_TP +1;
  TK_TP2 is TK_TP),
   (   FH2 = three_of_a_kind ->
  TK_TK2 is TK_TK +1;
  TK_TK2 is TK_TK),
   (   FH2 = straight ->
  TK_S2 is TK_S +1;
  TK_S2 is TK_S),
   (   FH2 = flush ->
  TK_F2 is TK_F +1;
  TK_F2 is TK_F),
   (   FH2 = full_house ->
  TK_FH2 is TK_FH +1;
  TK_FH2 is TK_FH),
   (   FH2 = four_of_a_kind ->
  TK_FK2 is TK_FK +1;
  TK_FK2 is TK_FK),
    (   FH2 = straight_flush ->
  TK_SF2 is TK_SF +1;
  TK_SF2 is TK_SF),
    (   FH2 = royal_flush ->
  TK_RF2 is TK_RF +1;
  TK_RF2 is TK_RF),
  TK2=[TK_RF2,TK_SF2,TK_FK2,TK_FH2,TK_F2,TK_S2,TK_TK2,TK_TP2,TK_P2,TK_HC2].


st(S,S2,FH2) :-
  S=[S_RF,S_SF,S_FK,S_FH,S_F,S_S,S_TK,S_TP,S_P,S_HC],

  (   FH2 = high_card ->
  S_HC2 is S_HC +1;
  S_HC2 is S_HC),

  (   FH2 = pair ->
  S_P2 is S_P +1;
  S_P2 is S_P),

  (   FH2 =two_pair  ->
  S_TP2 is S_TP +1;
  S_TP2 is S_TP),
   (   FH2 = three_of_a_kind ->
  S_TK2 is S_TK +1;
  S_TK2 is S_TK),
   (   FH2 = straight ->
  S_S2 is S_S +1;
  S_S2 is S_S),
   (   FH2 = flush ->
  S_F2 is S_F +1;
  S_F2 is S_F),
   (   FH2 = full_house ->
  S_FH2 is S_FH +1;
  S_FH2 is S_FH),
   (   FH2 = four_of_a_kind ->
  S_FK2 is S_FK +1;
  S_FK2 is S_FK),
    (   FH2 = straight_flush ->
  S_SF2 is S_SF +1;
  S_SF2 is S_SF),
    (   FH2 = royal_flush ->
  S_RF2 is S_RF +1;
  S_RF2 is S_RF),
  S2=[S_RF2,S_SF2,S_FK2,S_FH2,S_F2,S_S2,S_TK2,S_TP2,S_P2,S_HC2].


ft(F,F2,FH2) :-
  F=[F_RF,F_SF,F_FK,F_FH,F_F,F_S,F_TK,F_TP,F_P,F_HC],

  (   FH2 = high_card ->
  F_HC2 is F_HC +1;
  F_HC2 is F_HC),

  (   FH2 = pair ->
  F_P2 is F_P +1;
  F_P2 is F_P),

  (   FH2 =two_pair  ->
  F_TP2 is F_TP +1;
  F_TP2 is F_TP),
   (   FH2 = three_of_a_kind ->
  F_TK2 is F_TK +1;
  F_TK2 is F_TK),
   (   FH2 = straight ->
  F_S2 is F_S +1;
  F_S2 is F_S),
   (   FH2 = flush ->
  F_F2 is F_F +1;
  F_F2 is F_F),
   (   FH2 = full_house ->
  F_FH2 is F_FH +1;
  F_FH2 is F_FH),
   (   FH2 = four_of_a_kind ->
  F_FK2 is F_FK +1;
  F_FK2 is F_FK),
    (   FH2 = straight_flush ->
  F_SF2 is F_SF +1;
  F_SF2 is F_SF),
    (   FH2 = royal_flush ->
  F_RF2 is F_RF +1;
  F_RF2 is F_RF),
  F2=[F_RF2,F_SF2,F_FK2,F_FH2,F_F2,F_S2,F_TK2,F_TP2,F_P2,F_HC2].


f_ht(F_H,F_H2,FH2) :-
  F_H=[F_H_RF,F_H_SF,F_H_FK,F_H_FH,F_H_F,F_H_S,F_H_TK,F_H_TP,F_H_P,F_H_HC],

  (   FH2 = high_card ->
  F_H_HC2 is F_H_HC +1;
  F_H_HC2 is F_H_HC),

  (   FH2 = pair ->
  F_H_P2 is F_H_P +1;
  F_H_P2 is F_H_P),

  (   FH2 =two_pair  ->
  F_H_TP2 is F_H_TP +1;
  F_H_TP2 is F_H_TP),
   (   FH2 = three_of_a_kind ->
  F_H_TK2 is F_H_TK +1;
  F_H_TK2 is F_H_TK),
   (   FH2 = straight ->
  F_H_S2 is F_H_S +1;
  F_H_S2 is F_H_S),
   (   FH2 = flush ->
  F_H_F2 is F_H_F +1;
  F_H_F2 is F_H_F),
   (   FH2 = full_house ->
  F_H_FH2 is F_H_FH +1;
  F_H_FH2 is F_H_FH),
   (   FH2 = four_of_a_kind ->
  F_H_FK2 is F_H_FK +1;
  F_H_FK2 is F_H_FK),
    (   FH2 = straight_flush ->
  F_H_SF2 is F_H_SF +1;
  F_H_SF2 is F_H_SF),
    (   FH2 = royal_flush ->
  F_H_RF2 is F_H_RF +1;
  F_H_RF2 is F_H_RF),
  F_H2=[F_H_RF2,F_H_SF2,F_H_FK2,F_H_FH2,F_H_F2,F_H_S2,F_H_TK2,F_H_TP2,F_H_P2,F_H_HC2].


fkt(FK,FK2,FH2) :-
  FK=[FK_RF,FK_SF,FK_FK,FK_FH,FK_F,FK_S,FK_TK,FK_TP,FK_P,FK_HC],

  (   FH2 = high_card ->
  FK_HC2 is FK_HC +1;
  FK_HC2 is FK_HC),

  (   FH2 = pair ->
  FK_P2 is FK_P +1;
  FK_P2 is FK_P),

  (   FH2 =two_pair  ->
  FK_TP2 is FK_TP +1;
  FK_TP2 is FK_TP),
   (   FH2 = three_of_a_kind ->
  FK_TK2 is FK_TK +1;
  FK_TK2 is FK_TK),
   (   FH2 = straight ->
  FK_S2 is FK_S +1;
  FK_S2 is FK_S),
   (   FH2 = flush ->
  FK_F2 is FK_F +1;
  FK_F2 is FK_F),
   (   FH2 = full_house ->
  FK_FH2 is FK_FH +1;
  FK_FH2 is FK_FH),
   (   FH2 = four_of_a_kind ->
  FK_FK2 is FK_FK +1;
  FK_FK2 is FK_FK),
    (   FH2 = straight_flush ->
  FK_SF2 is FK_SF +1;
  FK_SF2 is FK_SF),
    (   FH2 = royal_flush ->
  FK_RF2 is FK_RF +1;
  FK_RF2 is FK_RF),
  FK2=[FK_RF2,FK_SF2,FK_FK2,FK_FH2,FK_F2,FK_S2,FK_TK2,FK_TP2,FK_P2,FK_HC2].


sft(SF,SF2,FH2) :-
  SF=[SF_RF,SF_SF,SF_FK,SF_FH,SF_F,SF_S,SF_TK,SF_TP,SF_P,SF_HC],

  (   FH2 = high_card ->
  SF_HC2 is SF_HC +1;
  SF_HC2 is SF_HC),

  (   FH2 = pair ->
  SF_P2 is SF_P +1;
  SF_P2 is SF_P),

  (   FH2 =two_pair  ->
  SF_TP2 is SF_TP +1;
  SF_TP2 is SF_TP),
   (   FH2 = three_of_a_kind ->
  SF_TK2 is SF_TK +1;
  SF_TK2 is SF_TK),
   (   FH2 = straight ->
  SF_S2 is SF_S +1;
  SF_S2 is SF_S),
   (   FH2 = flush ->
  SF_F2 is SF_F +1;
  SF_F2 is SF_F),
   (   FH2 = full_house ->
  SF_FH2 is SF_FH +1;
  SF_FH2 is SF_FH),
   (   FH2 = four_of_a_kind ->
  SF_FK2 is SF_FK +1;
  SF_FK2 is SF_FK),
    (   FH2 = straight_flush ->
  SF_SF2 is SF_SF +1;
  SF_SF2 is SF_SF),
    (   FH2 = royal_flush ->
  SF_RF2 is SF_RF +1;
  SF_RF2 is SF_RF),
  SF2=[SF_RF2,SF_SF2,SF_FK2,SF_FH2,SF_F2,SF_S2,SF_TK2,SF_TP2,SF_P2,SF_HC2].


rft(RF,RF2,FH2) :-
  RF=[RF_RF,RF_SF,RF_FK,RF_FH,RF_F,RF_S,RF_TK,RF_TP,RF_P,RF_HC],

  (   FH2 = high_card ->
  RF_HC2 is RF_HC +1;
  RF_HC2 is RF_HC),

  (   FH2 = pair ->
  RF_P2 is RF_P +1;
  RF_P2 is RF_P),

  (   FH2 =two_pair  ->
  RF_TP2 is RF_TP +1;
  RF_TP2 is RF_TP),
   (   FH2 = three_of_a_kind ->
  RF_TK2 is RF_TK +1;
  RF_TK2 is RF_TK),
   (   FH2 = straight ->
  RF_S2 is RF_S +1;
  RF_S2 is RF_S),
   (   FH2 = flush ->
  RF_F2 is RF_F +1;
  RF_F2 is RF_F),
   (   FH2 = full_house ->
  RF_FH2 is RF_FH +1;
  RF_FH2 is RF_FH),
   (   FH2 = four_of_a_kind ->
  RF_FK2 is RF_FK +1;
  RF_FK2 is RF_FK),
    (   FH2 = straight_flush ->
  RF_SF2 is RF_SF +1;
  RF_SF2 is RF_SF),
    (   FH2 = royal_flush ->
  RF_RF2 is RF_RF +1;
  RF_RF2 is RF_RF),
  RF2=[RF_RF2,RF_SF2,RF_FK2,RF_FH2,RF_F2,RF_S2,RF_TK2,RF_TP2,RF_P2,RF_HC2].


add_col([],[],[],[],[],[],[],[],[],[],L,L).
add_col(HC,P,TP,TK,S,F,F_H,FK,SF,RF,L,L2):-
  RF=[RFH|RFT],
  SF=[SFH|SFT],
  FK=[FKH|FKT],
  F_H=[F_HH|F_HT],
  F=[FH|FT],
  S=[SH|ST],
  TK=[TKH|TKT],
  TP=[TPH|TPT],
  P=[PH|PT],
  HC=[HCH|HCT],
  ADD is RFH + SFH +FKH + F_HH +FH +SH +TKH +TPH+PH +HCH,
    append(L,[ADD],L1),
    add_col(HCT,PT,TPT,TKT,ST,FT,F_HT,FKT,SFT,RFT,L1,L2).


%task3end
/**


t3_shuffle(N,H,P,S,SF,F,TK,TP,FK,FH,RF,H_2,P_2,S_2,SF_2,F_2,TK_2,TP_2,FK_2,FH_2,RF_2,NF):-
  Deck= [[ace,clubs],[king,clubs],[queen,clubs],[jack,clubs],[10,clubs],[9,clubs],[8,clubs],[7,clubs],[6,clubs],[5,clubs],[4,clubs],[3,clubs],
           [2,clubs],
          [ace,spades],[king,spades],[queen,spades],[jack,spades],[10,spades],[9,spades],[8,spades],[7,spades],[6,spades],[5,spades],[4,spades],
           [3,spades],[2,spades],
          [ace,hearts],[king,hearts],[queen,hearts],[jack,hearts],[10,hearts],[9,hearts],[8,hearts],[7,hearts],[6,hearts],[5,hearts],[4,hearts],
           [3,hearts],[2,hearts],
          [ace,diamonds],[king,diamonds],[queen,diamonds],[jack,diamonds],[10,diamonds],[9,diamonds],[8,diamonds],[7,diamonds],[6,diamonds],
           [5,diamonds],[4,diamonds],[3,diamonds],[2,diamonds]],


  (   N >0 ->
  play3(Deck,V,V2),

   %p1
   (   V = high_card ->
   H1 is H+1;
   H1 is H),
   (   V = two_pair ->
   TP1 is TP+1;
   TP1 is TP),
   (   V = full_house ->
   FH1 is FH+1;
   FH1 is FH),
   (   V =four_of_a_kind ->
   FK1 is FK+1;
   FK1 is FK),
   (   V = royal_flush ->
   RF1 is RF+1;
   RF1 is RF),

   (   V = pair ->
   P1 is P + 1;
   P1 is P),
   (   V = straight ->
   S1 is S + 1;
   S1 is S),
   (   V = straight_flush ->
   SF1 is SF + 1;
   SF1 is SF),
   (      V = flush ->
   F1 is F + 1;
   F1 is F),
   (   V = three_of_a_kind ->
   TK1 is TK + 1;
   TK1 is TK),

    %p2
   (   V2 = high_card ->
   H2 is H_2+1;
   H2 is H_2),
   (   V2 = two_pair ->
   TP2 is TP_2+1;
   TP2 is TP_2),
   (   V2 = full_house ->
   FH2 is FH_2+1;
   FH2 is FH_2),
   (   V2 =four_of_a_kind ->
   FK2 is FK_2+1;
   FK2 is FK_2),
   (   V2 = royal_flush ->
   RF2 is RF_2+1;
   RF2 is RF_2),

   (   V2 = pair ->
   P2 is P_2 + 1;
   P2 is P_2),
   (   V2 = straight ->
   S2 is S_2 + 1;
   S2 is S_2),
   (   V2 = straight_flush ->
   SF2 is SF_2 + 1;
   SF2 is SF_2),
   (      V2 = flush ->
   F2 is F_2 + 1;
   F2 is F_2),
   (   V2 = three_of_a_kind ->
   TK2 is TK_2 + 1;
   TK2 is TK_2),

   %print(C),

  N1 is N-1,
  NF1 is NF +1,
  %print(N1),

  t3_shuffle(N1,H1,P1,S1,SF1,F1,TK1,TP1,FK1,FH1,RF1,H2,P2,S2,SF2,F2,TK2,TP2,FK2,FH2,RF2,NF1);

  print(total_iterations),
      tab(1),
  print(NF),
      nl,
  H_C is (H/NF)*100,
  print(high_card_frequency),
      tab(1),
  print(H),
      tab(2),
  print(high_card_probability),
      tab(1),
  print(H_C),
      nl,
  Pair is (P/NF)*100,
  print(pair_frequency),
      tab(1),
  print(P),
      tab(2),
  print(pair_probability),
      tab(1),
  print(Pair),
      nl,
  Flush is (F/NF)*100,
  print(flush_frequency),
      tab(1),
  print(F),
      tab(2),
  print(flush_probability),
      tab(1),
  print(Flush),
      nl,
  S_T is (S/NF)*100,
  print(straight_frequency),
      tab(1),
  print(S),
      tab(2),
  print(straight_probability),
      tab(1),
  print(S_T),
      nl,
  T_K is (TK/NF)*100,
  print(three_of_a_kind_frequency),
      tab(1),
  print(TK),
      tab(2),
  print(three_of_a_kind_probability),
      tab(1),
  print(T_K),
      nl,

  T_P is (TP/NF)*100,
  print(two_pair_frequency),
      tab(1),
  print(TP),
      tab(2),
  print(two_pair_probability),
      tab(1),
  print(T_P),
      nl,
  F_H is (FH/NF)*100,
  print(full_house_frequency),
      tab(1),
  print(FH),
      tab(2),
  print(full_house_probability),
      tab(1),
  print(F_H),
      nl,
  F_K is (FK/NF)*100,
  print(four_of_a_kind_frequency),
      tab(1),
  print(FK),
      tab(2),
  print(four_of_a_kind_probability),
      tab(1),
  print(F_K),
      nl,
  R_F is (RF/NF)*100,
  print(royal_flush_frequency),
      tab(1),
  print(RF),
      tab(2),
  print(royal_flush_probability),
      tab(1),
  print(R_F),
      nl,

  S_F is (SF/NF)*100,
  print(straight_flush_frequency),
      tab(1),
  print(SF),
      tab(2),
  print(straight_flush_probability),
      tab(1),
  print(S_F)).





 %task1
shuffle(D,C,V) :-

  random_permutation( D ,Rdeck),

  take3(Rdeck,C),
  sort_hand(C, Sorted_Hand1),
  dt_hand(Sorted_Hand1,  V).

n_shuffle(N,H,P,S,SF,F,TK,NF) :-

  Deck = [[ace,clubs],[king,clubs],[queen,clubs],[jack,clubs],[10,clubs],[9,clubs],[8,clubs],[7,clubs],[6,clubs],[5,clubs],[4,clubs],[3,clubs],
           [2,clubs],
          [ace,spades],[king,spades],[queen,spades],[jack,spades],[10,spades],[9,spades],[8,spades],[7,spades],[6,spades],[5,spades],[4,spades],
           [3,spades],[2,spades],
          [ace,hearts],[king,hearts],[queen,hearts],[jack,hearts],[10,hearts],[9,hearts],[8,hearts],[7,hearts],[6,hearts],[5,hearts],[4,hearts],
           [3,hearts],[2,hearts],
          [ace,diamonds],[king,diamonds],[queen,diamonds],[jack,diamonds],[10,diamonds],[9,diamonds],[8,diamonds],[7,diamonds],[6,diamonds],
           [5,diamonds],[4,diamonds],[3,diamonds],[2,diamonds]],



  (   N >0 ->
  shuffle(Deck,C,V),

   %print(V),
   (   V = high_card ->
   H1 is H+1;
   H1 is H),
   (   V = pair ->
   P1 is P + 1;
   P1 is P),
   (   V = straight ->
   S1 is S + 1;
   S1 is S),
   (   V = straight_flush ->
   SF1 is SF + 1;
   SF1 is SF),
   (      V = flush ->
   F1 is F + 1;
   F1 is F),
   (   V = three_of_a_kind ->
   TK1 is TK + 1;
   TK1 is TK),
   %print(C),

  N1 is N-1,
  NF1 is NF +1,
  %print(N1),
  n_shuffle(N1,H1,P1,S1,SF1,F1,TK1,NF1);

  print(total_iterations),
      tab(1),
  print(NF),
      nl,
  H_C is (H/NF)*100,
  print(high_card_frequency),
      tab(1),
  print(H),
      tab(2),
  print(high_card_probability),
      tab(1),
  print(H_C),
      nl,
  Pair is (P/NF)*100,
  print(pair_frequency),
      tab(1),
  print(P),
      tab(2),
  print(pair_probability),
      tab(1),
  print(Pair),
      nl,
  Flush is (F/NF)*100,
  print(flush_frequency),
      tab(1),
  print(F),
      tab(2),
  print(flush_probability),
      tab(1),
  print(Flush),
      nl,
  S_T is (S/NF)*100,
  print(straight_frequency),
      tab(1),
  print(S),
      tab(2),
  print(straight_probability),
      tab(1),
  print(S_T),
      nl,
  T_K is (TK/NF)*100,
  print(three_of_a_kind_frequency),
      tab(1),
  print(TK),
      tab(2),
  print(three_of_a_kind_probability),
      tab(1),
  print(T_K),
      nl,
  S_F is (SF/NF)*100,
  print(straight_flush_frequency),
      tab(1),
  print(SF),
      tab(2),
  print(straight_flush_probability),
      tab(1),
  print(S_F)).







three_shuffle :-
  n_shuffle(10,0,0,0,0,0,0,0),
  nl,
  n_shuffle(100,0,0,0,0,0,0,0),
  nl,
  n_shuffle(1000,0,0,0,0,0,0,0),
  nl,
  n_shuffle(10000,0,0,0,0,0,0,0),
  nl,
  n_shuffle(100000,0,0,0,0,0,0,0).


my_shuffle(X) :-
  n_shuffle(X,0,0,0,0,0,0,0).

take3([X,Y,Z|_],D):-
  D= [X,Y,Z].


%task1end



shuffle2 :-



  Symbol = [spades,clubs,diamonds,hearts],
  Value = [ace,king,queen,jack,10,9,8,7,6,5,4,3,2],
    pick(Symbol,Value,3,[],L),
  write(L),




  sort_hand(L, Sorted_Hand1),
  dt_hand(Sorted_Hand1,  V),
  print(V).


shuffle5(D,C,V) :-



  random_permutation( D ,Rdeck),

  take5(Rdeck,C),
  sort_hand(C, Sorted_Hand1),
  determine_hand(Sorted_Hand1,  V).


pick(S,V,N,L2):-
  (   N>0->

  random_permutation(S,NS),
  random_permutation(V,NV),
  [H1|_] = NS,
  [H2|_] = NV,
  (   member([H2,H1],L2) ->
  pick(S,V,N,L2,L2);!),
  append([[H2,H1]],L2,FL),

  N1 is N-1,

  pick(S,V,N1,FL);
  !).









take5([A,B,C,D,E|_],Y):-
  Y=[A,B,C,D,E].

five_shuffle(X):-
  n_shuffle5(X,0,0,0,0,0,0,0,0,0,0,0).

n_shuffle5(N,H,P,S,SF,F,TK,TP,FK,FH,RF,NF) :-

  Deck = [[ace,clubs],[king,clubs],[queen,clubs],[jack,clubs],[10,clubs],[9,clubs],[8,clubs],[7,clubs],[6,clubs],[5,clubs],[4,clubs],[3,clubs],
           [2,clubs],
          [ace,spades],[king,spades],[queen,spades],[jack,spades],[10,spades],[9,spades],[8,spades],[7,spades],[6,spades],[5,spades],[4,spades],
           [3,spades],[2,spades],
          [ace,hearts],[king,hearts],[queen,hearts],[jack,hearts],[10,hearts],[9,hearts],[8,hearts],[7,hearts],[6,hearts],[5,hearts],[4,hearts],
           [3,hearts],[2,hearts],
          [ace,diamonds],[king,diamonds],[queen,diamonds],[jack,diamonds],[10,diamonds],[9,diamonds],[8,diamonds],[7,diamonds],[6,diamonds],
           [5,diamonds],[4,diamonds],[3,diamonds],[2,diamonds]],



  (   N >0 ->
  shuffle5(Deck,C,V),

   %print(V),
   (   V = high_card ->
   H1 is H+1;
   H1 is H),
   (   V = two_pair ->
   TP1 is TP+1;
   TP1 is TP),
   (   V = full_house ->
   FH1 is FH+1;
   FH1 is FH),
   (   V =four_of_a_kind ->
   FK1 is FK+1;
   FK1 is FK),
   (   V = royal_flush ->
   RF1 is RF+1;
   RF1 is RF),

   (   V = pair ->
   P1 is P + 1;
   P1 is P),
   (   V = straight ->
   S1 is S + 1;
   S1 is S),
   (   V = straight_flush ->
   SF1 is SF + 1;
   SF1 is SF),
   (      V = flush ->
   F1 is F + 1;
   F1 is F),
   (   V = three_of_a_kind ->
   TK1 is TK + 1;
   TK1 is TK),
   %print(C),

  N1 is N-1,
  NF1 is NF +1,
  %print(N1),

  n_shuffle5(N1,H1,P1,S1,SF1,F1,TK1,TP1,FK1,FH1,RF1,NF1);

  print(total_iterations),
      tab(1),
  print(NF),
      nl,
  H_C is (H/NF)*100,
  print(high_card_frequency),
      tab(1),
  print(H),
      tab(2),
  print(high_card_probability),
      tab(1),
  print(H_C),
      nl,
  Pair is (P/NF)*100,
  print(pair_frequency),
      tab(1),
  print(P),
      tab(2),
  print(pair_probability),
      tab(1),
  print(Pair),
      nl,
  Flush is (F/NF)*100,
  print(flush_frequency),
      tab(1),
  print(F),
      tab(2),
  print(flush_probability),
      tab(1),
  print(Flush),
      nl,
  S_T is (S/NF)*100,
  print(straight_frequency),
      tab(1),
  print(S),
      tab(2),
  print(straight_probability),
      tab(1),
  print(S_T),
      nl,
  T_K is (TK/NF)*100,
  print(three_of_a_kind_frequency),
      tab(1),
  print(TK),
      tab(2),
  print(three_of_a_kind_probability),
      tab(1),
  print(T_K),
      nl,

  T_P is (TP/NF)*100,
  print(two_pair_frequency),
      tab(1),
  print(TP),
      tab(2),
  print(two_pair_probability),
      tab(1),
  print(T_P),
      nl,
  F_H is (FH/NF)*100,
  print(full_house_frequency),
      tab(1),
  print(FH),
      tab(2),
  print(full_house_probability),
      tab(1),
  print(F_H),
      nl,
  F_K is (FK/NF)*100,
  print(four_of_a_kind_frequency),
      tab(1),
  print(FK),
      tab(2),
  print(four_of_a_kind_probability),
      tab(1),
  print(F_K),
      nl,
  R_F is (RF/NF)*100,
  print(royal_flush_frequency),
      tab(1),
  print(RF),
      tab(2),
  print(royal_flush_probability),
      tab(1),
  print(R_F),
      nl,

  S_F is (SF/NF)*100,
  print(straight_flush_frequency),
      tab(1),
  print(SF),
      tab(2),
  print(straight_flush_probability),
      tab(1),
  print(S_F)).



*/


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Playing the game.
winner(H1, H2, Winner) :-
  sort_hand(H1, Sorted_Hand1),
  sort_hand(H2, Sorted_Hand2),
  determine_hand(Sorted_Hand1,  X1),
  determine_hand(Sorted_Hand2,  X2),
  beats(X1, X2, Verdict),
  (Verdict = X1, Winner = H1;
   Verdict = X2, Winner = H2;
   Verdict = tie, tiebreak(X1, Sorted_Hand1, Sorted_Hand2, SortedWinner),
   (SortedWinner = left, Winner = H1 ;
    SortedWinner = right, Winner = H2)).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Tiebreaks
tiebreak(straight_flush, H1, H2, Winner)  :- higher_last_card(H1, H2, Winner).
tiebreak(four_of_a_kind, H1, H2, Winner)  :- higher_middle_card(H1, H2, Winner).
tiebreak(full_house, H1, H2, Winner)      :- higher_middle_card(H1, H2, Winner).
tiebreak(flush, H1, H2, Winner)           :- tiebreak(high_card, H1, H2, Winner).
tiebreak(straight, H1, H2, Winner)        :- higher_last_card(H1, H2, Winner).
tiebreak(three_of_a_kind, H1, H2, Winner) :- higher_middle_card(H1, H2, Winner).

tiebreak(two_pair, H1, H2, Winner) :-
  isolate_pairs(H1, [HighCard1,_], [LowCard1,_], Last1),
  isolate_pairs(H2, [HighCard2,_], [LowCard2,_], Last2),
  (beats_with_hand(H1, HighCard1, H2, HighCard2, Winner),
   Winner \= tie;
   beats_with_hand(H1, LowCard1, H2, LowCard2, Winner),
   Winner \= tie;
   beats_with_hand(H1, Last1, H2, Last2, Winner)).

tiebreak(pair, H1, H2, Winner) :-
  isolate_pair(H1, [PairCard1,_], Rst1),
  isolate_pair(H2, [PairCard2,_], Rst2),
  (beats_with_hand(H1, PairCard1, H2, PairCard2, Winner), Winner \= tie ;
   tiebreak(high_card, Rst1, Rst2, Winner)).

tiebreak(high_card, H1, H2, X) :-
  reverse(H1, RevH1),
  reverse(H2, RevH2),
  highest_card_chain(RevH1, RevH2, X).




beats_with_hand(H1, C1, H2, C2, X) :-
  beats(C1, C2, C1), X = left ;
  beats(C1, C2, C2), X = right ;
  X = tie.

% Really ugly.  How to better do this?
isolate_pairs(Hand, High_Pair, Low_Pair, Last) :-
  [[V1,S1],[V2,S2],[V3,S3],[V4,S4],[V5,S5]] = Hand,
  (V5 = V4, High_Pair = [[V4,S4],[V5,S5]],
    (V3 = V2, Low_Pair = [[V3,S3],[V2,S2]], Last = [V1,S1] ;
     V1 = V2, Low_Pair = [[V1,S1],[V2,S2]], Last = [V3,S3])) ;
  (Low_Pair = [[V1,S1],[V2,S2]],
   High_Pair = [[V3,S3],[V4,S4]],
   Last = [V5,S5]).

isolate_pair(Hand, Pair, Rst) :-
  [[V1,S1],[V2,S2],[V3,S3],[V4,S4],[V5,S5]] = Hand,
  (V1 = V2, Pair = [[V1,S1],[V2,S2]], Rst = [[V3,S3],[V4,S4],[V5,S5]] ;
   V2 = V3, Pair = [[V3,S3],[V2,S2]], Rst = [[V1,S1],[V4,S4],[V5,S5]] ;
   V4 = V3, Pair = [[V3,S3],[V4,S4]], Rst = [[V1,S1],[V2,S2],[V5,S5]] ;
   V4 = V5, Pair = [[V5,S5],[V4,S4]], Rst = [[V1,S1],[V2,S2],[V3,S3]]).


highest_card_chain([H1|T1], [H2|T2], X) :-
  beats(H1,H2,Verdict),
  (Verdict = H1, X = left ;
   Verdict = H2, X = right ;
   Verdict = tie, highest_card_chain(T1,T2,X)).

higher_last_card(H1,H2,Winner) :-
  H1 = [_,_,_,_,[V1,_]],
  H2 = [_,_,_,_,[V2,_]],
  beats(V1,V2,Higher),
  (Higher = V1, Winner = left ;
   Higher = V2, Winner = right).

higher_middle_card(H1, H2, Winner) :-
  H1 = [_,_,[V1,_],_,_],
  H2 = [_,_,[V2,_],_,_],
  beats(V1,V2,Higher),
  (Higher = V1, Winner = left;
   Higher = V2, Winner = right).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Hand determination
determine_hand([[10,X],[jack,X],[queen,X],[king,X],[ace,X]], royal_flush).

determine_hand([[A,X],[B,X],[C,X],[D,X],[E,X]], straight_flush) :-
  successor(E,D), successor(D,C), successor(C,B), successor(B,A).

determine_hand([[C,_],[A,_],[A,_],[A,_],[B,_]], four_of_a_kind) :-
  C = A ; B = A.

determine_hand([[A,_],[B,_],[C,_],[D,_],[E,_]], full_house) :-
  A = B, D = E, (C = D ; C = B).

determine_hand([[_,X],[_,X],[_,X],[_,X],[_,X]], flush).

determine_hand([[A,_],[B,_],[C,_],[D,_],[E,_]], straight) :-
  successor(E,D), successor(D,C), successor(C,B), successor(B,A).

determine_hand([[A,_],[B,_],[C,_],[D,_],[E,_]], three_of_a_kind) :-
  (A = B, B = C); (B = C, C = D); (C = D, D = E).

determine_hand([[A,_],[A,_],[B,_],[B,_],[_,_]], two_pair).
determine_hand([[_,_],[A,_],[A,_],[B,_],[B,_]], two_pair).
determine_hand([[A,_],[A,_],[_,_],[B,_],[B,_]], two_pair).

determine_hand([[A,_],[B,_],[C,_],[D,_],[E,_]], pair) :-
  A = B; B = C; C = D; D = E.

determine_hand(_,high_card).

%new for Three card game

dt_hand([[A,X],[B,X],[C,X]], straight_flush) :-
  successor(C,B), successor(B,A),!.

dt_hand([[A,_],[B,_],[C,_]],three_of_a_kind ):-
  ( A = B,B = C),!.

dt_hand([[A,_],[B,_],[C,_]], straight) :-
   successor(C,B), successor(B,A),!.

dt_hand([[_,X],[_,X],[_,X]],flush).


dt_hand([[A,_],[B,_],[C,_]], pair) :-
  A = B; B = C,!.





dt_hand(_,high_card).



prob(X,P):-
  (   X =high_card  ->
  P = 74.39;
  X =pair  ->
  P = 16.94;
  X =flush ->
  P = 4.96;
  X =straight ->
  P = 3.26;
  X =three_of_a_kind ->
  P = 0.24;
  X =straight_flush->
  P = 0.22
  ).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Hand sorting (for easier pattern matching).
sort_hand([], []).
sort_hand([H|T], Sorted) :-
  filter_by_high_card(H,T,Lower,Higher),
  sort_hand(Lower,SortedLower),
  sort_hand(Higher,SortedHigher),
  append(SortedLower, [H|SortedHigher], Sorted).


filter_by_high_card(_, [], [], []).
filter_by_high_card(Pivot, [H|T], [H|Lower], Higher) :-
  beats(Pivot,H,Z),
  (Z = Pivot ; Z = tie),
  filter_by_high_card(Pivot, T, Lower, Higher).
filter_by_high_card(Pivot, [H|T], Lower, [H|Higher]) :-
  beats(Pivot,H,H),
  filter_by_high_card(Pivot, T, Lower, Higher).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Card and Hand Precedence
beats([V,_],[V,_],tie).
beats([V1,S],[V2,_],[V1,S]) :- value_greater_than(V1,V2).
beats([V1,_],[V2,S],[V2,S]) :- value_greater_than(V2,V1).

beats(X,X,tie).
beats(X,Y,X) :- value_greater_than(X,Y).
beats(X,Y,Y) :- value_greater_than(Y,X).

successor(royal_flush, straight_flush).   successor(straigh_flush, four_of_a_kind).
successor(four_of_a_kind, full_house).    successor(full_house, flush).
successor(flush, straight).               successor(straight, three_of_a_kind).
successor(three_of_a_kind, two_pair).     successor(two_pair, pair).
successor(pair, high_card).

successor(ace,king).     successor(king,queen).   successor(queen,jack).
successor(jack,10).      successor(10,9).         successor(9,8).
successor(8,7).          successor(7,6).          successor(6,5).
successor(5,4).          successor(4,3).          successor(3,2).

value_greater_than(X,Y) :-
  successor(X,P),
  (Y = P;
  value_greater_than(P,Y)).


