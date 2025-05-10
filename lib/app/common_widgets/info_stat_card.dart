import 'package:flutter/material.dart';
import 'package:mohit_portfolio_flutter_web/app/common_widgets/state_Item_widget.dart';

class InfoStatsCard extends StatelessWidget {
  const InfoStatsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Takes full width of parent
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.orange.withOpacity(0.1),
            blurRadius: 20,
            spreadRadius: 2,
          ),
        ],
      ),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          StatItem(value: "3+", label: "Experiences"),
          Container(width:1,height:50,color: Colors.white54,),
          StatItem(value: "20+", label: "Project done"),
          Container(width:1,height:50,color: Colors.white54,),
          StatItem(value: "2 times", label: "Code game winner"),
        ],
      ),
    );
  }
}

