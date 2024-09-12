import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_site/core/custom_animated_button.dart';
import 'package:portfolio_site/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final featuredProjectsKey = GlobalKey();
  final aboutMeKey = GlobalKey();

  _linkedin() async {
    const url = 'https://www.linkedin.com/in/wasibhussain/';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  final Shader linearGradient = const LinearGradient(
    colors: [
      Color(0xff6366f1), // Blue-ish color
      Color(0xff475569) // Gray-ish color
    ],
    // begin: Alignment.topLeft,
    // end: Alignment.bottomRight,
    // stops: [0.3, 0.8],
  ).createShader(
    const Rect.fromLTWH(200.0, 500.0, 600.0, 200.0), // Adjust the Rect size
  );

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    return Scaffold(body: SingleChildScrollView(child: SafeArea(
        child: Consumer<ThemeProvider>(builder: (context, provider, child) {
      return Column(children: [
        SizedBox(
          height: mediaQuery.height * 0.04,
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Center(
            child: Container(
                decoration: BoxDecoration(
                    color: provider.isDarkTheme
                        ? Colors.white.withOpacity(0.2)
                        : Colors.black.withOpacity(0.04),
                    borderRadius: BorderRadius.circular(20)),
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  const Text(
                    "Wasib Zameer",
                    style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.7),
                  ),
                  SizedBox(
                    width: mediaQuery.width * 0.37,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Scrollable.ensureVisible(
                            featuredProjectsKey.currentContext!,
                            duration: const Duration(seconds: 1),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: const Text(
                          "Projects",
                          style:
                              TextStyle(fontFamily: "Fira Code", fontSize: 18),
                        ),
                      ),
                      SizedBox(
                        width: mediaQuery.width * 0.01,
                      ),
                      GestureDetector(
                        onTap: () {
                          Scrollable.ensureVisible(
                            aboutMeKey.currentContext!,
                            duration: const Duration(seconds: 1),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: const Text(
                          "About Me",
                          style:
                              TextStyle(fontFamily: "Fira Code", fontSize: 18),
                        ),
                      ),
                      SizedBox(
                        width: mediaQuery.width * 0.01,
                      ),
                      GestureDetector(
                        onTap: () {
                          provider.changeTheme();
                        },
                        child: Icon(
                          provider.isDarkTheme
                              ? Icons.light_mode
                              : Icons.light_mode_outlined,
                          size: 25,
                        ),
                      )
                    ],
                  )
                ])),
          ),
          SizedBox(
            height: mediaQuery.height * 0.18,
          ),
          const Text(
            "WASIB ZAMEER,",
            style: TextStyle(
                fontSize: 60, fontWeight: FontWeight.bold, fontFamily: "Inter"),
          ),
          Text(
            "I design and develop \nimpactful mobile applications.",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 60,
                fontFamily: "Inter",
                fontWeight: FontWeight.bold,
                foreground: Paint()..shader = linearGradient),
          ),
          SizedBox(
            height: mediaQuery.height * 0.02,
          ),
          const Text(
            "I am a Flutter enthusiast — constantly evolving, driven by a passion for innovation and a desire to create apps that make a difference.",
            style: TextStyle(fontStyle: FontStyle.italic, fontFamily: "Inter"),
          ),
          SizedBox(
            height: mediaQuery.height * 0.02,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedButton(
                text: "Contact Me",
                onTap: () => _linkedin(),
              ),
              SizedBox(
                width: mediaQuery.width * 0.01,
              ),
              AnimatedButton(
                text: "LinkedIn",
                onTap: () => _linkedin(),
              ),
            ],
          ),
          SizedBox(
            height: mediaQuery.height * 0.4,
          ),
          Column(
            children: [
              SizedBox(
                  key: aboutMeKey,
                  height: mediaQuery.height * 0.05), //for spacing
              SizedBox(
                height: mediaQuery.height * 0.01,
              ),
              const Text(
                "About Me",
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 55,
                    fontFamily: "Inter"),
              ),
              SizedBox(
                height: mediaQuery.height * 0.01,
              ),
              SizedBox(
                width: mediaQuery.width * 0.5,
                child: const Text(
                  "I’m Wasib, a passionate Flutter developer with a keen eye for detail and a commitment to creating high-quality mobile applications. With over 3 years of experience in building cross-platform apps, I specialize in delivering seamless user experiences through clean, scalable code. I have a strong foundation in both frontend and backend development, utilizing technologies like Flutter, Dart, REST APIs, and Firebase to bring innovative ideas to life. My expertise extends beyond app development, as I focus on optimizing performance, implementing smooth animations, and ensuring responsiveness across different screen sizes. Driven by curiosity and a constant desire to learn, I stay updated with the latest trends in mobile development, applying new techniques to improve functionality and design. My goal is to create impactful, user-centered applications that make a difference in people’s daily lives.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14, letterSpacing: 0.7, fontFamily: "Inter"),
                ),
              ),
            ],
          ),
          SizedBox(height: mediaQuery.height * 0.05),
          SizedBox(
            width: mediaQuery.width * 0.26,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                    color: provider.isDarkTheme ? Colors.white : Colors.black),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    "assets/svg/icon1.svg",
                    width: 35,
                    height: 35,
                    color: Colors.grey,
                  ),
                  SizedBox(height: mediaQuery.height * 0.01),
                  const Text(
                    "Flutter Foundations",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Inter"),
                  ),
                  SizedBox(height: mediaQuery.height * 0.01),
                  const Text(
                    "With a solid foundation in mobile app development, I bring a blend of creativity and technical expertise to every project. Constantly learning and adapting, I strive to stay ahead of the latest trends in app development and user experience.",
                    style: TextStyle(fontFamily: "Inter"),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: mediaQuery.height * 0.05),
          SizedBox(
              width: mediaQuery.width * 0.26,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      color:
                          provider.isDarkTheme ? Colors.white : Colors.black),
                ),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          "assets/svg/icon2.svg",
                          width: 35,
                          height: 35,
                          color: Colors.grey,
                        ),
                        SizedBox(height: mediaQuery.height * 0.01),
                        const Text(
                          "Technologies I love to build with",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Inter"),
                        ),
                        SizedBox(height: mediaQuery.height * 0.01),
                        const Text(
                          "With over 3 years of experience in mobile app development, I possess a deep understanding of how intuitive and user-friendly apps are crafted. Here are some of the tools and technologies I've mastered along the way.",
                          style: TextStyle(fontFamily: "Inter"),
                        ),
                        SizedBox(height: mediaQuery.height * 0.02),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Wrap(
                        spacing: 5.0, // Add some spacing between the widgets
                        runSpacing: 10.0, // Add spacing between rows
                        children: [
                          buildSkillContainer(title: "Flutter"),
                          buildSkillContainer(title: "Dart"),
                          buildSkillContainer(title: "Kotlin"),
                          buildSkillContainer(title: "Java"),
                          buildSkillContainer(title: "Swift"),
                          buildSkillContainer(title: "Android"),
                          buildSkillContainer(title: "iOS"),
                          buildSkillContainer(title: "Firebase"),
                          buildSkillContainer(title: "MongoDB"),
                        ],
                      ),
                    ),
                  ),
                ]),
              ))
        ]),
        SizedBox(height: mediaQuery.height * 0.5),
        SizedBox(
            key: featuredProjectsKey,
            height: mediaQuery.height * 0.05), //for spacing
        const Text(
          "Featured Projects",
          style: TextStyle(
              fontWeight: FontWeight.w900, fontSize: 55, fontFamily: "Inter"),
        ),
        SizedBox(
          height: mediaQuery.height * 0.01,
        ),
        const Text(
          "A Collection of My Featured Mobile App Projects",
          style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 14,
              letterSpacing: 0.7,
              fontFamily: "Fira Code"),
        ),
        SizedBox(height: mediaQuery.height * 0.02),
        Column(
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
          ],
        ),
        SizedBox(height: mediaQuery.height * 0.3),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  "ACKNOWLEDGMENTS",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        )
      ]);
    }))));
  }

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
}
