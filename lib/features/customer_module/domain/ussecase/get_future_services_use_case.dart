import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_demo/features/customer_module/data/datamodels/services_module.dart';
import 'package:flutter_bloc_demo/features/customer_module/domain/repository/customer_repository.dart';

import '../../../../utils/status_objects.dart';
import '../../../../utils/usecase.dart';

class GetFutureServicesUseCase extends UseCase<List<ServicesModule>, String> {
  CustomerRepository repository;

  GetFutureServicesUseCase({required this.repository});

  @override
  Future<Either<Failure, List<ServicesModule>>> call(String) {
    // TODO: implement call
    return repository.getFutureServices();
  }
}
