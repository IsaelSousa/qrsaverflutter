import 'package:flutter/material.dart';
import 'package:qrsaver/app_widget.dart';
import 'package:firebase_core/firebase_core.dart';


void main() {
  runApp(const FireBaseApp());
}

class FireBaseApp extends StatefulWidget {
  const FireBaseApp({ Key? key }) : super(key: key);

  @override
  _FireBaseAppState createState() => _FireBaseAppState();
}

class _FireBaseAppState extends State<FireBaseApp> {
  // Inicia a conexão com o Firebase
  final _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot){

        // Caso houver um erro com a conexão, exibira o conteúdo.
        if(snapshot.hasError){
          return const Material(
            child: Center(
              child: Text('Não foi possível inicializar o Firebase.', textDirection: TextDirection.ltr,),
            ),
          );

          // Se a conexão for estabelecida, exibira o conteúdo.
        } else if (snapshot.connectionState == ConnectionState.done){
          return const AppWidget();
        } else {
          return const Material(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

      },
    );
  }
}