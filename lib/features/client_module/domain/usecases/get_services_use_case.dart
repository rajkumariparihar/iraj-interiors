import 'package:flutter_bloc_demo/utils/status_objects.dart';

import 'package:dartz/dartz.dart';

import '../../../../utils/usecase.dart';
import '../../../customer_module/data/datamodels/services_module.dart';
import '../repository/client_repository.dart';

class GetServicesUseCase extends UseCase<List<ServicesModule>, String> {
  ClientRepository repository;

  GetServicesUseCase({required this.repository});

  @override
  Future<Either<Failure, List<ServicesModule>>> call(String params) {
    // TODO: implement call
    return repository.getServices();
  }
}
