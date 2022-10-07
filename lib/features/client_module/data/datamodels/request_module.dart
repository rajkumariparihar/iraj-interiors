class RequestModule {
  String? id;
  String? mobile;
  String? first;
  String? last;
  String? email;
  String? details;
  String? address;
  String? company;

  RequestModule(
      {required this.id,
      required this.first,
      required this.last,
      required this.email,
      required this.mobile,
      required this.address,
      required this.company,
      required this.details});
}
