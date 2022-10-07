import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_demo/features/client_login/domain/repository/login_repository.dart';
import 'package:flutter_bloc_demo/utils/status_objects.dart';
import 'package:flutter_bloc_demo/utils/usecase.dart';

class RegisterUserUseCase extends UseCase<String, FetchRegisterListParams> {
  LoginRepository repository;

  RegisterUserUseCase({required this.repository});

  @override
  Future<Either<Failure, String>> call(FetchRegisterListParams params) {
    return repository.registerUser(
        name: params.name, email: params.email, password: params.password);
  }
}

class FetchRegisterListParams extends Equatable {
  final String name, password, email;

  const FetchRegisterListParams(
      {required this.name, required this.email, required this.password})
      : super();

  @override
  List<Object> get props => [name, email, password];
}
