import 'package:bloc_peticiones_noticias/Screen/tab1_page.dart';
import 'package:bloc_peticiones_noticias/Screen/tab2_page.dart';
import 'package:bloc_peticiones_noticias/screen/tab3_page.dart';
import 'package:bloc_peticiones_noticias/screen/tab4_page.dart';
import 'package:bloc_peticiones_noticias/services/navegacion_service.dart';
import 'package:flutter/material.dart';

class TabScreen extends StatelessWidget {
  static const String routeName = 'tabs';
  const TabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Paginas(),
      bottomNavigationBar: _Navegacion(),
    );
  }
}

class _Paginas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: navegacionServiceBloc.navegacionStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return PageView(
          controller: navegacionServiceBloc.pageController,
          physics: NeverScrollableScrollPhysics(),
          children: [Tab1Screen(), Tab2Screen(), Tab3Screen(), Tab4Screen()],
          onPageChanged: (index) {
            navegacionServiceBloc.cambiarPagina(index);
          },
        );
      },
    );
  }
}

class _Navegacion extends StatelessWidget {
  //  final navegacionServiceBloc = NavegacionServiceBloc();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: navegacionServiceBloc.navegacionStream,
        builder: (_, AsyncSnapshot snapshot) {
          return BottomNavigationBar(
            currentIndex: snapshot.data ?? 0,
            onTap: (index) {
              navegacionServiceBloc.cambiarPagina(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: 'Para ti ${snapshot.data ?? 0}',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.public),
                label: 'Encabezados',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: 'Para ti',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.public),
                label: 'Encabezados',
              ),
            ],
          );
        });
  }
}
