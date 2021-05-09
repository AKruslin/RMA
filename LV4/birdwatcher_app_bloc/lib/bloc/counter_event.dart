part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent {}

class UpdateCounter extends CounterEvent {
  final Color newColor;

  UpdateCounter(this.newColor);
}

class ResetCounter extends CounterEvent {}

class LoadData extends CounterEvent {}
