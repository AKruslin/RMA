part of 'dice_bloc.dart';

@immutable
abstract class DiceEvent {}

class RollDice extends DiceEvent {}

class ComboFound extends DiceEvent {}
