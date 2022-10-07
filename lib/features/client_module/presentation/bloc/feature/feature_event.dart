part of 'feature_bloc.dart';

abstract class FeatureEvent extends Equatable {
  const FeatureEvent();

  @override
  List<Object> get props => [];
}

class AddFeatureEvent extends FeatureEvent {
  final String name, description, image_url;

  AddFeatureEvent(
      {required this.name, required this.description, required this.image_url});
}

class AddServicesEvent extends FeatureEvent {
  final String name, description, image_url;

  AddServicesEvent(
      {required this.name, required this.description, required this.image_url});
}

class AddProfolio extends FeatureEvent {
  final String serviceType, serviceName, serviceDuration;
  final List<String> images;

  AddProfolio({
    required this.serviceType,
    required this.serviceName,
    required this.serviceDuration,
    required this.images,
  });
}

class GetServicesEvent extends FeatureEvent {
  GetServicesEvent();
}

class GetRequestsEvent extends FeatureEvent {
  GetRequestsEvent();
}

class GetFeaturesEvent extends FeatureEvent {
  GetFeaturesEvent();
}
