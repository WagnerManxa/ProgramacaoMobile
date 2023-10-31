import 'package:flutter/material.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  final double progress;
  final double radius;
  final Color backgroundColor;
  final Color progressColor;
  final double value;
  final Color valueColor;
  final String subtitle;

  CustomCircularProgressIndicator({
    required this.progress,
    required this.radius,
    required this.value,
    required this.subtitle,
    this.backgroundColor = Colors.grey,
    this.progressColor = Colors.blue,
    this.valueColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: radius * 2,
      height: radius * 2,
      child: CustomPaint(
        painter: _CircularProgressPainter(
          progress: progress,
          backgroundColor: backgroundColor,
          progressColor: progressColor,
          value: value,
          valueColor: valueColor,
          subtitle: subtitle,
        ),
      ),
    );
  }
}

class _CircularProgressPainter extends CustomPainter {
  final double progress;
  final Color backgroundColor;
  final Color progressColor;
  final double value;
  final Color valueColor;
  final String subtitle;

  _CircularProgressPainter({
    required this.progress,
    required this.backgroundColor,
    required this.progressColor,
    required this.value,
    required this.valueColor,
    required this.subtitle,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint backgroundPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    final Paint progressPaint = Paint()
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    final Paint valuePaint = Paint()
      ..color = valueColor
      ..style = PaintingStyle.fill;

    final Offset center = Offset(size.width / 2, size.height / 2);
    final double radius = size.width / 2 - 10;

    canvas.drawCircle(center, radius, backgroundPaint);

    double progressAngle = 2 * progress * 3.14;
    canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius), -3.14 / 2, progressAngle, false, progressPaint);

    TextSpan span = new TextSpan(
      style: TextStyle(color: valueColor, fontSize: 20.0),
      text: '${(value >= 100) ? '100': value.toStringAsFixed(0)  }%',
    );
    TextPainter tp = TextPainter(
        text: span,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr);
    tp.layout();
    tp.paint(canvas, Offset(size.width / 2 - tp.width / 2, size.height / 2 - tp.height / 2));

    TextSpan subtitleSpan = new TextSpan(
      style: TextStyle(color: valueColor, fontSize: 15.0),
      text: subtitle,
    );
    TextPainter stp = TextPainter(
        text: subtitleSpan,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr);
    stp.layout();
    stp.paint(canvas, Offset(size.width / 2 - stp.width / 2, size.height / 2 + radius / 1.5));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
