import 'package:flutter/material.dart';

import '../MODELS/Show.dart';

import '../VistaInfo/InfoShow.dart';

import 'package:tvmaze/MODELS/Search.dart';

class Shows extends StatefulWidget {
  late List<Show> tv;
  Shows({Key? key, required this.tv}) : super(key: key);
  @override
  State<Shows> createState() => _ShowsState();
}

class _ShowsState extends State<Shows> {
  late List<Show> listadoGifs;

  @override
  void initState() {
    super.initState();
    listadoGifs = widget.tv;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Tv Maze',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Tv Maze'),
            actions: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  showSearch(
                      context: context, delegate: search(data: listadoGifs));
                },
              )
            ],
          ),
          body: ListView(
            children: [
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[..._ListTvs(listadoGifs, context)],
                ),
              )
            ],
          ),
        ));
  }
}

List<Widget> _ListTvs(data, BuildContext context) {
  List<Widget> tvs1 = [];
  for (var element in data) {
    tvs1.add(
      Card(
          child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => info(
                              tv: element,
                            )));
              },
              child: Column(
                children: <Widget>[
                  FadeInImage(
                      placeholder: AssetImage('assetname'),
                      image: NetworkImage(element.url)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(element.name,
                        style: TextStyle(
                            fontSize: 20, color: Color.fromARGB(255, 0, 0, 0))),
                  ),
                ],
              ))),
    );
  }
  return tvs1;
}
