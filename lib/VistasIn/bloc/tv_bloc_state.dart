part of 'tv_bloc_bloc.dart';

enum DataStatus { initial, loanging, success, error }

class TvBlocState {
  List<Show> lista;

  final DataStatus status;

  TvBlocState({required this.lista, required this.status});

  factory TvBlocState.initial() {
    return TvBlocState(lista: [], status: DataStatus.initial);
  }

  TvBlocState copywith({List<Show>? lista, DataStatus? status}) {
    return TvBlocState(
        lista: lista ?? this.lista, status: status ?? this.status);
  }
}
