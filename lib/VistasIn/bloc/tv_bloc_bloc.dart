import 'package:flutter/material.dart';

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tvmaze/MODELS/Show.dart';
import 'package:tvmaze/MODELS/Source.dart';

import '../../VistaGen/Shows.dart';

part 'tv_bloc_event.dart';
part 'tv_bloc_state.dart';

class TvBlocBloc extends Bloc<TvBlocEvent, TvBlocState> {
  TvBlocBloc() : super(TvBlocState.initial()) {
    on<Iniciar>(handleinit);
  }

  Future<void> handleinit(Iniciar event, Emitter<TvBlocState> emit) async {
    emit(state.copywith(status: DataStatus.loanging));
    try {
      final listado = await getTvs();
      emit(state.copywith(lista: listado, status: DataStatus.success));
    } catch (error) {
      emit(state.copywith(status: DataStatus.error));
    }
  }
}
