import 'package:bloc_peticiones_noticias/bloc/news/noticias_bloc.dart';
import 'package:bloc_peticiones_noticias/widgets/news_witget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Tab1Screen extends StatelessWidget {
  const Tab1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<NoticiasBloc, NoticiasState>(
      builder: (context, state) {
        return state.existeNoticias
            ? ListaNoticiasScreen(noticias: state.noticias)
            : const Center(child: CircularProgressIndicator());
      },
    ));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
