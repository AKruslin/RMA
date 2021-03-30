import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'dice_event.dart';
part 'dice_state.dart';

class DiceBloc extends Bloc<DiceEvent, DiceState> {
  DiceBloc() : super(DiceInitial());
  List<int> diceValues = [0, 0, 0, 0, 0];
  List<bool> lockedDices = [false, false, false, false, false];
  int numberOfRoles = 0;
  @override
  Stream<DiceState> mapEventToState(
    DiceEvent event,
  ) async* {
    if (event is RollDice) {
      if (numberOfRoles < 3) {
        numberOfRoles++;
        rollDices();
        yield (DiceReRolled(rolledDices: diceValues));
        yield (CheckCombo());
      } else {
        resetDices();
        yield (CheckCombo());
      }
    }
    if (event is ComboFound) {
      resetDices();
      yield (DiceReRolled(rolledDices: diceValues));
    }
  }

  void resetDices() {
    numberOfRoles = 0;
    diceValues = [0, 0, 0, 0, 0];
    lockedDices = [false, false, false, false, false];
  }

  void rollDices() {
    Random rnd = new Random();
    int min = 1, max = 7;

    for (var i = 0; i < diceValues.length; i++) {
      int randomValue = min + rnd.nextInt(max - min);
      if (!lockedDices[i]) {
        diceValues[i] = randomValue;
      }
    }
  }
}
