import 'package:gemini_tutorial/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<bool> signUp(String name, String email, String password);
  Future<UserEntity> signIn(String email, String password);
  Future<bool> signOut();
  Future<bool> deleteAccount();

  Future<void> verifyEmail();
  Future<bool> isEmailVerified();
  bool isEmailVerifiedNoStream();
}
