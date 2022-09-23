import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_mepoupe/models/cep.model.dart';

import '../../shared/services/db/db.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesInitial());

  final FavoritesDb _sharedClass = FavoritesDb();

  setFavorite({required CepModel cep}) async {
    try {
      emit(FavoriteLoading());
      final response = await _sharedClass.setListFavorites(cep: cep);
      emit(FavoriteLoaded(message: response));
    } catch (e) {
      emit(FavoriteError(message: e.toString()));
    }
  }

  getListFavorite() async {
    try {
      emit(FavoriteLoadingList());
      await Future.delayed(const Duration(milliseconds: 200));
      final response = await _sharedClass.getListFavorites();
      emit(FavoriteLoadedList(cepModelList: response));
    } catch (e) {
      emit(FavoriteErrorList(message: e.toString()));
    }
  }

  removeFavorite({required int index}) async {
    try {
      final response = await _sharedClass.removeListFavorites(index: index);
      emit(FavoriteLoadedRemove(message: response));
    } catch (e) {
      emit(FavoriteError(message: e.toString()));
    }
  }
}
