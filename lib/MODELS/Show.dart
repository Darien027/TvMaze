import 'package:tvmaze/MODELS/Episode.dart';

class Show {
  final int id;
  final String name;
  final String language;
  final String url;
  final String summary;
  final String inicio;
  final String fin;

  List<Episode> episodes;
  List<dynamic> genres;

  Show({
    required this.id,
    required this.name,
    required this.language,
    required this.url,
    required this.summary,
    required this.episodes,
    required this.inicio,
    required this.fin,
    required this.genres,
  });
}
