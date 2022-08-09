import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:tvmaze/VistaGen/Shows.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tvmaze/VistasIn/bloc/tv_bloc_bloc.dart';

class VIS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvBlocBloc, TvBlocState>(
      builder: (context, state) {
        return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Shows(
                            tv: state.lista,
                          )));
            },
            child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.all(15),
                elevation: 10,
                child: Column(
                  children: <Widget>[
                    ListTile(
                      contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
                      title: Text('Tv Maze'),
                      leading: Icon(Icons.home),
                    ),
                    Image(
                        image: NetworkImage(
                            'https://static.tvmaze.com/images/tvm-header-logo.png')),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text("Clic para iniciar",
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 0, 0, 0))),
                    ),
                  ],
                )));
      },
    );
  }
}

class Loadings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(15),
      elevation: 10,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Column(children: <Widget>[
            Image(
                image: NetworkImage(
                    'https://static.tvmaze.com/images/tvm-header-logo.png')),
            CircularProgressIndicator(),
            Text("Espere un momento"),
          ])),
    );
  }
}
