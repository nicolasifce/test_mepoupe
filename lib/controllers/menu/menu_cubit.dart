import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit() : super(MenuInitial());

  int indiceAtual = 0;
  void onTabTapped(int index) {
    emit(LoadedIndex(index: index));
    indiceAtual = index;
  }
}
