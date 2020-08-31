import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DbService extends ChangeNotifier {
  static DbService _singleton = DbService._internal();
  final _firestore = FirebaseFirestore.instance;

  DbService._internal();
  factory DbService() {
    return _singleton;
  }
}
