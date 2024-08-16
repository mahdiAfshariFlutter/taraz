import 'package:code_challenge/config/models/data_state.dart';
import 'package:code_challenge/config/models/error_model.dart';
import 'package:code_challenge/features/learning/data/datasources/learning_api_provider.dart';
import 'package:code_challenge/features/learning/data/models/lesson_model.dart';
import 'package:code_challenge/features/learning/domain/repositories/learning_repository.dart';
import 'package:dio/dio.dart';

class LearningRepositoryImpl extends LearningRepository {
  final LearningApiProvider learningApiProvider;

  LearningRepositoryImpl({required this.learningApiProvider});

  @override
  Future<DataState<List<LessonModel>>> lessonsListData() async {
    try {
      Response response = await learningApiProvider.getLessonsListData();
      if (response.statusCode == 200) {
        List<LessonModel> lessons = List.from((response.data as List)
            .map((e) => LessonModel.fromJson(e))
            .toList());

        return DataSuccess(lessons);
      } else {
        return DataFailed(
          ErrorModel(status: "responce", message: 'حطا در دریافت اطلاعات'),
        );
      }
    } catch (e) {
      return DataFailed(
        ErrorModel(status: "connection", message: "خطا در اتصال"),
      );
    }
  }
}
