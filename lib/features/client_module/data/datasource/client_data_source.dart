import 'package:flutter_bloc_demo/features/client_module/data/datamodels/request_module.dart';
import 'package:flutter_bloc_demo/features/customer_module/data/datamodels/services_module.dart';

abstract class ClientDataSource {
  Future<String> uploadFeature(
      {required String name,
      required String details,
      required String image_url});

  Future<String> uploadService(
      {required String name,
      required String details,
      required String image_url});

  Future<String> uploadPortfolio(
      {required String serviceType,
      required String serviceName,
      required String duration,
      required List<String> images});

  Future<List<RequestModule>> getRequests();

  Future<List<ServicesModule>> getServices();
}
