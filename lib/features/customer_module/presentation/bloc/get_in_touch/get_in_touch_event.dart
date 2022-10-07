part of 'get_in_touch_bloc.dart';

abstract class GetInTouchEvent extends Equatable {
  const GetInTouchEvent();

  @override
  List<Object> get props => [];
}

class SubmitPresssed extends GetInTouchEvent {
  final String name;
  final String last_name;
  final String email;
  final String company_name;
  final String mobile;
  final String country;
  final String description;

  const SubmitPresssed(
      {required this.name,
      required this.last_name,
      required this.email,
      required this.company_name,
      required this.mobile,
      required this.country,
      required this.description});

  @override
  List<Object> get props =>
      [name, last_name, email, company_name, mobile, country, description];
}
