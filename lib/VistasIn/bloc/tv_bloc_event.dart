part of 'tv_bloc_bloc.dart';

@immutable
abstract class TvBlocEvent {}

class Search extends TvBlocEvent {}

class Iniciar extends TvBlocEvent {}

class Empty1 extends TvBlocEvent {
  List<Show> INFO;

  Empty1(this.INFO);
}

class InfoGen extends TvBlocEvent {
  final int id;

  InfoGen(this.id);
}

class InfoSeason extends TvBlocEvent {
  final int number;

  InfoSeason(this.number);
}

class InfoEpisode extends TvBlocEvent {
  final int id;

  InfoEpisode(this.id);
}
