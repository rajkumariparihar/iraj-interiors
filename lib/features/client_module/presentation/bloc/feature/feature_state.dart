part of 'feature_bloc.dart';

abstract class FeatureState extends Equatable {
  const FeatureState();

  @override
  List<Object> get props => [];
}

class FeatureInitial extends FeatureState {}

class ErrorState extends FeatureState {
  final String message;

  ErrorState(this.message);
}

class FeatureUploaded extends FeatureState {
  String response;

  FeatureUploaded({required this.response});
}

class ServiceUploaded extends FeatureState {
  String response;

  ServiceUploaded({required this.response});
}

class PorfolioUploaded extends FeatureState {
  String response;

  PorfolioUploaded({required this.response});
}

class RequestsList extends FeatureState {
  List<RequestModule> requests;

  RequestsList({required this.requests});
}

class ServicesList extends FeatureState {
  List<ServicesModule> services;

  ServicesList({required this.services});
}
