import 'package:flutter_bloc_demo/features/customer_module/data/datamodels/portfolio_module.dart';
import 'package:flutter_bloc_demo/features/customer_module/data/datamodels/services_module.dart';

abstract class CustomerDataSource {
  Future<String> submitTouchRequest({
    required String name,
    required String last_name,
    required String email,
    required String company_name,
    required String mobile,
    required String country,
    required String description,
  });

  Future<List<ServicesModule>> getFutureServices();

  Future<List<PortfolioModule>> getProtfolio();
}
