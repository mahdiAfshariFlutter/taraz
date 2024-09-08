import 'package:code_challenge/features/learning/domain/entities/olympiad_exam_error_entity.dart';

class OlympiadExamErrorModel extends OlympiadExamErrorEntity {
  OlympiadExamErrorModel(
      {required super.message, required super.hamdarsLearningInvalidGemCredit});

  factory OlympiadExamErrorModel.fromJson(Map<String,dynamic> json) {
    return OlympiadExamErrorModel(
        message: json['message'],
        hamdarsLearningInvalidGemCredit:
            json['hamdarslearningInvalidGemCredit']);
  }
}
