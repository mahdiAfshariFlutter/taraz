import 'package:code_challenge/core/error/failures.dart';
import 'package:code_challenge/features/learning/domain/entities/lesson_entitie.dart';
import 'package:code_challenge/features/learning/domain/repositories/learning_repository.dart';
import 'package:dartz/dartz.dart';

class GetLessonsListUsecase {
  final LearningRepository learningRepository;

  GetLessonsListUsecase({required this.learningRepository});

  Future<Either<Failure, LessonEntity>> call() async {
    return await learningRepository.lessonsListData();
  }
}
