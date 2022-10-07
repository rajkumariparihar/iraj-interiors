part of 'get_in_touch_bloc.dart';

abstract class GetInTouchState extends Equatable {
  const GetInTouchState();

  @override
  List<Object> get props => [];
}

class GetInTouchInitial extends GetInTouchState {}

class GetInTouchPressed extends GetInTouchState {}

class GetInTouchSubmitted extends GetInTouchState {
  String message;

  GetInTouchSubmitted({required this.message});
}

class ErrorSubmission extends GetInTouchState {
  String error;

  ErrorSubmission(this.error);
}
