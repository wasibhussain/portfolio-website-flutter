import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactMe extends StatelessWidget {
  const ContactMe({super.key});

  Widget buildCommonIconButton({
    required String svgIcon,
    required String title,
    required VoidCallback onPressed,
    double iconHeight = 40.0,
    double padding = 4.0,
    required BuildContext context,
  }) {
    return IconButton(
      onPressed: onPressed,
      padding: EdgeInsets.all(padding),
      icon: SvgPicture.asset(
        svgIcon,
        semanticsLabel: title,
        height: iconHeight,
        colorFilter: ColorFilter.mode(
            Theme.of(context).iconTheme.color!, BlendMode.srcIn),
      ),
      tooltip: title,
    );
  }

  openUrl(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // const Text(
        //   "Contact Me",
        //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26, fontFamily: "Inter"),
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildCommonIconButton(
                svgIcon: "assets/svg/svg_google.svg",
                title: "Google",
                onPressed: () {},
                context: context),
            buildCommonIconButton(
                svgIcon: "assets/svg/svg_github.svg",
                title: "Github",
                onPressed: () {
                  openUrl("https://github.com/wasibhussain");
                },
                context: context),
            buildCommonIconButton(
                svgIcon: "assets/svg/svg_linkedin.svg",
                title: "LinkedIn",
                onPressed: () {
                  openUrl("https://www.linkedin.com/in/wasibhussain/");
                },
                context: context),
            buildCommonIconButton(
                svgIcon: "assets/svg/svg_stackoverflow.svg",
                title: "StackOverFlow",
                onPressed: () {
                  openUrl("https://www.stackoverflow.com/users/1127220/wasib-hussain");
                },
                context: context),
            buildCommonIconButton(
                svgIcon: "assets/svg/svg_upwork.svg",
                title: "Upwork",
                onPressed: () {
                  openUrl(
                      "https://www.upwork.com/freelancers/~01b35d2be346aadbc0?mp_source=share");
                },
                context: context),
          ],
        )
      ],
    );
  }
}
