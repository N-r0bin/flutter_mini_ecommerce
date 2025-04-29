import 'package:flutter/material.dart';

class CustomCurvedEdges extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);

    final firstCurved = Offset(0, size.height - 20);
    final firstCurved2 = Offset(30, size.height - 20);
    path.quadraticBezierTo(
        firstCurved.dx, firstCurved.dy, firstCurved2.dx, firstCurved2.dy);

    final secondCurved1 = Offset(0, size.height - 20);
    final secondCurved2 = Offset(size.width - 30, size.height - 20);
    path.quadraticBezierTo(
        secondCurved1.dx, secondCurved1.dy, secondCurved2.dx, secondCurved2.dy);

    final lastCurved1 = Offset(size.width, size.height - 20);
    final lastCurved2 = Offset(size.width, size.height);
    path.quadraticBezierTo(
        lastCurved1.dx, lastCurved1.dy, lastCurved2.dx, lastCurved2.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
