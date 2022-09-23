part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoadedCep extends HomeState {
  final int ceps;
  List<Object?> get props => [ceps];
  HomeLoadedCep({required this.ceps});
}

class HomeErrorCep extends HomeState {
  final String message;
  List<Object?> get props => [message];
  HomeErrorCep({required this.message});
}
