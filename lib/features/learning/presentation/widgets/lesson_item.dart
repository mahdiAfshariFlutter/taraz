import 'dart:math';

import 'package:code_challenge/features/learning/data/models/lesson_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LessonItem extends StatelessWidget {
  final int index;
  final bool isSelected;
  final bool oneTheSide;
  final bool twoTheSide;
  final LessonModel lessonData;

  const LessonItem(
      {super.key,
      required this.index,
      required this.isSelected,
      required this.oneTheSide,
      required this.twoTheSide,
      required this.lessonData});

  @override
  Widget build(BuildContext context) {
    double progressPercentage = lessonData.hamdarsUserCurrentUnitLevelPoint! /
        (lessonData.hamdarsUserMaxUnitLevelPoint! -
            lessonData.hamdarsUserMinUnitLevelPoint!) * 100;
    double paddingSize = isSelected
        ? 80
        : oneTheSide
            ? 50
            : 0;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (isSelected) ...[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Container(
                decoration: ShapeDecoration(
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(99))),
                    color: Colors.grey.shade100),
                child: Column(
                  children: [
                    CircularSegmentWidget(
                      percentage: progressPercentage,
                      icon: lessonData.unitIcon!, // آیکون SVG که می‌خواهید نمایش دهید
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(99)),
                          color: Colors.amber),
                      child: Text(
                          '  سطح ${lessonData.hamdarsUserCurrentUnitLevelPoint}  '),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Expanded(
                      child: Text(
                        textDirection: TextDirection.rtl,
                        maxLines: 1,
                        lessonData.name!,
                        style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ] else ...[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: paddingSize),
              child: CircularSegmentWidget(
                percentage: progressPercentage,
                icon: lessonData.unitIcon!, // آیکون SVG که می‌خواهید نمایش دهید
              ),
            ),
          ),
        ]
      ],
    );
  }
}

//progres
class CircularSegmentWidget extends StatelessWidget {
  final double percentage;
  final String icon;

  const CircularSegmentWidget({
    super.key,
    required this.percentage,
    required this.icon,
  });
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CustomPaint(
          size: const Size(90, 90),
          painter: CircularSegmentPainter(
            percentage: percentage,
          ),
        ),
        SvgPicture.network(icon,fit: BoxFit.contain,width: 75,height: 75,)
      ],
    );
  }
}

class CircularSegmentPainter extends CustomPainter {
  final double percentage;

  CircularSegmentPainter({
    required this.percentage,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint backgroundPaint = Paint()
      ..color = Colors.grey.shade200
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6;

    Paint foregroundPaint = Paint()
      ..color = const Color(0xff758BEB)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6;

    double radius = min(size.width / 2, size.height / 2) - 4;
    Offset center = Offset(size.width / 2, size.height / 2);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      2 * pi,
      false,
      backgroundPaint,
    );

    double sweepAngle = 2 * pi * (percentage / 100);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      sweepAngle,
      false,
      foregroundPaint,
    );
  }

  @override
  bool shouldRepaint(CircularSegmentPainter oldDelegate) {
    return oldDelegate.percentage != percentage;
  }
}
