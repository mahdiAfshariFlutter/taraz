import 'package:code_challenge/core/error/server_exeption.dart';
import 'package:code_challenge/core/utils/constants.dart';
import 'package:code_challenge/features/learning/data/models/lesson_model.dart';
import 'package:dio/dio.dart';

abstract class LearningApiProvider {
  Future<LessonModel> getLessonsListData();
}

class LearningApiProviderImpl implements LearningApiProvider {
  Dio dio = Dio();

  @override
  Future<LessonModel> getLessonsListData() async {
    try {
      var response = await dio.get(
        '${Constants.baseUrl}test_unit',
      );
      return LessonModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException(dioErrorObject: e);
    }
  }
}
