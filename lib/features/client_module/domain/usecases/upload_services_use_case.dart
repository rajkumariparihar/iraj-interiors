import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_demo/utils/usecase.dart';

import '../../../../utils/status_objects.dart';
import '../repository/client_repository.dart';

class UploadServicesUseCase extends UseCase<String, FetchServiceListParams> {
  ClientRepository repository;

  UploadServicesUseCase({required this.repository});

  @override
  Future<Either<Failure, String>> call(FetchServiceListParams params) {
    return repository.uploadServices(
        name: params.name,
        details: params.description,
        imageUrl: params.image_url);
  }
}

class FetchServiceListParams extends Equatable {
  final String name, description, image_url;

  const FetchServiceListParams(
      {required this.name, required this.description, required this.image_url})
      : super();

  @override
  List<Object> get props => [name, description, image_url];
}
