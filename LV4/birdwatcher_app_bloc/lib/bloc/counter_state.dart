part of 'counter_bloc.dart';

@immutable
abstract class CounterState {
  final Color currentColor;
  final int counterValue;

  CounterState(this.currentColor, this.counterValue);
}

class CounterInitial extends CounterState {
  CounterInitial(Color currentColor, int counterValue)
      : super(currentColor, counterValue);
}

class CounterIncreased extends CounterState {
  CounterIncreased(Color currentColor, int counterValue)
      : super(currentColor, counterValue);
}
