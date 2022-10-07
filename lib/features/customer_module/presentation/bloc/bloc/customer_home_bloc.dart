import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_demo/features/customer_module/data/datamodels/portfolio_module.dart';
import 'package:flutter_bloc_demo/features/customer_module/domain/ussecase/get_future_services_use_case.dart';
import 'package:flutter_bloc_demo/features/customer_module/domain/ussecase/get_portfolio_services_use_cases.dart';

import '../../../data/datamodels/services_module.dart';

part 'customer_home_event.dart';
part 'customer_home_state.dart';

class CustomerHomeBloc extends Bloc<CustomerHomeEvent, CustomerHomeState> {
  GetFutureServicesUseCase getFutureServicesUseCase;
  GetPortfolioServicesUseCases getPortfolioServicesUseCases;

  CustomerHomeBloc(
      {required this.getFutureServicesUseCase,
      required this.getPortfolioServicesUseCases})
      : super(CustomerHomeInitial()) {
    on<CustomerHomeEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<GetFutureServices>((event, emit) async {
      final result = await getFutureServicesUseCase('');

      emit(result.fold(
        (error) => ErrorState(error.message),
        (success) => FutureServicesList(futureServices: success),
      ));
    });
    on<GetProtfolioServices>((event, emit) async {
      print('gone to get the data in use case');
      final result = await getPortfolioServicesUseCases('');
      print('was here');

      emit(result.fold(
        (error) => ErrorState(error.message),
        (success) => ProtfolioList(portfolio_list: success),
      ));
    });
  }
}
