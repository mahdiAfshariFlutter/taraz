import 'package:code_challenge/core/error/failures.dart';
import 'package:code_challenge/features/learning/domain/entities/lesson_entitie.dart';
import 'package:dartz/dartz.dart';

abstract class LearningRepository {
  Future<Either<Failure, LessonEntity>> lessonsListData();
}
