import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_demo/features/client_module/domain/repository/client_repository.dart';
import 'package:flutter_bloc_demo/utils/status_objects.dart';
import 'package:flutter_bloc_demo/utils/usecase.dart';

class UpoadPortfolioUseCase extends UseCase<String, FetchPortfolioListParams> {
  ClientRepository repository;

  UpoadPortfolioUseCase({required this.repository});

  @override
  Future<Either<Failure, String>> call(FetchPortfolioListParams params) {
    return repository.uploadPortfolio(
      serviceType: params.serviceType,
      serviceName: params.serviceName,
      duration: params.duration,
      images: params.images,
    );
  }
}

class FetchPortfolioListParams extends Equatable {
  final String serviceType, serviceName, duration;
  final List<String> images;

  const FetchPortfolioListParams({
    required this.serviceType,
    required this.serviceName,
    required this.duration,
    required this.images,
  }) : super();

  @override
  List<Object> get props => [serviceType, serviceName, duration, images];
}
