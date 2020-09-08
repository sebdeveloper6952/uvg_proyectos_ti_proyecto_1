import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  static AuthService _instance = AuthService._internal();
  final _auth = FirebaseAuth.instance;

  /// simular login true por ahora
  bool get isLoggedIn => false;

  AuthService._internal() {
    _init();
  }

  factory AuthService() {
    return _instance;
  }

  void _init() {
    _auth.authStateChanges().listen((User user) {
      if (user == null) {
        print('User is logged out, show login screen.');
      } else {
        print('User is logged in, show home screen.');
      }
    });
  }

  Future<bool> createUser(String email, String password) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      print('User created!!!!!!!11');
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e.toString());
      return false;
    }
    return false;
  }

  void login(String email, String password) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print('User logged in!!!!1');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}
