import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../constants/colors.dart';

class GreyText extends StatelessWidget {
  final String text;
  const GreyText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.nunito(
          color: CustomColors.cA8A6A7,
          fontWeight: FontWeight.bold,
          fontSize: 16.sp),
    );
  }
}
