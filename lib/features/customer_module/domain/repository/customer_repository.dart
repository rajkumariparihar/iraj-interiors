import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_demo/features/customer_module/data/datamodels/portfolio_module.dart';
import 'package:flutter_bloc_demo/utils/status_objects.dart';

import '../../data/datamodels/services_module.dart';

abstract class CustomerRepository {
  Future<Either<Failure, String>> submitTouchRequest({
    required String name,
    required String last_name,
    required String email,
    required String company_name,
    required String mobile,
    required String country,
    required String description,
  });

  Future<Either<Failure, List<ServicesModule>>> getFutureServices();

  Future<Either<Failure, List<PortfolioModule>>> getPorfolioServices();
}
