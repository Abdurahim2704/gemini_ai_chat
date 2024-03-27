part of 'auth_bloc.dart';

@immutable
abstract class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthErrorState extends AuthState {
  final String message;

  const AuthErrorState({required this.message});
}

class SignUpSuccessState extends AuthState {}

class EmailNotVerifiedState extends AuthState {}

class SignInSuccessState extends AuthState {
  final UserEntity userEntity;

  const SignInSuccessState({required this.userEntity});
}

class VerificationSentState extends AuthState {}
