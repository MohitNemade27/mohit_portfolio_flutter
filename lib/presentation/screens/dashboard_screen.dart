import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:mohit_portfolio_flutter_web/app/common_widgets/candidate_detail/candidate_dialoge_widgets.dart';
import 'package:mohit_portfolio_flutter_web/app/common_widgets/circular_orange_widget.dart';
import 'package:mohit_portfolio_flutter_web/app/common_widgets/education_detail_widget/education_details_widget.dart';
import 'package:mohit_portfolio_flutter_web/app/common_widgets/info_stat_card.dart';
import 'package:mohit_portfolio_flutter_web/app/common_widgets/ui_utils/ui_utils.dart';
import 'package:mohit_portfolio_flutter_web/data/work_experience_model.dart';
import 'package:mohit_portfolio_flutter_web/presentation/project_portfolio/portfolio_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<WorkExperience> workExperiences = [
    WorkExperience(
      companyName: "Wolters Kluwer India Pvt.Ltd",
      role: "Full stack Developer",
      duration: "2023 - Present",
      description: "Working on enterprise solutions and legal tech applications",
      icon: FontAwesomeIcons.building,
    ),
    WorkExperience(
      companyName: "StandardWings Technology Pvt.Ltd ",
      role: "Mobile App Developer",
      duration: "2021 - 2023",
      description: "Developed cross-platform applications and UI/UX solutions",
      icon: FontAwesomeIcons.mobileScreen,
    ),
  ];

  bool isMenuOpen = false;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isMobile = screenSize.width < 768;
    final isTablet = screenSize.width >= 768 && screenSize.width < 1200;

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: isMobile
          ? AppBar(
              backgroundColor: Colors.black.withOpacity(0.7),
              title: const Text("LOGO", style: TextStyle(color: Colors.orange, fontSize: 20)),
              actions: [
                IconButton(
                  icon: Icon(isMenuOpen ? Icons.close : Icons.menu, color: Colors.white),
                  onPressed: () {
                    setState(() {
                      isMenuOpen = !isMenuOpen;
                    });
                  },
                ),
              ],
            )
          : null,
      drawer: isMobile
          ? Drawer(
              backgroundColor: const Color(0xFF121212),
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(
                      color: Color(0xFF1E1E1E),
                    ),
                    child: Text(
                      'Menu',
                      style: TextStyle(color: Colors.orange, fontSize: 24),
                    ),
                  ),
                  ListTile(
                    title: const Text('Home', style: TextStyle(color: Colors.white)),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: const Text('Services', style: TextStyle(color: Colors.white)),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: const Text('About me', style: TextStyle(color: Colors.white)),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: const Text('Portfolio', style: TextStyle(color: Colors.white)),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: const Text('Contact me', style: TextStyle(color: Colors.white)),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                      child: const Text("Hire Me"),
                    ),
                  ),
                ],
              ),
            )
          : null,
      body: Stack(
        children: [
          // Blurred background effect
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
              ),
              width: double.infinity,
              height: double.infinity,
            ),
          ),

          // Orange blurry circles in background
          Positioned(
            top: MediaQuery.of(context).size.height * 0.1,
            left: MediaQuery.of(context).size.width * 0.2,
            child: Container(
              width: isMobile ? 100 : 200,
              height: isMobile ? 100 : 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                boxShadow: [
                  BoxShadow(
                    color: Colors.orange.withOpacity(0.3),
                    blurRadius: isMobile ? 80 : 120,
                    spreadRadius: isMobile ? 30 : 60,
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.1,
            right: MediaQuery.of(context).size.width * 0.15,
            child: Container(
              width: isMobile ? 80 : 150,
              height: isMobile ? 80 : 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                boxShadow: [
                  BoxShadow(
                    color: Colors.orange.withOpacity(0.2),
                    blurRadius: isMobile ? 60 : 100,
                    spreadRadius: isMobile ? 30 : 50,
                  ),
                ],
              ),
            ),
          ),

          // Main content
          SingleChildScrollView(
            child: Column(
              children: [
                // Top Navigation Bar (visible only on non-mobile devices)
                if (!isMobile)
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: isTablet ? 16 : 32,
                      vertical: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("LOGO", style: TextStyle(color: Colors.orange, fontSize: 20)),
                        Row(
                          children: [
                            if (!isTablet) ...[
                              navItem("Home"),
                              navItem("Services"),
                              navItem("About me"),
                              navItem("Portfolio"),
                              navItem("Contact me"),
                              const SizedBox(width: 20),
                            ],
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                              child: const Text("Hire Me"),
                            ),
                            if (isTablet)
                              IconButton(
                                icon: Icon(isMenuOpen ? Icons.close : Icons.menu, color: Colors.white),
                                onPressed: () {
                                  setState(() {
                                    isMenuOpen = !isMenuOpen;
                                  });
                                },
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),

                // Dropdown menu for tablet
                if (isTablet && isMenuOpen)
                  Container(
                    color: const Color(0xFF1E1E1E),
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Column(
                      children: [
                        navItem("Home"),
                        const SizedBox(height: 8),
                        navItem("Services"),
                        const SizedBox(height: 8),
                        navItem("About me"),
                        const SizedBox(height: 8),
                        navItem("Portfolio"),
                        const SizedBox(height: 8),
                        navItem("Contact me"),
                      ],
                    ),
                  ),

                // Hero Section
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 16 : 40,
                    vertical: 20,
                  ),
                  child: isMobile || isTablet
                      ? Column(
                    children: [
                      // Top content
                      heroContent(context, isMobile),
                      const SizedBox(height: 30),
                      // Images for Mobile/Tablet - vertical stack
                      Wrap(
                        children: [
                          Image.asset(
                            "assets/flutter_logo.png",
                            height: 200,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(height: 16),
                          Image.asset(
                            "assets/android.png",
                            fit: BoxFit.scaleDown,
                          ),
                          const SizedBox(height: 16),
                          Image.asset(
                            "assets/Angular.png",
                            height: 200,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(height: 16),
                          Image.asset(
                            "assets/javaScript.png",
                            height: 200,
                            fit: BoxFit.contain,
                          ),


                        ],
                      ),
                    ],
                  )
                      : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Left Content
                      Expanded(
                        flex: 3,
                        child: heroContent(context, isMobile),
                      ),
                      const SizedBox(width: 40),
                      // Right Images for Web/Desktop - horizontal row
                      Expanded(
                        flex: 2,
                        child: Wrap(
                          children: [
                            Image.asset(
                              "assets/flutter_logo.png",
                              height: 300,
                              width: 300,
                              fit: BoxFit.contain,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 100.0),
                              child: Image.asset(
                                "assets/android.png",
                                height: 160,
                                width: 160,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Image.asset(
                              "assets/javaScript.png",
                              height: 300,
                              width: 260,
                              fit: BoxFit.contain,
                            ),
                            Image.asset(
                              "assets/Angular.png",
                              height: 300,
                              width: 300,
                              fit: BoxFit.contain,
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // About Me
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 16 : 32,
                    vertical: 20,
                  ),
                  child: Column(
                    children: [
                      const Text("About Me", style: TextStyle(fontSize: 22, color: Colors.white)),
                      const SizedBox(height: 8),
                      const Text("", style: TextStyle(fontSize: 22, color: Colors.white)),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 60,
                        children: [
                          ColorFiltered(
                            colorFilter: ColorFilter.mode(
                              Colors.white.withOpacity(0.05), // subtle blend
                              BlendMode.softLight,
                            ),
                            child: Image.asset(
                              width: isMobile ? 200 : 300,
                              height: isMobile ? 200 : 400,
                              colorBlendMode: BlendMode.softLight,
                              "assets/laptop_me.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SizedBox(
                              height: 600,
                              width: 600,
                              child: const Text(
                                ''' I’m Mohit Nemade, a Flutter Developer with 3+ years of experience building robust, offline-first mobile apps. I’ve worked at Wolters Kluwer Pvt. Ltd. and StandardWings Technology, contributing to projects like Lippincott Solutions—focusing on Flutter, SQLite, WebView, background services, and performance optimization.

Skilled in Flutter, Dart, Android (Java/Kotlin), and HTML/CSS/JS, I’m passionate about building clean UI/UX and scalable mobile solutions. I’m open to roles in Nashik, Pune, or Bengaluru, and eager to take on new challenges in mobile development, AI, or IoT.''',
                                style: TextStyle(color: Colors.white60),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Work Experience Section
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: isMobile ? 16 : 32,
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "Work Experience",
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Companies I've worked with",
                        style: TextStyle(color: Colors.white60),
                      ),
                      const SizedBox(height: 20),
                      Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        alignment: WrapAlignment.center,
                        children: workExperiences
                            .map((work) => buildWorkExperienceCard(
                          work,
                          isMobile ? MediaQuery.of(context).size.width * 0.85 : MediaQuery.of(context).size.width *0.30,
                        ))
                            .toList(),
                      ),
                    ],
                  ),
                ),
                // EducationExpandWidget(
                //   title: "Bachelor of Computer Science",
                //   institution: "University of Tech",
                //   duration: "2016 - 2020",
                //   description:
                //   "Studied core computer science subjects including data structures, algorithms, and mobile development.",
                // ),
                PortfolioSection()
              ],
            ),
          ),
        ],
      ),
    );
  }


}
