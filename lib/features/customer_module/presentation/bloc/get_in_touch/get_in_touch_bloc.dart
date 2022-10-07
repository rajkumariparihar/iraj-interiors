import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_demo/features/customer_module/domain/ussecase/submit_fetch_request_use_case.dart';

part 'get_in_touch_event.dart';
part 'get_in_touch_state.dart';

class GetInTouchBloc extends Bloc<GetInTouchEvent, GetInTouchState> {
  final SubmitFetchRequestUseCase submitFetchRequestUseCase;

  GetInTouchBloc({required this.submitFetchRequestUseCase})
      : super(GetInTouchInitial()) {
    on<GetInTouchEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<SubmitPresssed>(((event, emit) async {
      emit(GetInTouchPressed());
      final result = await submitFetchRequestUseCase(SubmitTouchRequestParams(
          name: event.name,
          company_name: event.company_name,
          last_name: event.last_name,
          email: event.email,
          mobile: event.mobile,
          country: event.country,
          description: event.description));

      emit(result.fold(
        (error) => ErrorSubmission(error.message),
        (success) => GetInTouchSubmitted(message: success),
      ));
    }));
  }
}
