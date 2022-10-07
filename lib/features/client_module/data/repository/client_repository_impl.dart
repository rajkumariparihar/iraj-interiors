import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc_demo/features/client_module/data/datamodels/request_module.dart';
import 'package:flutter_bloc_demo/features/client_module/data/datasource/client_data_source.dart';
import 'package:flutter_bloc_demo/features/client_module/domain/repository/client_repository.dart';
import 'package:flutter_bloc_demo/features/customer_module/data/datamodels/services_module.dart';
import 'package:flutter_bloc_demo/utils/status_objects.dart';

import '../../../../utils/utils.dart';

class ClientRepositoryImpl extends ClientRepository {
  ClientDataSource clientDataSource;

  ClientRepositoryImpl({required this.clientDataSource});

  @override
  Future<Either<Failure, String>> uploadFeature(
      {required String name,
      required String details,
      required String imageUrl}) async {
    try {
      final result = await clientDataSource.uploadFeature(
          name: name, details: details, image_url: imageUrl);
      return Right(result);
    } on DioError catch (e) {
      return (Left(handleFailure(e)));
    } on Failure {
      return Left(Failure("Request time out.."));
    }
  }

  @override
  Future<Either<Failure, String>> uploadServices(
      {required String name,
      required String details,
      required String imageUrl}) async {
    // TODO: implement uploadServices
    try {
      final result = await clientDataSource.uploadService(
          name: name, details: details, image_url: imageUrl);
      return Right(result);
    } on DioError catch (e) {
      return (Left(handleFailure(e)));
    } on Failure {
      return Left(Failure("Request time out.."));
    }
  }

  @override
  Future<Either<Failure, List<RequestModule>>> getRequests() async {
    // TODO: implement getRequests
    try {
      final result = await clientDataSource.getRequests();
      return Right(result);
    } on DioError catch (e) {
      return (Left(handleFailure(e)));
    } on Failure {
      return Left(Failure("Request time out.."));
    }
  }

  @override
  Future<Either<Failure, List<ServicesModule>>> getServices() async {
    // TODO: implement getServices
    try {
      final result = await clientDataSource.getServices();
      return Right(result);
    } on DioError catch (e) {
      return (Left(handleFailure(e)));
    } on Failure {
      return Left(Failure("Request time out.."));
    }
  }

  @override
  Future<Either<Failure, String>> uploadPortfolio({
    required String serviceType,
    required String serviceName,
    required String duration,
    required List<String> images,
  }) async {
    try {
      final result = await clientDataSource.uploadPortfolio(
        serviceType: serviceType,
        serviceName: serviceName,
        duration: duration,
        images: images,
      );
      return Right(result);
    } on DioError catch (e) {
      return (Left(handleFailure(e)));
    } on Failure {
      return Left(Failure("Request time out.."));
    }
  }
}
