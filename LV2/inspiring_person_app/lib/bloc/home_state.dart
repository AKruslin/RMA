part of 'home_bloc.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {
  List<InspiringPerson> list;
  HomeInitial(List<InspiringPerson> listOfInspiringPeople) {
    list = listOfInspiringPeople;
  }
}

class ListUpdated extends HomeState {
  List<InspiringPerson> list;
  ListUpdated(List<InspiringPerson> listOfInspiringPeople) {
    list = listOfInspiringPeople;
  }
}
