# Poker_Game
 3_card,5_card game implemented, using prolog

First, a deck of 52 cards is shuffled. The dealer will give 3 cards to each player. Each player checks the three cards given and decides to stay of not. At the end, each player discloses one's own cards to decide who is the winner. We will consider the betting later. The betting is done first before the cards are given and then after the cards are given to players.   

A2card1.pl : 
3 Card poker
Design and implement a card game of one player with 3-card poker for the following steps in experiment: 
(1) to shuffle a deck of cards (or to order a deck of cards in random order) 
(2) to deal the cards to the player to have all the cards at once
(3) to display the cards of the player
(4) to show the hand (rank) of the cards
(5) to find and list the probability of the hand (rank) of the cards, from the table (shown below).
(6) and to repeat this process of steps (1) to (5) for N times.

Program repeats N times to generate a statistical summary (the probability distribution of each hand using simulation). 

Run these commands to get the output,A log file is provided (A2card1log.txt) for the outputs. 
three_shuffle. 
my_shuffle(22100). (can use any number of iterations, instead of 22100) 

A2card2.pl: 
5 Card poker
Design and implement a card game of one player with 5-card poker for the following steps in experiment: 
(1) to shuffle a deck of cards (or to order a deck of cards in random order) 
(2) to deal all the cards to the player at once
(3) to display the cards of the player
(4) to show the hand (rank) of the cards
(5) to find and list the probability of the hand (rank) of the cards
(6) and to repeat this process of steps (1) to (5) for N times.

Program repeats N times to generate a statistical summary (the probability distribution of each hand using simulation). 
Run these commands to get the output,Multiple log files are provided for the different iterations of the outputs.
five_shuffle(10).
five_shuffle(100).
five_shuffle(1000).
five_shuffle(10000).
five_shuffle(100000).
five_shuffle(1000000).

A2card3.pl: 
5-Card Poker.
Design and implement a card game of X players (where X = 2) with the following steps in experiment:
(1) to shuffle a deck of cards (or to order a deck of cards in random order) 
(2) to deal one card to each player at a time, for all the cards to each player at the end of the deal
(3) to display all the cards of each player
(4) to show the hand (rank) of the cards of each player
(5) to determine the winner
(6) and to repeat this process of steps (1) to (5) for N times.

The Program repeats with X=2 players for N times (where N is 100, 1000, 10000) to generate a statistical summary (the probability distribution of each hand of each player using simulation). 

The program will compute to complete the following tables (Table 3-1 and Table 3-2). 
Table3-1 is a table of Hand Rank of Player1, observed from simulation. 
Table3-2 is a table of Player1 chance of (win, loss, tie) given Hand Rank of Player1 versus Player2 from simulation.

For example, Player1 who has Flush wins this time over Player2 who has Pair. Your program is to keep the frequency of each hand to win or lose. After the program tries 100 times for N=100, the program computes the chance of a hand (e.g., Straight) to win or lose.  

Run these commands to get the output,A log file is provided for the commands and its outputs.
n_task3.

A2Card4.pl: 
Design and implement a card game of X players (where X = 2) with the following steps in experiment:
(1) to shuffle a deck of cards (or to order a deck of cards in random order) 
(2) to deal one card to each player at a time, and all the cards to each player at the end of the deal.
(3) to compute and predict the chance of (1) win or (2) loss for each player with the cards
(4) to display the cards of each player
(5) to show the hand (rank) of the cards of each player
(6) to determine the winner
(7) to check the prediction in step (3) is good or not (that is, precision rate).
and
(8) to repeat this process of steps (1) to (7) for N times.

(9) After the first successful run of these steps, can you improve the precision rate to (a) 80% or even to (b) 95% or better? 

The program repeats N times to generate a statistical summary (the probability distribution of each hand using simulation). 


Run these commands to get the output,A log file (A2card4log2.txt) is provided for the commands and its outputs.
n_task4.

n_task4 will output the confusion matrix (TP, TN, FP ,FN) of all the ranks with the precision rate as the last row.


