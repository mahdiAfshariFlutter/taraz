part of 'learning_bloc.dart';

sealed class LearningState extends Equatable {
  const LearningState();

  @override
  List<Object> get props => [];
}

class LearninigInitial extends LearningState {}

class Loading extends LearningState {}

class Error extends LearningState {
  final String message;

  const Error({required this.message});
}

class Completed extends LearningState {
  final LessonEntity lessonDataEntity;

  const Completed(
      {required this.lessonDataEntity});
}
