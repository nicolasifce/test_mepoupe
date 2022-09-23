import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_mepoupe/shared/services/db/ceps.db.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  final CepsDb _sharedClass = CepsDb();

  getNumberCeps() async {
    try {
      emit(HomeLoading());
      final response = await _sharedClass.getCepsNumbers();

      emit(HomeLoadedCep(ceps: response));
    } catch (e) {
      emit(HomeErrorCep(message: e.toString()));
    }
  }

  setNumerCeps() {
    _sharedClass.addCepsNumber();
  }
}
