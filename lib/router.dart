import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_proyecto_1/screens/home_screen.dart';

class FluroRouter {
  static Router router = Router();

  static Handler _entryPointHandler = Handler(
    handlerFunc: (BuildContext c, Map<String, dynamic> p) => HomeScreen(),
  );

  static void initialize() {
    router.define(
      '/',
      handler: _entryPointHandler,
      transitionType: TransitionType.inFromBottom,
    );
  }
}
