import 'package:bloc_peticiones_noticias/bloc/news/noticias_bloc.dart';
import 'package:bloc_peticiones_noticias/screen/tab3_page.dart';
import 'package:bloc_peticiones_noticias/screen/tabs_page.dart';
import 'package:bloc_peticiones_noticias/theme/tema.dart';
import 'package:bloc_peticiones_noticias/widgets/news_witget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => NoticiasBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: TabScreen.routeName,
        theme: miTema,
        routes: {
          TabScreen.routeName: (_) => TabScreen(),
          Tab3Screen.routeName: (_) => Tab3Screen(),
        },
      ),
    );
  }
}
