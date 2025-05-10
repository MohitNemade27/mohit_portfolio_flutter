import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mohit_portfolio_flutter_web/app/common_widgets/candidate_detail/candidate_dialoge_widgets.dart';
import 'package:mohit_portfolio_flutter_web/app/common_widgets/circular_orange_widget.dart';
import 'package:mohit_portfolio_flutter_web/app/common_widgets/glass_box_decoration.dart';
import 'package:mohit_portfolio_flutter_web/app/common_widgets/info_stat_card.dart';
import 'package:mohit_portfolio_flutter_web/data/work_experience_model.dart';

Widget heroContent(BuildContext context, bool isMobile) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      // Decorative circular orange container
      Center(
        child: CircularOrangeContainer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Hi I am", style: TextStyle(color: Colors.white, fontSize: 18)),
              const SizedBox(height: 8),
              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Mohit Nemade',
                    textStyle: GoogleFonts.poppins(
                      fontSize: isMobile ? 24 : 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          color: Colors.orange.withOpacity(0.7),
                          blurRadius: 5,
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                  ),
                ],
                totalRepeatCount: 10000,
                repeatForever: false,
                pause: const Duration(milliseconds: 4000),
                displayFullTextOnTap: true,
                stopPauseOnTap: true,
              ),
              const SizedBox(height: 8),
              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Flutter Developer',
                    textStyle: TextStyle(
                      fontSize: isMobile ? 20 : 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                      shadows: [
                        Shadow(
                          color: Colors.white.withOpacity(0.3),
                          blurRadius: 5,
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                    speed: const Duration(milliseconds: 100),
                  ),
                ],
                totalRepeatCount: 999,
                pause: const Duration(milliseconds: 6000),
                displayFullTextOnTap: true,
                stopPauseOnTap: true,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(FontAwesomeIcons.instagram, color: Colors.white),
                  SizedBox(width: 12),
                  Icon(FontAwesomeIcons.github, color: Colors.white),
                  SizedBox(width: 12),
                  Icon(FontAwesomeIcons.linkedin, color: Colors.white),
                ],
              ),
            ],
          ),
        ),
      ),
      const SizedBox(height: 30),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            child: const Text("Hire Me"),
          ),
          const SizedBox(width: 10),
          OutlinedButton(
            onPressed: () {
              showCandidateDialog(context);
            },
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.white54),
            ),
            child: const Text("Download CV", style: TextStyle(color: Colors.white)),
          )
        ],
      ),
      const SizedBox(height: 20),
      InfoStatsCard(),
    ],
  );
}

Widget buildWorkExperienceCard(WorkExperience work, double width) {
  return Container(
    width: width,
    padding: const EdgeInsets.all(20),
    decoration: getGlassCardDecoration(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(work.icon, color: work.iconColor, size: 28),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    work.companyName,
                    style: const TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    work.role,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          work.duration,
          style: TextStyle(color: Colors.white.withOpacity(0.7)),
        ),
        const SizedBox(height: 8),
        Text(
          work.description,
          style: TextStyle(color: Colors.white.withOpacity(0.6)),
        ),
      ],
    ),
  );
}

Widget navItem(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
    child: Text(title, style: const TextStyle(color: Colors.white)),
  );
}