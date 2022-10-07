import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/features/client_module/data/datamodels/request_module.dart';
import 'package:flutter_bloc_demo/features/client_module/domain/usecases/get_resquest_use_case.dart';
import 'package:flutter_bloc_demo/features/client_module/domain/usecases/get_services_use_case.dart';
import 'package:flutter_bloc_demo/features/client_module/domain/usecases/upload_feature_use_case.dart';
import 'package:flutter_bloc_demo/features/client_module/domain/usecases/upload_services_use_case.dart';
import 'package:flutter_bloc_demo/features/client_module/domain/usecases/upoad_portfolio_use_case.dart';
import 'package:flutter_bloc_demo/features/customer_module/data/datamodels/services_module.dart';
import 'package:flutter_bloc_demo/utils/status_objects.dart';

part 'feature_event.dart';
part 'feature_state.dart';

class FeatureBloc extends Bloc<FeatureEvent, FeatureState> {
  final UploadFeatureUseCase uploadFeatureUseCase;
  final UploadServicesUseCase uploadServicesUseCase;
  final UpoadPortfolioUseCase upoadPortfolioUseCase;
  final GetResquestUseCase getResquestUseCase;
  final GetServicesUseCase getServicesUseCase;

  FeatureBloc(
      {required this.uploadFeatureUseCase,
      required this.upoadPortfolioUseCase,
      required this.uploadServicesUseCase,
      required this.getResquestUseCase,
      required this.getServicesUseCase})
      : super(FeatureInitial()) {
    on<FeatureEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<AddFeatureEvent>((event, emit) async {
      final result = await uploadFeatureUseCase(FetchFeatureListParams(
          name: event.name,
          description: event.description,
          image_url: event.image_url));

      emit(result.fold(
        (error) => ErrorState(error.message),
        (success) => FeatureUploaded(response: success),
      ));
    });

    on<AddServicesEvent>((event, emit) async {
      final result = await uploadServicesUseCase(FetchServiceListParams(
          name: event.name,
          description: event.description,
          image_url: event.image_url));

      emit(result.fold(
        (error) => ErrorState(error.message),
        (success) => ServiceUploaded(response: success),
      ));
    });

    on<GetRequestsEvent>((event, emit) async {
      final result = await getResquestUseCase(NoParams());

      emit(result.fold(
        (error) => ErrorState(error.message),
        (success) => RequestsList(requests: success),
      ));
    });

    on<GetServicesEvent>((event, emit) async {
      final result = await getServicesUseCase('');

      emit(result.fold(
        (error) => ErrorState(error.message),
        (success) => ServicesList(services: success),
      ));
    });

    on<AddProfolio>(
      (event, emit) async {
        final result = await upoadPortfolioUseCase(FetchPortfolioListParams(
          serviceType: event.serviceType,
          serviceName: event.serviceName,
          duration: event.serviceDuration,
          images: event.images,
        ));

        emit(result.fold(
          (error) => ErrorState(error.message),
          (success) => PorfolioUploaded(response: success),
        ));
      },
    );
  }
}
