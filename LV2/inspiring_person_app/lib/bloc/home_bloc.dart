import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:inspiring_person_app/personRepository.dart';

part 'home_event.dart';
part 'home_state.dart';

var repository = PersonRepository();

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial(repository.inspiringPeopleList));

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is AddPerson) {
      repository.addInspiringPerson(event.newPerson);
      yield ListUpdated(repository.inspiringPeopleList);
    }
  }
}
