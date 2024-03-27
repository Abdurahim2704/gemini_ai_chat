import 'package:firebase_auth/firebase_auth.dart';
import 'package:gemini_tutorial/features/auth/domain/entities/user_entity.dart';
import 'package:gemini_tutorial/features/auth/domain/repository/auth_repository.dart';

class AuthService extends AuthRepository {
  final auth = FirebaseAuth.instance;
  @override
  Future<bool> deleteAccount() async {
    try {
      await auth.currentUser?.delete();
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  @override
  Future<UserEntity> signIn(String email, String password) async {
    final credential =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    return UserEntity(
        name: credential.user?.displayName ?? "",
        id: credential.user!.uid,
        email: credential.user!.email!);
  }

  @override
  Future<bool> signOut() async {
    try {
      await auth.signOut();
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  @override
  Future<bool> signUp(String name, String email, String password) async {
    try {
      final credentials = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await credentials.user?.updateDisplayName(name);
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  @override
  Future<bool> isEmailVerified() async {
    await auth.currentUser?.reload();
    return auth.currentUser?.emailVerified ?? false;
  }

  bool isEmailVerifiedNoStream() {
    return auth.currentUser?.emailVerified ?? false;
  }

  @override
  Future<void> verifyEmail() async {
    await auth.currentUser?.sendEmailVerification();
  }
}
