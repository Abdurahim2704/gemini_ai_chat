class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "Got Questions? We've Got Answers!",
    image: "assets/images/image1.png",
    desc: "Get answers for your ultimate questions",
  ),
  OnboardingContents(
    title: "Get Ready to Chat !!!",
    image: "assets/images/image2.png",
    desc: "Chat with your AI helper and discuss about thoughts",
  ),
];
