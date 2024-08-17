import 'package:code_challenge/features/learning/presentation/widgets/seasons_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SeasonsListLoading extends StatelessWidget {
  const SeasonsListLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Row(
            children: [
              const SeasonsIconWidget(
                lessonsRead: 0,
                totalLessons: 1,
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    height: 78,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 16,
          );
        },
        itemCount: 5,
      ),
    );
  }
}
