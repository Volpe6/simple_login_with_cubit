part of "login_cubit.dart";

abstract class LoginState {
  User? user;
}

class SingInState extends LoginState {}

class ErrorState extends LoginState {}

class AuthenticationFailed extends LoginState {}

class AuthenticationSuccess extends LoginState {
  @override
  get user {
    return User(id: 0, name: 'Fulano', email: 'fulano@email.com');
  }
}

class LoadingState extends LoginState {}