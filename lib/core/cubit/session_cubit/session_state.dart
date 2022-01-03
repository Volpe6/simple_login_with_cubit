part of "session_cubit.dart";

class SessionState {
  final User? user;
  SessionState({required this.user});

  factory SessionState.init() {
    return SessionState(
      user: null
    );
  }

  SessionState copyWith({user}) {
    return SessionState(
      user: user??user
    );
  }
}