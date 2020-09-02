import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proyecto_1/router.dart';
import 'package:flutter_proyecto_1/services/auth_service.dart';
import 'package:provider/provider.dart';

class EntryPointScreen extends StatefulWidget {
  @override
  _EntryPointScreenState createState() => _EntryPointScreenState();
}

class _EntryPointScreenState extends State<EntryPointScreen> {
  final Future<FirebaseApp> _init = Firebase.initializeApp();

  @override
  void initState() {
    _init.then((value) {
      final route = context.read<AuthService>().isLoggedIn ? '/home' : '/login';
      FluroRouter.router.navigateTo(context, route, clearStack: true);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
