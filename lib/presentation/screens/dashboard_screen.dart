import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:mohit_portfolio_flutter_web/app/common_widgets/candidate_detail/candidate_dialoge_widgets.dart';
import 'package:mohit_portfolio_flutter_web/app/common_widgets/glass_box_decoration.dart';
import 'package:mohit_portfolio_flutter_web/data/work_experience_model.dart';
import 'package:mohit_portfolio_flutter_web/presentation/project_portfolio/portfolio_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // Section Keys for scrolling
  final homeKey = GlobalKey();
  final servicesKey = GlobalKey();
  final aboutKey = GlobalKey();
  final portfolioKey = GlobalKey();
  final contactKey = GlobalKey();

  // Scroll controller for programmatic scrolling
  final ScrollController _scrollController = ScrollController();

  final List<WorkExperience> workExperiences = [
    WorkExperience(
      companyName: "Wolters Kluwer India Pvt. Ltd",
      role: "Full Stack Developer",
      duration: "2023 - Present",
      description: "Building scalable enterprise and legal tech platforms with modern full-stack technologies.",
      icon: FontAwesomeIcons.building,
    ),
    WorkExperience(
      companyName: "StandardWings Technology Pvt. Ltd",
      role: "Mobile App Developer",
      duration: "2021 - 2023",
      description: "Developed high-performance cross-platform apps with rich UI/UX, serving diverse industry needs.",
      icon: FontAwesomeIcons.mobileScreen,
    ),
  ];

  bool isMenuOpen = false;

  // Sections list for navigation
  final List<String> _sections = ['Home', 'Services', 'About me', 'Portfolio', 'Contact me'];

  // Function to scroll to a specific section
  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }

    // Close the drawer/menu after navigation
    if (isMenuOpen) {
      setState(() {
        isMenuOpen = false;
      });
    }
    if (Navigator.canPop(context!)) {
      Navigator.pop(context);
    }
  }

  // Get the corresponding key for a section name
  GlobalKey _getKeyForSection(String section) {
    switch (section) {
      case 'Home':
        return homeKey;
      case 'Services':
        return servicesKey;
      case 'About me':
        return aboutKey;
      case 'Portfolio':
        return portfolioKey;
      case 'Contact me':
        return contactKey;
      default:
        return homeKey;
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isMobile = screenSize.width < 768;
    final isTablet = screenSize.width >= 768 && screenSize.width < 1200;
    final isDesktop = screenSize.width >= 1200;

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: isMobile
          ? AppBar(
        automaticallyImplyLeading: isMobile, // allow drawer icon on mobile
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black.withOpacity(0.7),
        title: Container(
          height: 100,
          width: 100,
          decoration: getGlassCardDecoration(),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl: "https://raw.githubusercontent.com/MohitNemade27/mohit_portfolio_flutter/main/assets/LOGO.jpg",
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
        ),
        actions: isMobile
            ? null
            : [
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
                  ..._sections
                      .map((section) => ListTile(
                            title: Text(section, style: const TextStyle(color: Colors.white)),
                            onTap: () {
                              Navigator.pop(context);
                              _scrollToSection(_getKeyForSection(section));
                            },
                          ))
                      .toList(),
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

          // Main content with scroll controller
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                // Top Navigation Bar (visible only on non-mobile devices)
                if (!isMobile)
                  Container(
                    color: Colors.black.withOpacity(0.7),
                    padding: EdgeInsets.symmetric(
                      horizontal: isTablet ? 16 : 32,
                      vertical: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: getGlassCardDecoration(),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: CachedNetworkImage(
                                fit: BoxFit.fill,
                                imageUrl: "https://raw.githubusercontent.com/MohitNemade27/mohit_portfolio_flutter/main/assets/LOGO.jpg",
                                placeholder: (context, url) => CircularProgressIndicator(), // Show while loading
                                errorWidget: (context, url, error) => Icon(Icons.error), // Show if there's an error
                              )),
                        ),
                        Row(
                          children: [
                            if (!isTablet) ...[
                              ..._sections.map((section) => Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: InkWell(
                                      onTap: () => _scrollToSection(_getKeyForSection(section)),
                                      child: Text(
                                        section,
                                        style: const TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  )),
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
                      children: _sections
                          .map((section) => Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      isMenuOpen = false;
                                    });
                                    _scrollToSection(_getKeyForSection(section));
                                  },
                                  child: Text(
                                    section,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  ),

                // Home Section
                Container(
                  key: homeKey,
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 16 : 40,
                    vertical: 20,
                  ),
                  child: isMobile || isTablet
                      ? Column(
                          children: [
                            // Top content
                            _buildHeroContent(context, isMobile),
                            const SizedBox(height: 30),
                            // Images for Mobile/Tablet - wrap grid view for better responsiveness
                            _buildResponsiveImageGrid(isMobile, isTablet),
                          ],
                        )
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Left Content
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: _buildHeroContent(context, isMobile),
                              ),
                            ),
                            const SizedBox(width: 40),
                            // Right Images for Web/Desktop - horizontal row
                            Expanded(
                              flex: 2,
                              child: _buildResponsiveImageGrid(isMobile, isTablet),
                            ),
                          ],
                        ),
                ),

                // Services Section
                Container(
                  key: servicesKey,
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 16 : 40,
                    vertical: 50,
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "Services",
                        style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "What I can do for you",
                        style: TextStyle(color: Colors.white60),
                      ),
                      const SizedBox(height: 30),
                      _buildServicesGrid(isMobile, isTablet),
                    ],
                  ),
                ),

                // About Me Section
                Container(
                  key: aboutKey,
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 16 : 32,
                    vertical: 50,
                  ),
                  child: Column(
                    children: [
                      const Text("About Me", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),
                      const SizedBox(height: 20),
                      Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 30,
                        runSpacing: 30,
                        children: [
                          Container(
                            constraints: BoxConstraints(
                              maxWidth: isMobile
                                  ? screenSize.width * 0.8
                                  : isTablet
                                      ? 300
                                      : 400,
                            ),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CachedNetworkImage(
                                  imageUrl: "https://raw.githubusercontent.com/MohitNemade27/mohit_portfolio_flutter/main/assets/laptop_me.png",
                                  placeholder: (context, url) => CircularProgressIndicator(), // Show while loading
                                  errorWidget: (context, url, error) => Icon(Icons.error), // Show if there's an error
                                )),
                          ),
                          Container(
                            constraints: BoxConstraints(
                              maxWidth: isMobile
                                  ? screenSize.width * 0.9
                                  : isTablet
                                      ? 400
                                      : 600,
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text(
                                '''I'm Mohit Nemade, a Flutter Developer with over 3 years of experience in building robust, offline-first mobile applications. Currently, I serve as a Product Software Engineer at Wolters Kluwer, where I contribute to enterprise solutions and legal tech applications. Previously, at StandardWings Technology, I developed cross-platform applications with a focus on UI/UX design. 
                         
              My technical expertise includes Flutter, Dart, Android (Java/Kotlin), and web technologies like HTML, CSS, and JavaScript. I'm passionate about creating clean, scalable mobile solutions and am open to opportunities in Nashik, Pune, or Bengaluru, especially in the fields of mobile development, AI, or IoT.''',
                                style: TextStyle(color: Colors.white60, height: 1.8, fontSize: 16),
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
                    vertical: 50,
                    horizontal: isMobile ? 16 : 32,
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "Work Experience",
                        style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Companies I've worked with",
                        style: TextStyle(color: Colors.white60),
                      ),
                      const SizedBox(height: 30),
                      Wrap(
                        spacing: 30,
                        runSpacing: 30,
                        alignment: WrapAlignment.center,
                        children: workExperiences
                            .map((work) => _buildWorkExperienceCard(
                                  work,
                                  isMobile
                                      ? screenSize.width * 0.85
                                      : isTablet
                                          ? screenSize.width * 0.45
                                          : screenSize.width * 0.30,
                                ))
                            .toList(),
                      ),
                    ],
                  ),
                ),

                // Portfolio Section
                Container(
                  key: portfolioKey,
                  child: PortfolioSection(),
                ),

                // Contact Section
                Container(
                  key: contactKey,
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 16 : 32,
                    vertical: 50,
                  ),
                  child: _buildContactSection(isMobile, isTablet),
                ),

                // Footer
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  color: Colors.black.withOpacity(0.5),
                  child: const Center(
                    child: Text(
                      "© 2025 Mohit Nemade. All rights reserved.",
                      style: TextStyle(color: Colors.white60),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // Floating action button to scroll to top (visible when scrolled down)
      floatingActionButton: FloatingActionButton(
        mini: isMobile,
        backgroundColor: Colors.orange,
        onPressed: () {
          _scrollToSection(homeKey);
        },
        child: const Icon(Icons.arrow_upward, color: Colors.white),
      ),
    );
  }

  // Hero content widget
  Widget _buildHeroContent(BuildContext context, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hello, I'm",
          style: TextStyle(
            color: Colors.white,
            fontSize: isMobile ? 24 : 32,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "Mohit Nemade",
          style: TextStyle(
            color: Colors.orange,
            fontSize: isMobile ? 36 : 48,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 60,
          child: AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              TypewriterAnimatedText(
                'Flutter Developer',
                textStyle: TextStyle(
                  fontSize: isMobile ? 20 : 24,
                  color: Colors.white,
                ),
                speed: const Duration(milliseconds: 100),
              ),
              TypewriterAnimatedText(
                'Mobile App Developer',
                textStyle: TextStyle(
                  fontSize: isMobile ? 20 : 24,
                  color: Colors.white,
                ),
                speed: const Duration(milliseconds: 100),
              ),
              TypewriterAnimatedText(
                'Full Stack Developer',
                textStyle: TextStyle(
                  fontSize: isMobile ? 20 : 24,
                  color: Colors.white,
                ),
                speed: const Duration(milliseconds: 100),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          "Building stunning cross-platform applications with Flutter",
          style: TextStyle(color: Colors.white70, fontSize: 16),
        ),
        const SizedBox(height: 30),
        Row(
          children: [
            ElevatedButton(
              onPressed: () async {
                showCandidateDialog(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              ),
              child: const Text("Download CV"),
            ),
            const SizedBox(width: 20),
            OutlinedButton(
              onPressed: () {
                _scrollToSection(contactKey);
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.orange),
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              ),
              child: const Text("Contact Me", style: TextStyle(color: Colors.orange)),
            ),
          ],
        ),
        const SizedBox(height: 30),
        Row(
          children: [
            _buildSocialIcon(FontAwesomeIcons.linkedin, "https://www.linkedin.com/in/mohit-nemade27"),
            const SizedBox(width: 20),
            _buildSocialIcon(FontAwesomeIcons.github, 'https://github.com/MohitNemade27/mohit_portfolio_flutter'),
            const SizedBox(width: 20),
          ],
        ),
      ],
    );
  }

  // Social media icon widget
  Widget _buildSocialIcon(IconData icon, String platformLink) {
    return InkWell(
      onTap: () async {
        final uri = Uri.parse(platformLink);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        }
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Icon(icon, color: Colors.orange),
      ),
    );
  }

  // Responsive image grid
  Widget _buildResponsiveImageGrid(bool isMobile, bool isTablet) {
    final imageSize = isMobile
        ? 120.0
        : isTablet
            ? 160.0
            : 200.0;

    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 15,
      runSpacing: 15,
      children: [
        CachedNetworkImage(
          imageUrl: "https://raw.githubusercontent.com/MohitNemade27/mohit_portfolio_flutter/main/assets/flutter_logo.png",
          height: imageSize,
          width: imageSize,
          fit: BoxFit.contain,
          placeholder: (context, url) => CircularProgressIndicator(),
          // Show while loading
          errorWidget: (context, url, error) => Icon(Icons.error), // Show if there's an error
        ),
        CachedNetworkImage(
          imageUrl: "https://raw.githubusercontent.com/MohitNemade27/mohit_portfolio_flutter/main/assets/android.png",
          height: imageSize,
          width: imageSize,
          fit: BoxFit.contain,
          placeholder: (context, url) => CircularProgressIndicator(),
          // Show while loading
          errorWidget: (context, url, error) => Icon(Icons.error), // Show if there's an error
        ),
        CachedNetworkImage(
          imageUrl: "https://raw.githubusercontent.com/MohitNemade27/mohit_portfolio_flutter/main/assets/javaScript.png",
          height: imageSize,
          width: imageSize,
          fit: BoxFit.contain,
          placeholder: (context, url) => CircularProgressIndicator(),
          // Show while loading
          errorWidget: (context, url, error) => Icon(Icons.error), // Show if there's an error
        ),
        CachedNetworkImage(
          imageUrl: "https://raw.githubusercontent.com/MohitNemade27/mohit_portfolio_flutter/main/assets/Angular.png",
          height: imageSize,
          width: imageSize,
          fit: BoxFit.contain,
          placeholder: (context, url) => CircularProgressIndicator(),
          // Show while loading
          errorWidget: (context, url, error) => Icon(Icons.error), // Show if there's an error
        ),
      ],
    );
  }

  // Work experience card
  Widget _buildWorkExperienceCard(WorkExperience work, double width) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(work.icon, color: Colors.orange),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      work.companyName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      work.role,
                      style: const TextStyle(color: Colors.orange),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Text(
            work.duration,
            style: const TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 10),
          Text(
            work.description,
            style: const TextStyle(color: Colors.white60),
          ),
        ],
      ),
    );
  }

  // Services grid
  Widget _buildServicesGrid(bool isMobile, bool isTablet) {
    final services = [
      {
        'title': 'Mobile App Development',
        'description': 'Creating beautiful and functional mobile applications using Flutter and native technologies.',
        'icon': FontAwesomeIcons.mobileScreen,
      },
      {
        'title': 'Web Development',
        'description': 'Building responsive web applications using modern frameworks and technologies.',
        'icon': FontAwesomeIcons.chrome,
      },
      {
        'title': 'Backend Development',
        'description': 'Creating robust backend solutions and APIs to power your applications.',
        'icon': FontAwesomeIcons.server,
      },
    ];

    return Wrap(
      spacing: 20,
      runSpacing: 20,
      alignment: WrapAlignment.center,
      children: services
          .map((service) => Container(
                width: isMobile
                    ? MediaQuery.of(context).size.width * 0.85
                    : isTablet
                        ? MediaQuery.of(context).size.width * 0.45
                        : MediaQuery.of(context).size.width * 0.22,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E1E1E),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.orange.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(service['icon'] as IconData, color: Colors.orange, size: 30),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      service['title'] as String,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      service['description'] as String,
                      style: const TextStyle(color: Colors.white60),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ))
          .toList(),
    );
  }

  // Contact section
  Widget _buildContactSection(bool isMobile, bool isTablet) {
    return Column(
      children: [
        const Text(
          "Contact Me",
          style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        const Text(
          "Let's work together",
          style: TextStyle(color: Colors.white60),
        ),
        const SizedBox(height: 40),
        Wrap(
          spacing: 30,
          runSpacing: 30,
          alignment: WrapAlignment.center,
          children: [
            // Contact Form
            Container(
              width: isMobile
                  ? MediaQuery.of(context).size.width * 0.9
                  : isTablet
                      ? MediaQuery.of(context).size.width * 0.7
                      : MediaQuery.of(context).size.width * 0.45,
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E1E),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Send a Message",
                    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  _buildTextField("Your Name"),
                  const SizedBox(height: 15),
                  _buildTextField("Your Email"),
                  const SizedBox(height: 15),
                  _buildTextField("Subject"),
                  const SizedBox(height: 15),
                  TextFormField(
                    maxLines: 5,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Your Message",
                      hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.1),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.all(15),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                      child: const Text("Send Message"),
                    ),
                  ),
                ],
              ),
            ),

            // Contact Info
              buildContactSection(isMobile, isTablet, context)
          ],
        ),
      ],
    );
  }
  Widget buildContactSection(bool isMobile, bool isTablet, BuildContext context) {
    return Container(
      width: isMobile
          ? MediaQuery.of(context).size.width * 0.95
          : isTablet
          ? MediaQuery.of(context).size.width * 0.7
          : MediaQuery.of(context).size.width * 0.25,
      margin: const EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.all(24),
      decoration: getGlassCardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Contact Information",
            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          _buildContactInfo(FontAwesomeIcons.envelope, "Email", "mohitnemade27@gmail.com"),
          const SizedBox(height: 15),
          _buildContactInfo(FontAwesomeIcons.phone, "Phone", "+91 8208499926"),
          const SizedBox(height: 15),
          _buildContactInfo(FontAwesomeIcons.locationDot, "Location", "Pune, Maharashtra, India"),

          const SizedBox(height: 30),

          const Text(
            "Follow Me",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          const SizedBox(height: 15),

          Wrap(
            spacing: 15,
            children: [
              _buildSocialIcon(FontAwesomeIcons.linkedin, "https://www.linkedin.com/in/mohit-nemade27"),
              _buildSocialIcon(FontAwesomeIcons.github, 'https://github.com/MohitNemade27/mohit_portfolio_flutter'),
            ],
          ),
        ],
      ),
    );
  }
  // Contact info item
  Widget _buildContactInfo(IconData icon, String title, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.orange.withOpacity(0.2),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Icon(icon, color: Colors.orange, size: 16),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 5),
              InkWell(
                onTap: () {
                  Clipboard.setData(ClipboardData(text: value));
                },
                child: Tooltip(
                  message: "Click to copy",
                  child: Text(
                    value,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // TextField widget
  Widget _buildTextField(String hintText) {
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
        filled: true,
        fillColor: Colors.white.withOpacity(0.1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.all(15),
      ),
    );
  }

  // Navigation item widget (for embedding in other widgets)
  Widget navItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: () => _scrollToSection(_getKeyForSection(title)),
        child: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
