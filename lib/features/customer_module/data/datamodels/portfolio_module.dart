class PortfolioModule {
  String id;
  String serviceType;
  String serviceName;
  String serviceDuration;
  List<String> serviceImages;

  PortfolioModule({
    required this.id,
    required this.serviceType,
    required this.serviceName,
    required this.serviceDuration,
    required this.serviceImages,
  });
}
