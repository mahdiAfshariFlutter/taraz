import 'package:equatable/equatable.dart';

class LessonEntity extends Equatable {
  final List<LessonDataEntity> lessons;

  const LessonEntity({required this.lessons});

  @override
  List<Object?> get props => [lessons];
}

class LessonDataEntity extends Equatable {
  final String? id;
  final String? name;
  final String? unitIcon;
  final int? sumUserStudy;
  final int? hamdarsUserUnitLevelIndex;
  final int? hamdarsUserCurrentUnitLevelPoint;
  final int? hamdarsUserMaxUnitLevelPoint;
  final int? hamdarsUserMinUnitLevelPoint;

  const LessonDataEntity({
    required this.id,
    required this.name,
    required this.unitIcon,
    required this.sumUserStudy,
    required this.hamdarsUserUnitLevelIndex,
    required this.hamdarsUserCurrentUnitLevelPoint,
    required this.hamdarsUserMaxUnitLevelPoint,
    required this.hamdarsUserMinUnitLevelPoint,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        unitIcon,
        sumUserStudy,
        hamdarsUserCurrentUnitLevelPoint,
        hamdarsUserMaxUnitLevelPoint,
        hamdarsUserMinUnitLevelPoint,
        hamdarsUserUnitLevelIndex,
      ];
}
