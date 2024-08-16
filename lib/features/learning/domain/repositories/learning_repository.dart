import 'package:code_challenge/config/models/data_state.dart';
import 'package:code_challenge/features/learning/data/models/lesson_model.dart';

abstract class LearningRepository {
  Future<DataState<List<LessonModel>>> lessonsListData();
}
