import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tvmaze/Autenticaci%C3%B3n/Biometric.dart';
import 'package:tvmaze/Autenticaci%C3%B3n/Bloc/bloc/auth_bloc.dart';
import 'package:tvmaze/Autenticaci%C3%B3n/PIN.dart';
import 'package:tvmaze/VistasIn/bloc/tv_bloc_bloc.dart';

import 'MODELS/Show.dart';
import 'package:flutter/material.dart';
import 'VistaInfo/InfoShow.dart';
import 'MODELS/Source.dart';

void main() => runApp(AppState2());

class AppState2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TvBlocBloc>(
          create: (_) => TvBlocBloc(),
        ),
      ],
      child: AppState(),
    );
  }
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => AuthBloc(),
        ),
      ],
      child: _MyAppState(),
    );
  }
}

class _MyAppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Tv Maze', home: PIN());
  }
}
