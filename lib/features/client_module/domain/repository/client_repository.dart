import 'package:dartz/dartz.dart';

import '../../../../utils/status_objects.dart';
import '../../../customer_module/data/datamodels/services_module.dart';
import '../../data/datamodels/request_module.dart';

abstract class ClientRepository {
  Future<Either<Failure, String>> uploadFeature(
      {required String name,
      required String details,
      required String imageUrl});

  Future<Either<Failure, String>> uploadServices(
      {required String name,
      required String details,
      required String imageUrl});

  Future<Either<Failure, String>> uploadPortfolio({
    required String serviceType,
    required String serviceName,
    required String duration,
    required List<String> images,
  });

  Future<Either<Failure, List<RequestModule>>> getRequests();

  Future<Either<Failure, List<ServicesModule>>> getServices();
}
