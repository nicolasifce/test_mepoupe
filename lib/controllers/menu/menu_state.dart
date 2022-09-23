part of 'menu_cubit.dart';

@immutable
abstract class MenuState {}

class MenuInitial extends MenuState {}

class LoadedIndex extends MenuState {
  final int index;
  List<Object?> get props => [index];
  LoadedIndex({required this.index});
}
