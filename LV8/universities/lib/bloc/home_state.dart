part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class FetchingData extends HomeState{}

class DataFetched extends HomeState{}

class Error extends HomeState{}