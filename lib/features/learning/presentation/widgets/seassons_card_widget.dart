import 'package:code_challenge/core/assets/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SeassonsCardWidget extends StatelessWidget {
  final String name;
  final int index;
  const SeassonsCardWidget({
    super.key,
    required this.name,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Card(
          elevation: 0,
          child: Container(
            height: 78,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              color: Colors.grey.shade100,
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'فصل ${index + 1} درس $name',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          SvgPicture.asset(Images.studyIcon),
                          const SizedBox(
                            width: 8,
                          ),
                          const Text(
                            '12:30',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.chevron_right,
                    color: Colors.black,
                    size: 28,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
