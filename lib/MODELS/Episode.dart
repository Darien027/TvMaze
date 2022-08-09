class Episode {
  late int id;
  late int number;
  late String name;
  late int season;
  late String? images;
  late String? summary;

  Episode({
    required this.id,
    required this.number,
    required this.name,
    required this.season,
    required this.images,
    required this.summary,
  });
}
