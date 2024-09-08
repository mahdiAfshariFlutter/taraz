import 'package:equatable/equatable.dart';

class OlympiadExamErrorEntity extends Equatable {
  final String message;
  final bool hamdarsLearningInvalidGemCredit;

  OlympiadExamErrorEntity(
      {required this.message, required this.hamdarsLearningInvalidGemCredit});

  @override

  List<Object?> get props => [message,hamdarsLearningInvalidGemCredit];
}
