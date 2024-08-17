import 'package:code_challenge/features/learning/presentation/widgets/seasons_icon_widget.dart';
import 'package:code_challenge/features/learning/presentation/widgets/seasons_list_loading_widget.dart';
import 'package:code_challenge/features/learning/presentation/widgets/seassons_card_widget.dart';
import 'package:flutter/material.dart';

class SeasonsList extends StatefulWidget {
  final String name;
  final int count;
  const SeasonsList({
    super.key,
    required this.name,
    required this.count,
  });

  @override
  State<SeasonsList> createState() => _SeasonsListState();
}

class _SeasonsListState extends State<SeasonsList> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loading();
  }

  void loading() {
    Future.delayed(
      Durations.long4,
      () {
        if (mounted) {
          setState(() {
            isLoading = false;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Padding(
        padding: EdgeInsets.only(top: 24, right: 12, left: 12),
        child: SeasonsListLoading(),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(top: 24, right: 12, left: 12),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: widget.count,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  SeasonsIconWidget(
                    lessonsRead: index,
                    totalLessons: 10,
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  SeassonsCardWidget(
                    name: widget.name,
                    index: index,
                  )
                ],
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 16,
              );
            },
          ),
        ),
      );
    }
  }
}
