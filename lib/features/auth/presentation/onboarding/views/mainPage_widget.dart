import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/models/onboarding_contents.dart';

class MainPageWidget extends StatelessWidget {
  final bool isWhiteColor;
  const MainPageWidget({
    super.key,
    required this.page,
    required this.isWhiteColor,
  });
  final OnboardingContents page;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height * .45,
              child: Image.asset(page.image)),
          const SizedBox(height: 40),
          Text(
            page.title,
            style: GoogleFonts.merriweather(
              fontWeight: FontWeight.bold,
              color: isWhiteColor ? Colors.white : null,
              fontSize: MediaQuery.of(context).size.width * .07,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Text(
            page.desc,
            style: GoogleFonts.playfair(
              color: isWhiteColor ? Colors.white : Colors.grey[800],
              fontWeight: FontWeight.w400,
              fontSize: MediaQuery.of(context).size.width * .042,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .05,
          )
        ],
      ),
    );
  }
}
