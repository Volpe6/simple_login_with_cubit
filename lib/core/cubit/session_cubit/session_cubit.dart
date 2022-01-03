import 'package:cubit_login_sample/core/models/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part "session_state.dart";

class SessionCubit extends Cubit<SessionState> {
  SessionCubit() : super(SessionState.init());
  
  void setUser(User user) {
    emit(state.copyWith(user: user));
  }

}