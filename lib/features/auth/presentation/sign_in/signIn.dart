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
import 'package:google_fonts/google_fonts.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final confirmPassCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();

    context.read<AuthBloc>().stream.listen((event) {
      if (event is AuthErrorState) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(event.message)));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BlocBuilder(
            builder: (context, state) {},
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
                  "Sign In",
                  style: GoogleFonts.nunito(
                      fontSize: 40.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 30.h,
                ),
                const GreyText(text: "Enter Your Email And Password"),
                SizedBox(
                  height: 140.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 36.w),
                  child: Form(
                      autovalidateMode: AutovalidateMode.always,
                      child: Column(
                        children: [
                          AuthTextField(
                            text: "Email",
                            controller: emailCtrl,
                          ),
                          AuthTextField(
                            text: "Password",
                            controller: passCtrl,
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
                            'LOG IN',
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
                        text: "Don't have an account",
                        style: GoogleFonts.nunito(
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: ' Sign Up',
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
