import 'package:carousel_slider/carousel_slider.dart';
import 'package:code_challenge/features/learning/domain/entities/lesson_entitie.dart';
import 'package:code_challenge/features/learning/presentation/widgets/lesson_item_widget.dart';
import 'package:code_challenge/features/learning/presentation/widgets/seasons_list.dart';
import 'package:flutter/material.dart';

class LearningBody extends StatefulWidget {
  final LessonEntity lessonsData;
  const LearningBody({super.key, required this.lessonsData});

  @override
  // ignore: library_private_types_in_public_api
  _LearningBodyState createState() => _LearningBodyState();
}

class _LearningBodyState extends State<LearningBody> {
  int currentIndex = 2;
  final CarouselSliderController carouselController =
      CarouselSliderController();
  final PageController pageController = PageController();

  void onPageChanged(int index) {
    if (mounted) {
      setState(() {
        currentIndex = index;
      });
    }
    pageController.jumpToPage(index);
    carouselController.animateToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          itemCount: widget.lessonsData.lessons.length,
          itemBuilder: (context, index) {
            return SeasonsList(
              name: widget.lessonsData.lessons[index].name!,
              count: widget.lessonsData.lessons.length,
            );
          },
          onPageChanged: (index) {
            onPageChanged(index);
            //call event for seasons of each lesson
          },
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(60),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: BottomSheet(
              backgroundColor: Colors.transparent,
              builder: (context) {
                return CarouselSlider.builder(
                  itemCount: widget.lessonsData.lessons.length,
                  itemBuilder: (context, index, realIndex) {
                    bool oneTheSide = (index == currentIndex - 1) ||
                        (index == currentIndex + 1);
                    bool twoTheSide = (index == currentIndex - 2) ||
                        (index == currentIndex + 2);
                    return GestureDetector(
                      onTap: () {
                        onPageChanged(index);
                      },
                      child: LessonItemWidget(
                        key: ValueKey(index),
                        index: index,
                        isSelected: index == currentIndex,
                        oneTheSide: oneTheSide,
                        twoTheSide: twoTheSide,
                        lessonData: widget.lessonsData.lessons[index],
                      ),
                    );
                  },
                  carouselController: carouselController,
                  options: CarouselOptions(
                    enlargeCenterPage: true,
                    autoPlay: false,
                    aspectRatio: 2.0,
                    enableInfiniteScroll: false,
                    initialPage: 2,
                    viewportFraction: 0.25,
                    onPageChanged: (index, reason) {
                      onPageChanged(index);
                    },
                  ),
                );
              },
              onClosing: () => {},
            ),
          ),
        ),
      ],
    );
  }
}
