import 'package:flutter/material.dart';

class ConcaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    Path path = Path();

    // Start from left-top
    path.moveTo(0, 0);

    // Top edge: left flat to middle dip to right flat
    path.quadraticBezierTo(w / 2, 10, w, 0); // 10 px dip in the middle

    // Right side down
    path.lineTo(w, h);

    // Bottom edge: right flat to middle dip to left flat
    path.quadraticBezierTo(w / 2, h - 10, 0, h);

    // Left side up
    path.lineTo(0, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}