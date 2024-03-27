part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class SignUpEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;

  const SignUpEvent({
    required this.name,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [name, email, password];
}

class SignInEvent extends AuthEvent {
  final String email;
  final String password;

  const SignInEvent({
    required this.password,
    required this.email,
  });

  @override
  List<Object?> get props => [email, password];
}

class SignOutEvent extends AuthEvent {
  @override
  List<Object?> get props => [];
}

class DeleteAccountEvent extends AuthEvent {
  @override
  List<Object?> get props => [];
}

class EmailVerifiedEvent extends AuthEvent {
  @override
  List<Object?> get props => [];
}
