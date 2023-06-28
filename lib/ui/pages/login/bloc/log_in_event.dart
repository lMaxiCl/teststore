part of 'log_in_bloc.dart';

abstract class LogInEvent {}

class LogIn extends LogInEvent {
  final String email;
  final String password;
  LogIn(this.email, this.password);
}
