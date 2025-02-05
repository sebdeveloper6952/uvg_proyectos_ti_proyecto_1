import 'package:flutter/material.dart';
import 'package:flutter_proyecto_1/router.dart';
import 'package:flutter_proyecto_1/services/auth_service.dart';
import 'package:flutter_proyecto_1/services/db_service.dart';
import 'package:provider/provider.dart';

void main() {
  // Initialization.
  FluroRouter.initialize();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (c) => AuthService(),
          lazy: true,
        ),
        ChangeNotifierProvider(
          create: (c) => DbService(),
          lazy: true,
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PMBOKlingo',
      theme: ThemeData(
        primarySwatch: Colors.indigoAccent[300],
        accentColor: Colors.blueAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(
              color: Colors.pink,
              width: 3.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(
              width: 2.0,
              color: Color.fromARGB(1, 103, 155, 155),
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(
              width: 2.0,
              color: Colors.red[300],
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(
              width: 2.0,
              color: Color.fromARGB(1, 255, 154, 118),
            ),
          ),
        ),
        buttonTheme:
            ButtonThemeData(buttonColor: Color.fromARGB(1, 103, 155, 155)),
      ),
      initialRoute: '/login',
      onGenerateRoute: FluroRouter.router.generator,
    );
  }
}
