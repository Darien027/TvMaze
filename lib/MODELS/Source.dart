import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Show.dart';
import 'Episode.dart';

Future<List<Show>> getTvs() async {
  final String apiEndpoint = 'https://api.tvmaze.com/shows';
  final Uri url = Uri.parse(apiEndpoint);
  final response = await http.get(url);

  List<Show> tvs = [];
  String body = utf8.decode(response.bodyBytes);
  final jsonData = jsonDecode(body);

  for (var item in jsonData) {
    var apiEndpoint2 = 'https://api.tvmaze.com/shows/';
    int s = item["id"];
    final Uri url2 =
        Uri.parse(apiEndpoint2 + '${s}' + '?embed[]=episodes&embed[]=cast');
    var response2 = await http.get(url2);
    var body2 = utf8.decode(response2.bodyBytes);
    var jsonData2 = jsonDecode(body2);
    var episodes = jsonData2["_embedded"]["episodes"] != null
        ? jsonData2["_embedded"]["episodes"] as List
        : [];
    final String NO = "aún la siguen produciendo :)(:";
    if (item["ended"] == null) {
      item["ended"] = NO;
    }
    print(item["id"]);
    tvs.add(
      Show(
        id: item["id"],
        name: item["name"],
        language: item["language"],
        url: item["image"]["medium"],
        summary: item["summary"],
        genres: item["genres"],
        inicio: item["premiered"],
        fin: item["ended"],
        episodes: episodes
            .map((e) => Episode(
                id: e["id"],
                number: e["number"],
                name: e["name"],
                season: e["season"],
                images: e["image"] == null ? null : e["image"]["medium"],
                summary: e["summary"]))
            .toList(),
      ),
    );
  }
  return tvs;
}
