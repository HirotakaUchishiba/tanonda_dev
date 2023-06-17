import 'dart:math';

import 'package:flutter/material.dart';

class GradientCircularProgressIndicator extends StatelessWidget {
  final double value;

  GradientCircularProgressIndicator(this.value);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(100, 100),
      painter: _GradientCircularProgressPainter(this.value),
    );
  }
}

class _GradientCircularProgressPainter extends CustomPainter {
  final double value;

  _GradientCircularProgressPainter(this.value);

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTRB(0, 0, size.width, size.height);
    final gradient = LinearGradient(colors: [Colors.indigo, Colors.pink]);
    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0;

    canvas.drawArc(
      Offset.zero & size,
      -pi / 2,
      pi * 2 * value,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant _GradientCircularProgressPainter oldDelegate) =>
      oldDelegate.value != this.value;
}
