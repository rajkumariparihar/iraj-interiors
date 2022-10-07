import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_demo/features/client_module/domain/repository/client_repository.dart';
import 'package:flutter_bloc_demo/utils/status_objects.dart';

import '../../../../utils/usecase.dart';

class UploadFeatureUseCase extends UseCase<String, FetchFeatureListParams> {
  ClientRepository repository;

  UploadFeatureUseCase({required this.repository});

  @override
  Future<Either<Failure, String>> call(FetchFeatureListParams params) {
    return repository.uploadFeature(
        name: params.name,
        details: params.description,
        imageUrl: params.image_url);
  }
}

class FetchFeatureListParams extends Equatable {
  final String name, description, image_url;

  const FetchFeatureListParams(
      {required this.name, required this.description, required this.image_url})
      : super();

  @override
  List<Object> get props => [name, description, image_url];
}
