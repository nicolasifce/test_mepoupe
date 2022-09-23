import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_mepoupe/apis/search.api.dart';
import 'package:test_mepoupe/models/cep.model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  searchCep({required String cep}) async {
    try {
      emit(SearchLoading());
      final cepUser = await SearchApi().getSearch(cep: cep);

      emit(SearchLoaded(cep: cepUser));
    } catch (e) {
      emit(SearchError(message: e.toString()));
    }
  }
}
