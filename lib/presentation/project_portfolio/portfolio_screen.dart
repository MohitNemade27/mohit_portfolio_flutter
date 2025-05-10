import 'package:flutter/material.dart';
import 'package:mohit_portfolio_flutter_web/app/app_constant.dart';
import 'package:mohit_portfolio_flutter_web/app/common_widgets/glass_box_decoration.dart';
import 'package:mohit_portfolio_flutter_web/app/common_widgets/portfolio_dialoge/portfolio_dialoge.dart';

class PortfolioSection extends StatelessWidget {
  const PortfolioSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("Projects", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white)),
        const SizedBox(height: 20),
        Wrap(
          spacing: 20,
          runSpacing: 20,
          children: [
            _projectCard(context, "Lippincott Solutions", "assets/lippincott.png", project1Details),
            _projectCard(context, "Garbage Weight IOT", "assets/img_company_logo.png", project2Details),
            _projectCard(context, "NMC Face Attendance", "assets/face.png", project3Details),
          ],
        )
      ],
    );
  }

  Widget _projectCard(BuildContext context, String title, String imagePath, String details) {
    return InkWell(
      onTap: () => showDialog(
        context: context,
        builder: (_) => ProjectDetailDialog(title: title, details: details),
      ),
      child: Container(
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
            child: Image.asset(
              imagePath,
              fit: BoxFit.scaleDown, // Or use BoxFit.contain if needed
            ),
          ),
        ),
            const SizedBox(height: 12),
            Center(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
