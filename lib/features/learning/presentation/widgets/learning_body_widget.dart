import 'package:carousel_slider/carousel_slider.dart';
import 'package:code_challenge/config/models/event_status.dart';
import 'package:code_challenge/features/learning/data/models/lesson_model.dart';
import 'package:code_challenge/features/learning/presentation/widgets/lesson_item.dart';
import 'package:flutter/material.dart';

class LearningBodyWidget extends StatefulWidget {
  final EventStatus<List<LessonModel>> lessonsData;
  const LearningBodyWidget({super.key, required this.lessonsData});

  @override
  // ignore: library_private_types_in_public_api
  _LearningBodyWidgetState createState() => _LearningBodyWidgetState();
}

class _LearningBodyWidgetState extends State<LearningBodyWidget> {
  int currentIndex = 2;
  final CarouselSliderController controller = CarouselSliderController();
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
           physics: const NeverScrollableScrollPhysics(),
           controller: pageController,
           itemCount: widget.lessonsData.data!.length,
           itemBuilder: (context, index) {
             return Center(
               child: Text(
                 'سرفصل های درس ${widget.lessonsData.data![index].name}',
                 style: const TextStyle(fontSize: 24),
               ),
             );
           },
           onPageChanged: (index) {
             setState(() {
               currentIndex = index;
             });
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
                  itemCount: widget.lessonsData.data!.length,
                  itemBuilder: (context, index, realIndex) {
                    bool oneTheSide = (index == currentIndex - 1) ||
                        (index == currentIndex + 1);
                    bool twoTheSide = (index == currentIndex - 2) ||
                        (index == currentIndex + 2);
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          currentIndex = index;
                        });
                        controller.animateToPage(index);
                        pageController.jumpToPage(index);
                      },
                      child: LessonItem(
                        index: index,
                        isSelected: index == currentIndex,
                        oneTheSide: oneTheSide,
                        twoTheSide: twoTheSide,
                        lessonData: widget.lessonsData.data![index],
                      ),
                    );
                  },
                  carouselController: controller,
                  options: CarouselOptions(
                    enlargeCenterPage: true,
                    autoPlay: false,
                    aspectRatio: 2.0,
                    enableInfiniteScroll: false,
                    initialPage: 2,
                    viewportFraction: 0.25,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                      pageController.jumpToPage(index);
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
