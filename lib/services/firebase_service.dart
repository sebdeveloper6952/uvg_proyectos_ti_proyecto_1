import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  static FirebaseService _singleton = FirebaseService._internal();
  final _firestore = FirebaseFirestore.instance;

  FirebaseService._internal();
  factory FirebaseService() {
    return _singleton;
  }
}
