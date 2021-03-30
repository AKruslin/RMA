import 'dart:io';

import 'package:blackjack/blackjack.dart';

void main(List<String> arguments) {
  var human = Player();
  var robot = Player();
  var game = BlackJackGame(human, robot);
  var blackJackCardDeck = game.blackJackCardDeck;
  print('Start game');
  while (!game.hasGameEnded) {
    if (human.getPlayersStoppedDrawing() != true) {
      print('Press 1 to draw card or anything else to pass:');
      var line = stdin.readLineSync();
      if (line == '1') {
        human.drawCard(blackJackCardDeck);
      } else {
        human.stopDrawingCards();
      }
    }
    if (robot.getPlayerCardValue() < 17) {
      robot.drawCard(blackJackCardDeck);
    } else {
      robot.stopDrawingCards();
    }
    print(game.showScore());
    print(game.checkPlayerCards());
  }
  print('End of the Game...');
}
