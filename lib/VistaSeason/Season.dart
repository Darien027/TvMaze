import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tvmaze/MODELS/Episode.dart';
import 'package:tvmaze/MODELS/Show.dart';
import 'package:tvmaze/main.dart';
import '../VistaInfo/InfoShow.dart';

class season extends StatelessWidget {
  final Show tv;
  final int number;
  const season({Key? key, required this.tv, required this.number})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Temporada " + number.toString()),
        ),
        body: ListView(
          children: [
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                //children: <Widget>[..._ListTvs2(tv.episodes, context, number)],
              ),
            )
          ],
        ));
  }

  List<Widget> _ListTvs2(data, BuildContext context, number) {
    List<Widget> episodes = [];
    List Lista = [];
    int z = 0;
    for (var element in data) {
      if (number == element.season) {
        Lista.add(element.name);
      }
    }
    z = z + 1;
    for (var element in Lista) {
      episodes.add(Card(
        child: GestureDetector(
          child: Column(children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                element,
                style: TextStyle(fontSize: 30),
              ),
            )
          ]),
        ),
      ));
    }
    return episodes;
  }
}
