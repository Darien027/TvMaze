import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:local_auth/local_auth.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState.initial()) {
    on<Unknow>((handleinit));
  }

  Future<AuthState> handleinit(Unknow event, Emitter<AuthState> emit) async {
    return AuthState.initial();
  }
}
