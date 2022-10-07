import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_demo/features/customer_module/data/datamodels/portfolio_module.dart';
import 'package:flutter_bloc_demo/features/customer_module/domain/repository/customer_repository.dart';
import 'package:flutter_bloc_demo/utils/status_objects.dart';
import 'package:flutter_bloc_demo/utils/usecase.dart';

class GetPortfolioServicesUseCases
    extends UseCase<List<PortfolioModule>, String> {
  CustomerRepository repository;

  GetPortfolioServicesUseCases({required this.repository});
  @override
  Future<Either<Failure, List<PortfolioModule>>> call(String params) {
    print('here in the use case');
    return repository.getPorfolioServices();
  }
}
