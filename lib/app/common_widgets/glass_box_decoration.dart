import 'package:flutter/material.dart';

BoxDecoration getGlassCardDecoration() {
  return BoxDecoration(
    color: Colors.white.withOpacity(0.35),
    borderRadius: BorderRadius.circular(12),
    border: Border.all(color: Colors.white.withOpacity(0.2)),
    boxShadow: [
      BoxShadow(
        color: Colors.orange.withOpacity(0.1),
        blurRadius: 22,
        spreadRadius: 2,
      ),
    ],
  );
}
