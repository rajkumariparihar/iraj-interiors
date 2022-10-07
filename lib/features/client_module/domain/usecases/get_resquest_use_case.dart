
import 'package:flutter_bloc_demo/utils/status_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_demo/utils/usecase.dart';

import '../../data/datamodels/request_module.dart';
import '../repository/client_repository.dart';

class GetResquestUseCase extends UseCase<List<RequestModule>, NoParams> {
  ClientRepository repository;

  GetResquestUseCase({required this.repository});

  @override
  Future<Either<Failure, List<RequestModule>>> call(NoParams noParams) {
    // TODO: implement call
    return repository.getRequests();
  }
}
