import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_demo/utils/status_objects.dart';

abstract class LoginRepository {
  Future<Either<Failure, String>> loginUser(
      {required String username, required String password});

  Future<Either<Failure, String>> registerUser(
      {required String name, required String email, required String password});
}
