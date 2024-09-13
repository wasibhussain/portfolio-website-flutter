import 'package:flutter/material.dart';
import 'package:portfolio_site/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class FeaturedProjects extends StatelessWidget {
  const FeaturedProjects({super.key});

  Container buildProjectContainer(
      {required Size mediaQuery,
      required String projectName,
      required ThemeProvider provider,
      imageUrl,
      privicyStatus,
      description}) {
    return Container(
      // width: mediaQuery.width * 0.56,
      decoration: BoxDecoration(
          border: Border.all(
              color: provider.isDarkTheme ? Colors.white : Colors.black),
          color: Colors.black.withOpacity(0.05),
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      projectName,
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        fontFamily: "Inter",
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadiusDirectional.circular(20)),
                      child: Row(
                        children: [
                          Image.network(
                            "https://github.githubassets.com/assets/GitHub-Mark-ea2971cee799.png",
                            width: 20,
                            height: 20,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            privicyStatus,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontFamily: "Inter"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: mediaQuery.height * 0.04),
                SizedBox(
                  width: mediaQuery.width * 0.3,
                  child: Text(
                    description,
                    style: const TextStyle(fontFamily: "Inter"),
                  ),
                ),
                SizedBox(height: mediaQuery.height * 0.05),
                Row(
                  children: [
                    buildSkillContainer(title: "Flutter"),
                    SizedBox(width: mediaQuery.width * 0.003),
                    buildSkillContainer(title: "Dart"),
                    SizedBox(width: mediaQuery.width * 0.003),
                    buildSkillContainer(title: "Android"),
                    SizedBox(width: mediaQuery.width * 0.003),
                  ],
                ),
                SizedBox(height: mediaQuery.height * 0.01),
                Row(
                  children: [
                    buildSkillContainer(title: "iOS"),
                    SizedBox(width: mediaQuery.width * 0.003),
                    buildSkillContainer(title: "MySQL"),
                    SizedBox(width: mediaQuery.width * 0.003),
                    buildSkillContainer(title: "Design"),
                    SizedBox(width: mediaQuery.width * 0.003),
                  ],
                ),
                SizedBox(height: mediaQuery.height * 0.02),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                imageUrl,
                width: 300,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }

  Container buildSkillContainer({String? title}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadiusDirectional.circular(20)),
      child: Text(
        title!,
        style: const TextStyle(color: Colors.black, fontFamily: "Inter"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    var provider = Provider.of<ThemeProvider>(context);
    return Column(
      children: [
        buildProjectContainer(
            provider: provider,
            imageUrl: "assets/images/hey_smarty.png",
            mediaQuery: mediaQuery,
            projectName: "HeySmarty",
            privicyStatus: "public",
            description:
                "Developed HeySmarty, an AI-powered mobile app for intelligent query responses, featuring speech-to-text, voice-to-voice, dark/light themes, and font resizing. Integrated secure logins with Google, Apple, and custom sign-ins. Enabled chat categorization, local saving, and custom folder creation. Fine-tuned ChatGPT with business data for tailored responses and optimized performance."),
        SizedBox(height: mediaQuery.height * 0.02),
        buildProjectContainer(
            provider: provider,
            imageUrl: "assets/images/nutriwest.png",
            mediaQuery: mediaQuery,
            projectName: "Nutri-west",
            privicyStatus: "public",
            description:
                "Developed a mobile app for NutriWest with comprehensive features. Users can navigate and search for products by category, ingredient, or health condition. Implemented an intuitive 'Add to Cart' functionality, push notifications, and optimized heavy images for performance. Created an iOS version for consistent cross-platform experience. Deployed on Play Store and Apple Store. "),
        SizedBox(height: mediaQuery.height * 0.02),
        buildProjectContainer(
            provider: provider,
            imageUrl: "assets/images/bag saver.jpg",
            mediaQuery: mediaQuery,
            projectName: "Bag Saver",
            privicyStatus: "public",
            description:
                "Built a background location service app that sends reminders when users are near their saved destinations, offering real-time tracking and notification customization."),
        SizedBox(height: mediaQuery.height * 0.02),
        buildProjectContainer(
            provider: provider,
            imageUrl: "assets/images/SRSO_logo.png",
            mediaQuery: mediaQuery,
            projectName: "SRSO",
            privicyStatus: "public",
            description:
                "Developed the Sarso App, a mobile solution for complaint registration, CNIC verification, and SMS OTP for enhanced security. Integrated email and password authentication, and enabled users to submit complaints with text, voice, video, and document uploads. Added functionality to allow users to view and track their complaints in real-time, improving transparency and communication."),
      ],
    );
  }
}
