part of 'favorites_cubit.dart';

@immutable
abstract class FavoritesState {}

class FavoritesInitial extends FavoritesState {}

class FavoriteLoading extends FavoritesState {}

class FavoriteLoaded extends FavoritesState {
  final String message;
  List<Object?> get props => [message];
  FavoriteLoaded({required this.message});
}

class FavoriteError extends FavoritesState {
  final String message;
  List<Object?> get props => [message];
  FavoriteError({required this.message});
}

class FavoriteLoadingList extends FavoritesState {}

class FavoriteLoadedList extends FavoritesState {
  final List<CepModel> cepModelList;
  List<Object?> get props => [cepModelList];
  FavoriteLoadedList({required this.cepModelList});
}

class FavoriteErrorList extends FavoritesState {
  final String message;
  List<Object?> get props => [message];
  FavoriteErrorList({required this.message});
}

class FavoriteErrorRemove extends FavoritesState {
  final String message;
  List<Object?> get props => [message];
  FavoriteErrorRemove({required this.message});
}

class FavoriteLoadedRemove extends FavoritesState {
  final String message;
  List<Object?> get props => [message];
  FavoriteLoadedRemove({required this.message});
}
