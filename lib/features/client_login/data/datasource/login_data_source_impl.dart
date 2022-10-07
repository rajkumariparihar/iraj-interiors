import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../di/dependency_injection.dart';
import '../../../../utils/dio_api_client.dart';
import 'login_data_source.dart';

class LoginDataSourceImpl extends LoginDataSource {
  final db = dcSl<FirebaseFirestore>();
  UserCredential? credential;

  Dio? client;

  LoginDataSourceImpl() {
    client = dcSl<DioApiClient>().getApiClient();
  }

  @override
  Future<String> loginUser(
      {required String username, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: username, password: password);

      return '${credential.user}';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    return '';
  }

  @override
  Future<String> registerUser(
      {required String name,
      required String email,
      required String password}) async {
    return '';
  }
}
