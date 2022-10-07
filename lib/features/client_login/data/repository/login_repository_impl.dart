import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc_demo/features/client_login/domain/repository/login_repository.dart';
import 'package:flutter_bloc_demo/utils/status_objects.dart';

import '../../../../utils/utils.dart';
import '../datasource/login_data_source.dart';

class LoginRepositoryImpl extends LoginRepository {
  LoginDataSource loginDataSource;

  LoginRepositoryImpl({required this.loginDataSource});

  @override
  Future<Either<Failure, String>> loginUser(
      {required String username, required String password}) async {
    try {
      final result = await loginDataSource.loginUser(
          username: username, password: password);
      return Right(result);
    } on DioError catch (e) {
      return (Left(handleFailure(e)));
    } on Failure {
      return Left(Failure("Request time out.."));
    }
  }

  @override
  Future<Either<Failure, String>> registerUser(
      {required String name,
      required String email,
      required String password}) async {
    // TODO: implement registerUser
    try {
      final result = await loginDataSource.registerUser(
          name: name, email: email, password: password);
      return Right(result);
    } on DioError catch (e) {
      return (Left(handleFailure(e)));
    } on Failure {
      return Left(Failure("Request time out.."));
    }
  }
}
