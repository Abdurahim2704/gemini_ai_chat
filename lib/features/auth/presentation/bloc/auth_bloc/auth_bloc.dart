import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gemini_tutorial/features/auth/domain/entities/user_entity.dart';
import 'package:gemini_tutorial/features/auth/domain/repository/auth_repository.dart';
import 'package:gemini_tutorial/locator.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<SignUpEvent>(signUpEvent);
    on<EmailVerifiedEvent>(_emailVerified);
    on<SignInEvent>(signInEvent);
  }

  Future<void> signUpEvent(SignUpEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    final result = await getIt<AuthRepository>()
        .signUp(event.name, event.email, event.password);
    if (result) {
      emit(EmailNotVerifiedState());
      await getIt<AuthRepository>().verifyEmail();
      emit(VerificationSentState());
      return;
    }
    emit(const AuthErrorState(message: "Sign Up error"));
  }

  void _emailVerified(EmailVerifiedEvent event, Emitter<AuthState> emit) async {
    emit(SignUpSuccessState());
  }

  Future<void> signInEvent(SignInEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    final userEntity =
        await getIt<AuthRepository>().signIn(event.email, event.password);
    emit(SignInSuccessState(userEntity: userEntity));
  }
}
