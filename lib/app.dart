import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gemini_tutorial/bloc/chat_bloc/chat_bloc.dart';
import 'package:gemini_tutorial/bloc/response/response_bloc.dart';
import 'package:gemini_tutorial/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:gemini_tutorial/features/auth/presentation/sign_up/signup.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ChatBloc()..add(FetchHistory()),
        ),
        BlocProvider(create: (context) => ResponseBloc()),
        BlocProvider(
          create: (context) => AuthBloc(),
        )
      ],
      child: const ScreenUtilInit(
        designSize: Size(375, 812),
        minTextAdapt: true,
        child: MaterialApp(
          themeMode: ThemeMode.dark,
          debugShowCheckedModeBanner: false,
          home: SignUpPage(),
        ),
      ),
    );
  }
}
