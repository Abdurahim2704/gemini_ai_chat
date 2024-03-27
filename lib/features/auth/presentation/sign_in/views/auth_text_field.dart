import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../constants/colors.dart';

class AuthTextField extends StatefulWidget {
  final String text;
  final TextEditingController controller;
  final bool isPassword;
  const AuthTextField(
      {super.key,
      required this.text,
      required this.controller,
      this.isPassword = false});

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: isVisible,
      decoration: InputDecoration(
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: CustomColors.cA8A6A7)),
          hintText: widget.text,
          hintStyle: GoogleFonts.nunito(
            color: CustomColors.cA8A6A7,
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
          ),
          suffixIcon: widget.isPassword
              ? IconButton(
                  onPressed: () {
                    isVisible = !isVisible;
                    setState(() {});
                  },
                  icon:
                      Icon(isVisible ? Icons.visibility : Icons.visibility_off),
                )
              : null),
    );
  }
}
