import 'package:cubit_login_sample/core/models/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part "login_state.dart";

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(SingInState());

  /// TODO aqui passar parametros referente aos dados de autenticacao
  void login() async {
    emit(LoadingState());
    await Future.delayed(const Duration(seconds: 1));
    // emit(AuthenticationFailed());
    ///TODO aqui carregar o usuario retornado, passa-lo no estado, em seguida carrega-lo no
    /// session cubit
    emit(AuthenticationSuccess());
  }
}