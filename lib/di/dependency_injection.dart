import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc_demo/features/client_login/domain/usecases/register_user_use_case.dart';
import 'package:flutter_bloc_demo/features/client_module/data/datasource/client_data_source.dart';
import 'package:flutter_bloc_demo/features/client_module/data/datasource/client_data_source_impl.dart';
import 'package:flutter_bloc_demo/features/client_module/data/repository/client_repository_impl.dart';
import 'package:flutter_bloc_demo/features/client_module/domain/repository/client_repository.dart';
import 'package:flutter_bloc_demo/features/client_module/domain/usecases/get_resquest_use_case.dart';
import 'package:flutter_bloc_demo/features/client_module/domain/usecases/get_services_use_case.dart';
import 'package:flutter_bloc_demo/features/client_module/domain/usecases/upload_feature_use_case.dart';
import 'package:flutter_bloc_demo/features/client_module/domain/usecases/upoad_portfolio_use_case.dart';
import 'package:flutter_bloc_demo/features/client_module/presentation/bloc/feature/feature_bloc.dart';
import 'package:flutter_bloc_demo/features/customer_module/data/datasource/customer_data_source.dart';
import 'package:flutter_bloc_demo/features/customer_module/data/datasource/customer_data_source_impl.dart';
import 'package:flutter_bloc_demo/features/customer_module/data/repository/customer_repository_impl.dart';
import 'package:flutter_bloc_demo/features/customer_module/domain/repository/customer_repository.dart';
import 'package:flutter_bloc_demo/features/customer_module/domain/ussecase/get_future_services_use_case.dart';
import 'package:flutter_bloc_demo/features/customer_module/domain/ussecase/get_portfolio_services_use_cases.dart';
import 'package:flutter_bloc_demo/features/customer_module/domain/ussecase/submit_fetch_request_use_case.dart';
import 'package:flutter_bloc_demo/features/customer_module/presentation/bloc/bloc/customer_home_bloc.dart';
import 'package:flutter_bloc_demo/features/customer_module/presentation/bloc/get_in_touch/get_in_touch_bloc.dart';
import 'package:flutter_bloc_demo/features/demo_module/data/datasources/demo_data_source.dart';
import 'package:flutter_bloc_demo/features/demo_module/data/datasources/demo_data_source_impl.dart';
import 'package:flutter_bloc_demo/features/demo_module/data/repository/demo_repository_impl.dart';
import 'package:flutter_bloc_demo/features/demo_module/domain/repository/demo_repository.dart';
import 'package:flutter_bloc_demo/features/demo_module/domain/usecases/fetch_employees_use_case.dart';
import 'package:flutter_bloc_demo/features/demo_module/presentation/bloc/demo_bloc.dart';
import 'package:flutter_bloc_demo/features/client_login/domain/repository/login_repository.dart';
import 'package:flutter_bloc_demo/features/client_login/domain/usecases/login_user_use_case.dart';
import 'package:flutter_bloc_demo/utils/dio_api_client.dart';
import 'package:get_it/get_it.dart';

import '../features/client_login/data/datasource/login_data_source.dart';
import '../features/client_login/data/datasource/login_data_source_impl.dart';
import '../features/client_login/data/repository/login_repository_impl.dart';
import '../features/client_login/presentation/bloc/login/login_bloc.dart';
import '../features/client_module/domain/usecases/upload_services_use_case.dart';

final dcSl = GetIt.instance;

Future<void> initServiceLocator(DioApiClient dioApiClient) async {
  dcSl.registerLazySingleton<DioApiClient>(() => dioApiClient);
  dcSl.registerLazySingleton<FirebaseFirestore>(
      () => FirebaseFirestore.instance);
  dcSl.registerLazySingleton<FirebaseStorage>(() => FirebaseStorage.instance);

  // var db = FirebaseFirestore.instance;

  /// use cases here
  dcSl.registerLazySingleton(() => FetchEmployeesUseCase(repository: dcSl()));
  dcSl.registerLazySingleton(() => LoginUserUseCase(repository: dcSl()));
  dcSl.registerLazySingleton(
      () => SubmitFetchRequestUseCase(repository: dcSl()));
  dcSl.registerLazySingleton(() => UploadFeatureUseCase(repository: dcSl()));
  dcSl.registerLazySingleton(() => UploadServicesUseCase(repository: dcSl()));
  dcSl.registerLazySingleton(() => UpoadPortfolioUseCase(repository: dcSl()));

  dcSl.registerLazySingleton(() => GetResquestUseCase(repository: dcSl()));
  dcSl.registerLazySingleton(() => GetServicesUseCase(repository: dcSl()));
  dcSl.registerLazySingleton(
      () => GetPortfolioServicesUseCases(repository: dcSl()));
  dcSl.registerLazySingleton(
      () => GetFutureServicesUseCase(repository: dcSl()));
  dcSl.registerLazySingleton(() => RegisterUserUseCase(repository: dcSl()));

  /// blocs here
  dcSl.registerFactory(
    () => DemoBloc(
      fetchEmployeesUseCase: dcSl(),
    ),
  );
  dcSl.registerFactory(
    () => FeatureBloc(
        uploadFeatureUseCase: dcSl(),
        uploadServicesUseCase: dcSl(),
        upoadPortfolioUseCase: dcSl(),
        getResquestUseCase: dcSl(),
        getServicesUseCase: dcSl()),
  );
  dcSl.registerFactory(
    () => LoginBloc(
      loginUserUseCase: dcSl(),
      registerUserUseCase: dcSl(),
    ),
  );
  dcSl.registerFactory(
    () => GetInTouchBloc(
      submitFetchRequestUseCase: dcSl(),
    ),
  );
  dcSl.registerFactory(
    () => CustomerHomeBloc(
      getFutureServicesUseCase: dcSl(),
      getPortfolioServicesUseCases: dcSl(),
    ),
  );

  /// Data sources here
  dcSl.registerLazySingleton<DemoDataSource>(
    () => DemoDataSourceImpl(),
  );
  dcSl.registerLazySingleton<LoginDataSource>(
    () => LoginDataSourceImpl(),
  );
  dcSl.registerLazySingleton<CustomerDataSource>(
    () => CustomerDataSourceImpl(),
  );
  dcSl.registerLazySingleton<ClientDataSource>(
    () => ClientDataSourceImpl(),
  );

  /// Repositories here
  dcSl.registerLazySingleton<DemoRepository>(
      () => DemoRepositoryImpl(demoDataSource: dcSl()));
  dcSl.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImpl(loginDataSource: dcSl()));
  dcSl.registerLazySingleton<CustomerRepository>(
      () => CustomerRepositoryImpl(customerDataSource: dcSl()));
  dcSl.registerLazySingleton<ClientRepository>(
      () => ClientRepositoryImpl(clientDataSource: dcSl()));
}
