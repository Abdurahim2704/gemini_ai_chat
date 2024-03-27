import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gemini_tutorial/constants/colors.dart';
import 'package:gemini_tutorial/constants/images.dart';
import 'package:gemini_tutorial/features/auth/domain/repository/auth_repository.dart';
import 'package:gemini_tutorial/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:gemini_tutorial/features/auth/presentation/sign_up/views/auth_text_field.dart';
import 'package:gemini_tutorial/features/auth/presentation/sign_up/views/grey_text.dart';
import 'package:gemini_tutorial/locator.dart';
import 'package:gemini_tutorial/pages/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final confirmPassCtrl = TextEditingController();
  bool isGone = false;
  bool isVerified = false;
  @override
  void initState() {
    super.initState();
    final timer = Timer(const Duration(seconds: 3), () async {
      final result = await getIt<AuthRepository>().isEmailVerified();
      if (result != isVerified) {
        isVerified = result;
        setState(() {});
      }
    });
    context.read<AuthBloc>().stream.listen((event) {
      if (event is AuthErrorState) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(event.message)));
      }
      if (isVerified) {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BlocConsumer<AuthBloc, AuthState>(
            builder: (context, state) {
              return FutureBuilder(
                future: getIt<AuthRepository>().isEmailVerified(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.done:
                      return !(snapshot.data ?? false) &&
                              (state is VerificationSentState)
                          ? const Center(
                              child: CircularProgressIndicator.adaptive(),
                            )
                          : const SizedBox.shrink();
                    default:
                      return const SizedBox.shrink();
                  }
                },
              );
            },
            listener: (context, state) {
              if (state is SignUpSuccessState) {
                if (!isGone) {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return const HomePage();
                    },
                  ));
                  isGone = true;
                }
              }
            },
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: SvgPicture.asset(CustomImages.signUpPattern)),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "Sign Up",
                  style: GoogleFonts.nunito(
                      fontSize: 40.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 30.h,
                ),
                const GreyText(text: "First Create Your Account"),
                SizedBox(
                  height: 100.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 36.w),
                  child: Form(
                      autovalidateMode: AutovalidateMode.always,
                      child: Column(
                        children: [
                          AuthTextField(
                            text: "Full name",
                            controller: nameCtrl,
                          ),
                          AuthTextField(
                            text: "Email",
                            controller: emailCtrl,
                          ),
                          AuthTextField(
                            text: "Password",
                            controller: passCtrl,
                            isPassword: true,
                          ),
                          AuthTextField(
                            text: "Confirm your password",
                            controller: confirmPassCtrl,
                            isPassword: true,
                          ),
                        ],
                      )),
                ),
                SizedBox(
                  height: 45.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.w),
                  child: ElevatedButton(
                      onPressed: () {
                        context.read<AuthBloc>().add(SignUpEvent(
                            name: nameCtrl.text,
                            email: emailCtrl.text,
                            password: passCtrl.text));
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: EdgeInsets.symmetric(vertical: 7.h)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'SIGN UP',
                            textAlign: TextAlign.right,
                            style: GoogleFonts.nunito(
                              color: Colors.white,
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      )),
                ),
                SizedBox(
                  height: 18.h,
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Already have an account? ',
                        style: GoogleFonts.nunito(
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: 'Login',
                        style: GoogleFonts.nunito(
                          color: CustomColors.c56CCF2,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          FontAwesomeIcons.google,
                          size: 40,
                        ))
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
