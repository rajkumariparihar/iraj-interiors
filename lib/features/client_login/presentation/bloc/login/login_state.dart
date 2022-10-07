part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginResponsee extends LoginState {
  String response;

  LoginResponsee({required this.response});
}

class RegisterResponse extends LoginState {
  String response;

  RegisterResponse({required this.response});
}

class ErrorState extends LoginState {
  final String message;

  ErrorState(this.message);
}
