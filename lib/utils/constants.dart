import 'package:flutter/material.dart';

Color kPrimaryColor = Color(0xFF166DE0);
Color kCaseColor = Color(0xFFFF1242);
Color kHealthCareColor = Color(0xFF017BFF);
Color kRecoveredColor = Color(0xFF29A746);
Color kDeathColor = Color(0xFF6D757D);

LinearGradient kGradientShimmer = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [
    Colors.white70,
    Colors.white,
  ],
);