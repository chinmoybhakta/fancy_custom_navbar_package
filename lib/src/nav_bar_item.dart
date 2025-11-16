import 'package:flutter/material.dart';

class NavBarItem {
  final String? svgPath;
  final IconData? icon;
  final String label;
  NavBarItem({
    this.svgPath,
    this.icon,
    required this.label,
  });
}