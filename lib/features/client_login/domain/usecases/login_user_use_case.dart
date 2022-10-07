import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_demo/features/client_login/domain/repository/login_repository.dart';
import 'package:flutter_bloc_demo/utils/status_objects.dart';
import 'package:flutter_bloc_demo/utils/usecase.dart';

class LoginUserUseCase extends UseCase<String, FetchLoginListParams> {
  LoginRepository repository;

  LoginUserUseCase({required this.repository});

  @override
  Future<Either<Failure, String>> call(FetchLoginListParams params) {
    return repository.loginUser(
        username: params.username, password: params.password);
  }
}

class FetchLoginListParams extends Equatable {
  final String username, password;

  const FetchLoginListParams({required this.username, required this.password})
      : super();

  @override
  List<Object> get props => [username, password];
}
