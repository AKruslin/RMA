part of 'home_bloc.dart';

abstract class HomeEvent {}

class AddPerson extends HomeEvent {
  InspiringPerson newPerson;
  AddPerson(InspiringPerson person) {
    newPerson = person;
  }
}
