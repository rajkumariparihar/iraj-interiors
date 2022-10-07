import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc_demo/features/customer_module/data/datamodels/portfolio_module.dart';
import 'package:flutter_bloc_demo/features/customer_module/data/datamodels/services_module.dart';
import 'package:flutter_bloc_demo/features/customer_module/data/datasource/customer_data_source.dart';
import 'package:flutter_bloc_demo/features/customer_module/domain/repository/customer_repository.dart';
import 'package:flutter_bloc_demo/utils/status_objects.dart';

import '../../../../utils/utils.dart';

class CustomerRepositoryImpl extends CustomerRepository {
  CustomerDataSource customerDataSource;

  CustomerRepositoryImpl({required this.customerDataSource});

  @override
  Future<Either<Failure, String>> submitTouchRequest(
      {required String name,
      required String last_name,
      required String email,
      required String company_name,
      required String mobile,
      required String country,
      required String description}) async {
    try {
      final result = await customerDataSource.submitTouchRequest(
          name: name,
          last_name: last_name,
          email: email,
          company_name: company_name,
          mobile: mobile,
          country: country,
          description: description);

      return Right(result);
    } on DioError catch (e) {
      return (Left(handleFailure(e)));
    } on Failure {
      return Left(Failure("Request time out.."));
    }
  }

  @override
  Future<Either<Failure, List<ServicesModule>>> getFutureServices() async {
    try {
      final result = await customerDataSource.getFutureServices();
      return Right(result);
    } on DioError catch (e) {
      return (Left(handleFailure(e)));
    } on Failure {
      return Left(Failure("Request time out.."));
    }
  }

  @override
  Future<Either<Failure, List<PortfolioModule>>> getPorfolioServices() async {
    try {
      print('trying to get the data');
      final result = await customerDataSource.getProtfolio();
      return Right(result);
    } on DioError catch (e) {
      return (Left(handleFailure(e)));
    } on Failure {
      return Left(Failure("Request time out.."));
    }
  }
}
