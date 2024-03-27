import 'package:firebase_core/firebase_core.dart';
import 'package:gemini_tutorial/features/auth/data/services/auth_service.dart';
import 'package:gemini_tutorial/features/auth/domain/repository/auth_repository.dart';
import 'package:get_it/get_it.dart';

import 'firebase_options.dart';

late final GetIt getIt;

Future<void> setUp() async {
  getIt = GetIt.instance;
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  getIt.registerSingleton<AuthRepository>(AuthService());
}
