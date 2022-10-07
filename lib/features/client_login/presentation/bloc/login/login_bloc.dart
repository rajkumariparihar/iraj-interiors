import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/features/client_login/domain/usecases/register_user_use_case.dart';
import 'package:flutter_bloc_demo/features/client_login/domain/usecases/login_user_use_case.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUserUseCase loginUserUseCase;
  final RegisterUserUseCase registerUserUseCase;
  LoginBloc({required this.loginUserUseCase, required this.registerUserUseCase})
      : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<LoginUser>(
      (event, emit) async {
        final result = await loginUserUseCase(FetchLoginListParams(
            username: event.email, password: event.password));

        emit(result.fold(
          (error) => ErrorState(error.message),
          (success) => LoginResponsee(response: success),
        ));
      },
    );
  }
}
