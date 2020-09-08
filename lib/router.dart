import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_proyecto_1/screens/entry_point.dart';
import 'package:flutter_proyecto_1/screens/home_screen.dart';
import 'package:flutter_proyecto_1/screens/login_screen.dart';
import 'package:flutter_proyecto_1/screens/register_screen.dart';

class FluroRouter {
  static Router router = Router();

  static Handler _entryPointHandler = Handler(
    handlerFunc: (BuildContext c, Map<String, dynamic> p) => EntryPointScreen(),
  );

  static Handler _loginHandler = Handler(
    handlerFunc: (BuildContext c, Map<String, dynamic> p) => LoginScreen(),
  );

  static Handler _homeScreenHandler = Handler(
    handlerFunc: (BuildContext c, Map<String, dynamic> p) => HomeScreen(),
  );

  static Handler _registerHandler = Handler(
    handlerFunc: (BuildContext c, Map<String, dynamic> p) => RegisterScreen(),
  );

  static void initialize() {
    router.define(
      '/',
      handler: _entryPointHandler,
      transitionType: TransitionType.inFromBottom,
    );
    router.define(
      '/login',
      handler: _loginHandler,
      transitionType: TransitionType.inFromBottom,
    );
    router.define(
      '/home',
      handler: _homeScreenHandler,
      transitionType: TransitionType.inFromBottom,
    );

    router.define(
      '/register',
      handler: _registerHandler,
      transitionType: TransitionType.inFromBottom,
    );
  }
}
