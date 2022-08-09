part of 'auth_bloc.dart';

enum SupportState {
  unknown,
  supported,
  unsupported,
}

class AuthState {
  final SupportState Support;
  AuthState({required this.Support});

  factory AuthState.initial() {
    return AuthState(Support: SupportState.unknown);
  }
}
