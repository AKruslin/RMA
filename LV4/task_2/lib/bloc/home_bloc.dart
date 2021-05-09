import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_2/model/user.dart';
import 'package:http/http.dart' as http;

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial());
  List<User> usersList = [];

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is FetchButtonPressed) {
      yield FetchingData();
      //add wrong /path to cause error, example /userss
      var url = Uri.https('5e510330f2c0d300147c034c.mockapi.io', '/users');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body) as List<dynamic>;
        jsonResponse.forEach((user) {
          usersList.add(User.fromMap(user));
        });
        yield DataFetched();
      } else {
        print('Request failed with status: ${response.statusCode}.');
        yield Error();
      }
    }
  }
}
