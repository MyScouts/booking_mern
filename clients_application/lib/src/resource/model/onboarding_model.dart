class OnboardingModel {
  String? imagePath;
  String? backgroundColor;
  String? title;
  String? description;

  OnboardingModel(
      {this.backgroundColor, this.description, this.imagePath, this.title});

  static fakeOnboarding() {
    return <OnboardingModel>[
      new OnboardingModel(
          title: "Get inspired",
          description:
              "Don't, know what to eat? Take a picture, we'll suggest things to cook with your ingredients. ",
          backgroundColor: 'FEAE4F',
          imagePath: 'assets/images/onboarding-1.png'),
      new OnboardingModel(
          title: "Easy & Healthy",
          description:
              "Find thoughsands of easy and healthy recipes so you save time and eat better. ",
          backgroundColor: 'FEBE96',
          imagePath: 'assets/images/onboarding-2.png'),
      new OnboardingModel(
          title: "Save your favorites",
          description:
              "Save your favorites recipes and get reminders to buy the ingredients to cook them.",
          backgroundColor: '1EB091',
          imagePath: 'assets/images/onboarding-3.png'),
    ];
  }
}
