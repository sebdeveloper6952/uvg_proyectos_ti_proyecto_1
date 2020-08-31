import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Future<FirebaseApp> _init = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _init,
      builder: (context, snapshot) {
        Widget w;

        // Check for errors
        if (snapshot.hasError) {
          w = Text('Error en Firebase.');
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          w = Text('Pantalla de Inicio');
        } else {
          // Otherwise, show something whilst waiting for initialization to complete
          w = CircularProgressIndicator();
        }

        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: w,
          ),
        );
      },
    );
  }
}
