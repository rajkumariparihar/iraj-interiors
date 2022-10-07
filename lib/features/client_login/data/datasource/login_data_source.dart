import 'package:flutter_bloc_demo/features/client_login/data/datamodels/login_data_module.dart';

abstract class LoginDataSource {
  Future<String> loginUser(
      {required String username, required String password});

  Future<String> registerUser(
      {required String name, required String email, required String password});
}
