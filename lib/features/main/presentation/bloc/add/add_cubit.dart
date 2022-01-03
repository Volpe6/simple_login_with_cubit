import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_state.dart';

class AddCubit extends Cubit<AddState> {
  AddCubit() : super(AddState.init());
  
  void onChangeTitle(val) {
    emit(state.copyWith(title: val));
  }

  void onChangeSubtitle(val) {
    emit(state.copyWith(subtitle: val));
  }

  void onChangeContent(val) {
    emit(state.copyWith(content: val));
  }
}