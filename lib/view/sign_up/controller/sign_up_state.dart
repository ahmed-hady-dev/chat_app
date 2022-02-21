part of 'sign_up_cubit.dart';

@immutable
abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

//===============================================================
class SignUpChangePasswordVisibilityState extends SignUpState {}
//===============================================================

class SignUpLoadingState extends SignUpState {}

class SignUpSuccessState extends SignUpState {}

class SignUpFailedState extends SignUpState {
  final String msg;

  SignUpFailedState({required this.msg});
}
