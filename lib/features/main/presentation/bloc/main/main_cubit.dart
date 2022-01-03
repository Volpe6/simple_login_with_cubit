import 'package:flutter_bloc/flutter_bloc.dart';

part "main_state.dart";

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(SearchStep());

  void search() {
    emit(SearchStep());
  }

  void add() {
    emit(AddStep());
  }
}