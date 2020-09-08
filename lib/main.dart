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
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/register',
      onGenerateRoute: FluroRouter.router.generator,
    );
  }
}
