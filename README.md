# Ruby on Rails code challenge

## Using this Repository
Feel free to open a branch and change whatever you need to create a good interview experience.
This README is here to guide you in interviewing an engineer for a Ruby on Rails position,
I left suggestions on possible endpoints that could be built, as well as the business rules that could be implemented
(in this case, they're simply a concise version of Texas Hold 'em rules).

A poker game was chosen due to all the rules being analogue to business requirements that clients might expect.
The interviewer should select a few endpoints to implement, but be flexible and change things depending on the pace of the interview.

## Poker game API
This API should have multiple endpoints related to a poker game, some suggestions (somewhat in order of difficulty):
Pick one or two of them, maybe create a test that should be passing, and use it to evaluate the candidate's skill on RoR
- Endpoint for pulling a new card
- Endpoint for creating bets
- Endpoint for creating users
- Endpoint for scoring a hand
- Endpoint for pulling two hands and a set of visible/hidden cards on the table
- Endpoint for comparing two hands and determining the winner
- Endpoint for scoring two hands, determining the winner, and giving them the pot
- Endpoint for starting a game with a group of users, creating a persistent game session that can be updated each round

## Interview process and difficulty
- The interview should start with the API already having one or two endpoints as examples
- It should start with basic tasks, and progress to more advanced ones
- The goal is for the interviewee to feel at ease and not overwhelm him or her with a giant amount of requirements
- Let the interviewee go as far as he or her is able to. They should be evaluated on what they were able to deliver

## What should be evaluated
- Code quality
- Tests, TDD/BDD
- Refactoring & application of patterns
- Separation of Concerns, SOLID
- How far did they get

# API Details & some rules

## Cards, hands and rules
This are the basic rules of a poker game. The interviewee is not expected to implement even half of these, but use them as example requirements
- Each card has a suite - Clubs, Diamonds, Hearts or Spades - and a value - 2..10 + Jack, Queen, King or Ace.
- Suites have no scores, but values do: Ace is the highest value, while two is the lowest
- Each player has two cards, and the table has five cards - dealt in random from a 52 card deck
- The table starts with 3 cards visible, and two hidden. Each round, players get to bet more chips, and a card from the table is revealed
- Players bet in order: player 1 starts betting on round 1, followed by player 2 and so on. On round two, player 2 starts, followed by 3 and 4
- This goes on until the last player starts, and at the next round, player 1 starts again
- If a player makes a bet, all other players must equal or surpass that bet. A card is only revealed after all players have betted the same amount of chips
- A player may, at their turn, fold: they effectively leave during that game, forfeiting what they've betted but not needing to bet any longer
- A player that folded returns at the next dealt hand
- When all of table cards are revealed, the players have one last round to bet, after which they reveal their own cards
- The player with the best hand (see below) wins the pot - the sum of all betted chips
- In the rare occasion that two or more players have the same exact score, they split the pot

- Cards are scored based on rank. There are several ranks, each surpassing the previous
- For this example, let's only consider a few sets:

- High card: default rank, occurs when no other ranks were met. Scored simply based on the highest card on the players hand
- Pair: two cards with the same value, even if belonging to different suites
- Flush: five cards that are all of the same suite
- Full house: three cards of one value, plus two cards of another

- Full house beats Flush, which beats Pair, which beats High card
