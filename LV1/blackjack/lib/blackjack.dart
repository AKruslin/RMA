class Player {
  int _cardValue = 0;
  bool _stoppedDrawingCards = false;
  void drawCard(List<int> cardDeck) {
    var newCard = cardDeck.removeLast();
    calculateCardValue(newCard);
  }

  void stopDrawingCards() {
    _stoppedDrawingCards = true;
  }

  void calculateCardValue(int newCardValue) {
    _cardValue += newCardValue;
  }

  int getPlayerCardValue() {
    return _cardValue;
  }

  bool getPlayersStoppedDrawing() {
    return _stoppedDrawingCards;
  }
}

class BlackJackGame {
  Player playerOne;
  Player playerTwo;

  BlackJackGame(Player playerOne, Player playerTwo) {
    this.playerOne = playerOne;
    this.playerTwo = playerTwo;
    blackJackCardDeck.shuffle();
  }

  //2-9 value cards, Jack, Queen and King as 10, Ace as 11
  List<int> blackJackCardDeck = [
    10,
    10,
    10,
    11,
    5,
    3,
    6,
    8,
    7,
    2,
    4,
    9,
    10,
    10,
    10,
    11,
    5,
    3,
    6,
    8,
    7,
    2,
    4,
    9,
    10,
    10,
    10,
    11,
    5,
    3,
    6,
    8,
    7,
    2,
    4,
    9,
    10,
    10,
    10,
    11,
    5,
    3,
    6,
    8,
    7,
    2,
    4,
    9
  ];

  bool hasGameEnded = false;

  String checkPlayerCards() {
    var playerCardValue = playerOne.getPlayerCardValue();
    var robotCardValue = playerTwo.getPlayerCardValue();
    if (playerCardValue > 21) {
      hasGameEnded = true;
      return 'Robot Wins!';
    }
    if (robotCardValue > 21) {
      hasGameEnded = true;

      return 'Player Wins!';
    }
    if (playerOne.getPlayersStoppedDrawing() == true &&
        playerTwo.getPlayersStoppedDrawing() == true) {
      hasGameEnded = true;
      if (playerCardValue > robotCardValue) {
        return 'Player Wins stop';
      } else {
        return 'Robot Wins stop';
      }
    }
    return '';
  }

  String showScore() {
    var playerCardValue = playerOne.getPlayerCardValue();
    var robotCardValue = playerTwo.getPlayerCardValue();
    return 'Player: ' +
        playerCardValue.toString() +
        ' Robot: ' +
        robotCardValue.toString();
  }
}
