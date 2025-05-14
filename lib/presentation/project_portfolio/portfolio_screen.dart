import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mohit_portfolio_flutter_web/app/app_constant.dart';
import 'package:mohit_portfolio_flutter_web/app/common_widgets/glass_box_decoration.dart';
import 'package:mohit_portfolio_flutter_web/app/common_widgets/portfolio_dialoge/portfolio_dialoge.dart';
import 'package:url_launcher/url_launcher.dart';

class PortfolioSection extends StatelessWidget {
  const PortfolioSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("Portfolio", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white)),
        const SizedBox(height: 20),
        Wrap(
          spacing: 20,
          runSpacing: 20,
          children: [
            _projectCard(context, "Lippincott Solutions (Mobile)", "assets/lippincott.png", project1Details, "", 'assets/lns_mobile.png'),
            _projectCard(context, "Lippincott Solutions (web)", "assets/lippincott.png", project1webDetails, "https://advisor.qa.lww.com/lna/login", 'assets/lnsWeb.png'),
            _projectCard(context, "Garbage Weight IOT (Desktop)", "assets/img_company_logo.png", project2Details, "NA", 'assets/flutter_garbage_weight_management_img.png'),
            _projectCard(context, "NMC Face Attendance", "assets/face.png", project3Details, "https://play.google.com/store/apps/details?id=com.swt.nmc_attendance&hl=en", 'assets/nmc_face.png'),
            _projectCard(context, "HSEF@Champion", "assets/snap@champ_img.png", project4Details, "https://play.google.com/store/apps/details?id=com.champmgt.snapchampion&hl=en", 'assets/snapChamp.png'),
            _projectCard(context, "Sunrayz", "assets/sunrayz.png", project5Details, "https://play.google.com/store/apps/details?id=com.sunrayztechnology.apex_school", 'assets/sunrayz_mobile_demo.png'),
            _projectCard(context, "Hidoc (Web)", "assets/hidoclogo-desktop.png", project6Details, "https://in.webapp.hidoc.co/", 'assets/hidoc_home_page.png'),
          ],
        )
      ],
    );
  }

  Widget _projectCard(BuildContext context, String title, String imagePath, String details, String playStoreLink, String appImagePath) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(20),
      decoration: getGlassCardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: getGlassCardDecoration(),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  imageUrl: "https://raw.githubusercontent.com/MohitNemade27/mohit_portfolio_flutter/main/$imagePath",
                  placeholder: (context, url) => CircularProgressIndicator(), // Show while loading
                  errorWidget: (context, url, error) => Icon(Icons.error), // Show if there's an error
                )),
          ),
          const SizedBox(height: 12),
          Center(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                showDialog(context: context, builder: (_) => ProjectDetailDialog(title: title, details: details, playStoreLink: playStoreLink, appImagePath: appImagePath));
              },
              child: const Text('More detail'),
            ),
          ),
        ],
      ),
    );
  }
}
