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
        primarySwatch: Colors.orange,
        accentColor: Colors.blueAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(
              color: Colors.blueAccent,
              width: 3.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(
              width: 2.0,
              color: Colors.orange,
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
              color: Colors.red[300],
            ),
          ),
        ),
        buttonTheme: ButtonThemeData(buttonColor: Colors.orange),
      ),
      initialRoute: '/login',
      onGenerateRoute: FluroRouter.router.generator,
    );
  }
}
