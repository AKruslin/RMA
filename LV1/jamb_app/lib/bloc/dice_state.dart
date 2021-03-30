part of 'dice_bloc.dart';

@immutable
abstract class DiceState {}

class DiceInitial extends DiceState {}

class DiceReRolled extends DiceState {
  final List<int> rolledDices;
  DiceReRolled({
    this.rolledDices,
  });
}

class CheckCombo extends DiceState {}
