import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tvmaze/MODELS/Show.dart';
import '../VistaSeason/Season.dart';

class info extends StatelessWidget {
  final Show tv;
  const info({Key? key, required this.tv}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(tv.name),
        ),
        body: ListView(
          children: [
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FadeInImage(
                      placeholder: AssetImage('assetName'),
                      image: NetworkImage(tv.url)),
                  Card(
                    margin: EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text(
                            tv.name,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 30,
                              height: 2,
                            ),
                          ),
                          FractionallySizedBox(
                            widthFactor: 1,
                            child: Text(
                              tv.summary
                                  .replaceAll('<p>', '')
                                  .replaceAll('<b>', '')
                                  .replaceAll('</b>', '')
                                  .replaceAll('</p>', '')
                                  .replaceAll('</i>', '')
                                  .replaceAll('<i>', ''),
                              style: TextStyle(
                                color: Color.fromARGB(198, 0, 0, 0),
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ]),
                  ),
                  Card(
                    margin: EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(children: <Widget>[
                      Text(
                        "Estuvo al aire entre el " + tv.inicio + " y " + tv.fin,
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ]),
                  ),
                  Card(
                    margin: EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (var genre in tv.genres) ...[
                          Text(
                            genre,
                            style: TextStyle(fontSize: 30),
                          ),
                          SizedBox(
                            width: 2,
                          )
                        ]
                      ],
                    ),
                  ),
                  //..._ListSeason(tv.episodes, context)
                ],
              ),
            )
          ],
        ));
  }

  List<Widget> _ListSeason(data, BuildContext context) {
    List<Widget> seasons = [];
    List Lista = [];
    int MaxSeason = 0;
    int valu;
    for (var element in data) {
      valu = element.season;
      if (element.season != MaxSeason) {
        MaxSeason = valu;
        Lista.add(element.season);
      }
    }
    for (var element in Lista) {
      seasons.add(
        Card(
            child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => season(
                          tv: tv,
                          number: element,
                        )));
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Temporada " + element.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30),
                ),
              )
            ],
          ),
        )),
      );
    }
    return seasons;
  }
}
