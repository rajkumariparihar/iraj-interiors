part of 'customer_home_bloc.dart';

abstract class CustomerHomeEvent extends Equatable {
  const CustomerHomeEvent();

  @override
  List<Object> get props => [];
}

class GetFutureServices extends CustomerHomeEvent {
  GetFutureServices();
}

class GetProtfolioServices extends CustomerHomeEvent {
  GetProtfolioServices();
}
