part of 'log_in_bloc.dart';

abstract class LogInState {}

class LogInInitial extends LogInState {}

class LogInError extends LogInState {
  final String message;
  LogInError(this.message);
}
