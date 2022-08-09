import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tvmaze/MODELS/Show.dart';
import 'package:tvmaze/VistasIn/VisInicial.dart';
import 'package:tvmaze/VistasIn/bloc/tv_bloc_bloc.dart';

class Vista1 extends StatefulWidget {
  @override
  State<Vista1> createState() => _Vista1State();
}

class _Vista1State extends State<Vista1> {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<TvBlocBloc>().state;
    List<Show> INFOR = state.lista;
    int z = 0;
    return BlocBuilder<TvBlocBloc, TvBlocState>(builder: (context, state) {
      if (state.status == DataStatus.loanging) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Tv Maze'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                child: Loadings(),
              )
            ],
          ),
        );
      } else {
        return Scaffold(
            appBar: AppBar(
              title: Text('Tv Maze'),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                    child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: VIS(),
                ))
              ],
            ));
      }
    });
  }

  @override
  void initState() {
    BlocProvider.of<TvBlocBloc>(context).add(Iniciar());
    super.initState();
  }
}
