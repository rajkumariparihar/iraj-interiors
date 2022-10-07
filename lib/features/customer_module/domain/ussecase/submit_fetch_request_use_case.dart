import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_demo/features/customer_module/domain/repository/customer_repository.dart';
import 'package:flutter_bloc_demo/utils/status_objects.dart';
import 'package:flutter_bloc_demo/utils/usecase.dart';

class SubmitFetchRequestUseCase extends UseCase<String, SubmitTouchRequestParams> {
  CustomerRepository repository;

  SubmitFetchRequestUseCase({required this.repository});

  @override
  Future<Either<Failure, String>> call(SubmitTouchRequestParams params) {
    return repository.submitTouchRequest(
        name: params.name,
        last_name: params.last_name,
        email: params.email,
        company_name: params.company_name,
        mobile: params.mobile,
        country: params.country,
        description: params.description);
  }
}

class SubmitTouchRequestParams extends Equatable {
  final String name;
  final String last_name;
  final String email;
  final String company_name;
  final String mobile;
  final String country;
  final String description;

  const SubmitTouchRequestParams(
      {required this.name,
      required this.last_name,
      required this.email,
      required this.company_name,
      required this.mobile,
      required this.country,
      required this.description});

  @override
  // TODO: implement props
  List<Object?> get props =>
      [name, last_name, email, company_name, mobile, country, description];
}
