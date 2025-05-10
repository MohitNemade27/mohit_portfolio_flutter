import 'package:flutter/material.dart';

class WorkExperience {
  final String companyName;
  final String role;
  final String duration;
  final String description;
  final IconData icon;
  final Color iconColor;

  WorkExperience({
    required this.companyName,
    required this.role,
    required this.duration,
    required this.description,
    required this.icon,
    this.iconColor = Colors.orange,
  });
}
