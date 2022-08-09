import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:tvmaze/MODELS/Show.dart';
import 'package:tvmaze/VistaInfo/InfoShow.dart';

class search extends SearchDelegate {
  List<Show> _filter = [];
  List<Show> data;
  search({required this.data});
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = " ";
          })
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Center(
        child: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              final TV = data[index];
              return Card(
                child: Row(
                  children: <Widget>[
                    FadeInImage(
                      placeholder: AssetImage('assetname'),
                      image: NetworkImage(TV.url),
                      width: 70,
                      height: 90,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(TV.name,
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 0, 0, 0))),
                    ),
                  ],
                ),
              );
            }),
      );
    } else {
      _filter = data.where((element) {
        return element.name.toLowerCase().contains(query.trim().toLowerCase());
      }).toList();
      return ListView.builder(
          itemCount: _filter.length,
          itemBuilder: (context, index) {
            final TV = _filter[index];
            return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => info(
                                tv: TV,
                              )));
                },
                child: Card(
                  child: Row(
                    children: <Widget>[
                      FadeInImage(
                        placeholder: AssetImage('assetname'),
                        image: NetworkImage(TV.url),
                        width: 70,
                        height: 90,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(TV.name,
                            style: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 0, 0, 0))),
                      ),
                    ],
                  ),
                ));
          });
    }
  }
}
