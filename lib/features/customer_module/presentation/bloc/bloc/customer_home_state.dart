part of 'customer_home_bloc.dart';

abstract class CustomerHomeState extends Equatable {
  const CustomerHomeState();

  @override
  List<Object> get props => [];
}

class CustomerHomeInitial extends CustomerHomeState {}

class FutureServicesList extends CustomerHomeState {
  final List<ServicesModule> futureServices;

  FutureServicesList({required this.futureServices});
}

class ProtfolioList extends CustomerHomeState {
  final List<PortfolioModule> portfolio_list;

  ProtfolioList({required this.portfolio_list});
}

class ErrorState extends CustomerHomeState {
  final String message;

  ErrorState(this.message);
}
