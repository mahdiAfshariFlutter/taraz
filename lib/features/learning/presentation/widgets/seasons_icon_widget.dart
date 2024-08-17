import 'dart:math';

import 'package:code_challenge/core/assets/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SeasonsIconWidget extends StatelessWidget {
  final int lessonsRead;
  final int totalLessons;
  const SeasonsIconWidget({
    super.key,
    required this.lessonsRead,
    required this.totalLessons,
  });

  @override
  Widget build(BuildContext context) {
    return SeasonSegmentWidget(
      filledSegments: lessonsRead,
      segmentCount: totalLessons,
    );
  }
}

//
class SeasonSegmentWidget extends StatelessWidget {
  final int segmentCount;
  final int filledSegments;

  const SeasonSegmentWidget(
      {super.key, required this.filledSegments, required this.segmentCount});

  @override
  Widget build(BuildContext context) {
    int leasonCount = segmentCount;

    return Stack(
      alignment: Alignment.center,
      children: [
        CustomPaint(
          size: const Size(78, 78),
          painter: SeasonCircularSegmentPainter(
            segmentCount: leasonCount,
            filledSegments: filledSegments,
          ),
        ),
        SvgPicture.asset(Images.seasonsIcon)
      ],
    );
  }
}

class SeasonCircularSegmentPainter extends CustomPainter {
  final int segmentCount;
  final int filledSegments;

  SeasonCircularSegmentPainter({
    required this.segmentCount,
    required this.filledSegments,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    double radius = min(size.width / 2, size.height / 2) - 4;
    Offset center = Offset(size.width / 2, size.height / 2);

    Paint innerCirclePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..color = Colors.grey.shade100;

    double innerCircleRadius = radius - 4;
    canvas.drawCircle(center, innerCircleRadius, innerCirclePaint);

    double segmentAngle = 2 * pi / segmentCount;
    double gapAngle = 0.05; // فاصله بین بخش‌ها (برای بخش‌های پر شده)

    // رسم بخش‌های پر شده
    for (int i = 0; i < filledSegments; i++) {
      paint.color = const Color(0xffFFC107);

      double startAngle = -pi / 2 + i * segmentAngle + gapAngle / 2;
      double sweepAngle = segmentAngle - gapAngle;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle,
        false,
        paint,
      );
    }

    if (filledSegments == 0) {
      // اگر هیچ بخشی پر نشده است، یک دایره‌ی کامل بدون شکاف رسم کنید
      paint.color = Colors.grey.shade300;
      canvas.drawCircle(center, radius, paint);
    } else if (filledSegments < segmentCount) {
      // فقط دایره‌ی بزرگ و بدون هیچ جداسازی بین بخش‌های خالی را نمایش می‌دهد
      paint.color = Colors.grey.shade300;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        -pi / 2 + filledSegments * segmentAngle + gapAngle / 2,
        (segmentCount - filledSegments) * segmentAngle - gapAngle,
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
