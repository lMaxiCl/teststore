import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teststore/tools/auth.dart';

part 'log_in_event.dart';
part 'log_in_state.dart';

class LogInBloc extends Bloc<LogInEvent, LogInState> {
  final AuthManager authManager;
  LogInBloc(this.authManager) : super(LogInInitial()) {
    on<LogIn>((event, emit) async {
      try {
        await authManager.login(event.email, event.password);
      } on AuthResultError catch (e) {
        emit(
          LogInError(e.error),
        );
      }
    });
  }
}
