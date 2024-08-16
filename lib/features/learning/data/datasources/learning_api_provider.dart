import 'package:code_challenge/core/utils/constants.dart';
import 'package:dio/dio.dart';

class LearningApiProvider {
  Dio dio = Dio();

  getLessonsListData() async {
    var response = dio.get(
      '${Constants.baseUrl}test_unit',
    );
    return response;
  }
}
