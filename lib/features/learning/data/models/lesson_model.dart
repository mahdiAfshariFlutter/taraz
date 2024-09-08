import 'package:code_challenge/features/learning/domain/entities/lesson_entitie.dart';

class LessonModel extends LessonEntity {
  const LessonModel({required super.lessons});
  factory LessonModel.fromJson(List<dynamic> json) {
    List<LessonDataEntity> lessons = [];
    for (var element in json) {
      lessons.add(LessonDataModel.fromJson(element));
    }
    return LessonModel(lessons: lessons);
  }
}

class LessonDataModel extends LessonDataEntity {
  const LessonDataModel({
    required super.id,
    required super.name,
    required super.unitIcon,
    required super.sumUserStudy,
    required super.hamdarsUserUnitLevelIndex,
    required super.hamdarsUserCurrentUnitLevelPoint,
    required super.hamdarsUserMaxUnitLevelPoint,
    required super.hamdarsUserMinUnitLevelPoint,
  });

  factory LessonDataModel.fromJson(Map<String, dynamic> json) {
    return LessonDataModel(
      id: json['id'],
      name: json['name'],
      unitIcon: json['unit_icon'],
      sumUserStudy: json['sum_user_study'],
      hamdarsUserUnitLevelIndex: json['hamdarsUserUnitLevelIndex'],
      hamdarsUserCurrentUnitLevelPoint:
          json['hamdarsUserCurrentUnitLevelPoint'],
      hamdarsUserMaxUnitLevelPoint: json['hamdarsUserMaxUnitLevelPoint'],
      hamdarsUserMinUnitLevelPoint: json['hamdarsUserMinUnitLevelPoint'],
    );
  }
}
