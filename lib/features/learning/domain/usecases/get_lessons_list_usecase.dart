import 'package:code_challenge/config/models/data_state.dart';
import 'package:code_challenge/features/learning/data/models/lesson_model.dart';
import 'package:code_challenge/features/learning/domain/repositories/learning_repository.dart';

class GetLessonsListUsecase {
  final LearningRepository learningRepository;

  GetLessonsListUsecase({required this.learningRepository});

  Future<DataState<List<LessonModel>>> call() async {
    return await learningRepository.lessonsListData();
  }
}
