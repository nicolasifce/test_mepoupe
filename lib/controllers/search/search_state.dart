part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final CepModel cep;
  List<Object?> get props => [cep];
  SearchLoaded({required this.cep});
}

class SearchError extends SearchState {
  final String message;
  List<Object?> get props => [message];
  SearchError({required this.message});
}
