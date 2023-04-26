import 'package:bloc_peticiones_noticias/services/navegacion_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Tab3Screen extends StatelessWidget {
  static const String routeName = 'tab1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder<int>(
          stream: counterBloc.counterStream,
          builder: (context, snapshot) {
            // if (!snapshot.hasData) {
            //   return CircularProgressIndicator();
            // }
            return Text('Counter: ${snapshot.data}');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterBloc.incrementCounter();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
