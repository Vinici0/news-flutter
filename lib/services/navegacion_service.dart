import 'dart:async';

import 'package:flutter/material.dart';

class _NavegacionServiceBloc {
  int _index = 0;
  int conunt = 0;
  PageController _pageController = new PageController();

  //El StreamController va a fluir enteros
  final StreamController<int> _navegacionStreamController =
      StreamController<int>.broadcast();

  final StreamController<int> _navegacionStreamController2 =
      StreamController<int>.broadcast();

  //El StreamController tiene un método llamado sink que es el encargado de emitir los datos y el método stream que es el encargado de escuchar los datos
  NavegacionServiceBloc() {
    _navegacionStreamController.onListen = () {
      _navegacionStreamController.add(_index);
    };
  }

  //Solo se retorna el stream porque el sink es privado
  Stream<int> get navegacionStream => _navegacionStreamController.stream;

  Stream<int> get navegacionStream2 => _navegacionStreamController2.stream;

  int get index => _index;
  int get count => conunt;

  void cambiarPagina(int index) {
    _index = index;
    _pageController.animateToPage(index,
        duration: Duration(milliseconds: 300), curve: Curves.easeOut);
    _navegacionStreamController.add(index);
  }

  void cambiarPagina2(int index) {
    _navegacionStreamController2.add(index);
    conunt = index;
  }

  PageController get pageController => _pageController;

  void dispose() {
    _navegacionStreamController.close();
  }
}

final navegacionServiceBloc = _NavegacionServiceBloc();

class CounterBloc {
  int _counter = 0;

  // Usamos un broadcast StreamController para poder tener varios listeners.
  final StreamController<int> _counterController =
      StreamController<int>.broadcast();

  Stream<int> get counterStream => _counterController.stream;

  void incrementCounter() {
    _counter++;
    _counterController.add(_counter);
  }

  void dispose() {
    _counterController.close();
  }
}

final counterBloc = CounterBloc();
