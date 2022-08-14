import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mfk/models/user_model.dart';

class NetworkHelper {
  static FirebaseFirestore fire_store = FirebaseFirestore.instance;
  static CollectionReference users = FirebaseFirestore.instance.collection('users');
  late UserModel model;
  static Future<void> addData({
    required String name,
    required String email,
    required String phone,
    required String uId
  }) {

    return users
        .add({
          'name': name,
          'email': email,
          'phone': phone,
        })
        .then((value)
    => print("User Added ________________ $value"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
