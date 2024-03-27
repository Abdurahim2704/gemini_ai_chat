import 'package:concentric_transition/page_view.dart';
import 'package:flutter/material.dart';
import 'package:gemini_tutorial/features/auth/presentation/onboarding/views/mainPage_widget.dart';

import '../../data/models/onboarding_contents.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConcentricPageView(
        itemBuilder: (index) {
          final page = contents[index % contents.length];
          return SafeArea(
              child: MainPageWidget(
            page: page,
            isWhiteColor: index.isEven,
          ));
        },
        nextButtonBuilder: (context) => const Icon(
          Icons.arrow_forward,
          color: Colors.black,
        ),
        colors: const [
          Color(0xff1371ff),
          Colors.white,
        ],
      ),
    );
  }
}
