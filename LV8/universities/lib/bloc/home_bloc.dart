import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:universities/model/university.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial());
  List<University> universityList = [];

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is FetchButtonPressed) {
      yield FetchingData();
      //add wrong /path to cause error, example /ssearch
      //http://universities.hipolabs.com/search?country=croatia
      var url = Uri.http(
          'universities.hipolabs.com', '/search', {"country": "croatia"});
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body) as List<dynamic>;
        jsonResponse.forEach((university) {
          universityList.add(University.fromMap(university));
        });
        yield DataFetched();
      } else {
        print('Request failed with status: ${response.statusCode}.');
        yield Error();
      }
    }
  }
}
