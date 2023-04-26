import 'package:bloc_peticiones_noticias/bloc/news/noticias_bloc.dart';
import 'package:bloc_peticiones_noticias/model/catogory_model.dart';
import 'package:bloc_peticiones_noticias/model/news_model.dart';
import 'package:bloc_peticiones_noticias/widgets/news_witget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Tab2Screen extends StatelessWidget {
  const Tab2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = BlocProvider.of<NoticiasBloc>(context);

    return Scaffold(
        body: Column(children: <Widget>[
      _ListaCategorias(),
      Expanded(
        child: BlocBuilder<NoticiasBloc, NoticiasState>(
          builder: (context, state) {
            return state.existeNoticias
                ? ListaNoticiasScreen(noticias: state.noticias)
                : const Center(child: CircularProgressIndicator());
          },
        ),
      )
    ]));
  }
}

class _ListaCategorias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categories = BlocProvider.of<NoticiasBloc>(context);
    final listCategoria = categories.state.getCategories;

    return Container(
      width: double.infinity,
      height: 80,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: listCategoria.length,
        itemBuilder: (BuildContext context, int index) {
          final cName = listCategoria[index].name;
          return Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: <Widget>[
                _CategoryButton(listCategoria[index]),
                SizedBox(height: 5),
                Text('${cName[0].toUpperCase()}${cName.substring(1)}')
              ],
            ),
          );
        },
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  final CategoryIcon categoria;

  const _CategoryButton(this.categoria);

  @override
  Widget build(BuildContext context) {
    // final categories = BlocProvider.of<NoticiasBloc>(context);

    return GestureDetector(
      onTap: () {
        // final newsService = Provider.of<NewsService>(context, listen: false);
        // newsService.selectedCategory = categoria.name;
        BlocProvider.of<NoticiasBloc>(context, listen: false)
            .add(NoticiasLoadingCategoriesEvent(category: this.categoria.name));
        List<Article> listArticle = [
          Article(
              description: 'dwad',
              publishedAt: 'awdad',
              source: Source(name: 'add', id: 'awd'),
              title: 'wad',
              url: '',
              urlToImage: 'awda'),
          Article(
              description: 'dwad',
              publishedAt: 'awdad',
              source: Source(name: 'add', id: 'awd'),
              title: 'wad',
              url: '',
              urlToImage: 'awda'),
        ];
        String categoria = 'sports';
        BlocProvider.of<NoticiasBloc>(context).add(
            NoticiasLoadingCategoriesEvent(
                category: categoria, noticias: listArticle));
      },
      child: Container(
        width: 40,
        height: 40,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: Icon(
          categoria.icon,
          color: Colors.black54,
          // color: (newsService.selectedCategory == this.categoria.name)
          //     ? miTema.accentColor
          //     : Colors.black54,
        ),
      ),
    );
  }
}
