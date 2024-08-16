part of 'learning_bloc.dart';

class LearningState extends Equatable {
  final EventStatus<List<LessonModel>> getLessonsListStatus;
  const LearningState({required this.getLessonsListStatus});

  @override
  List<Object> get props => [getLessonsListStatus];

  LearningState copyWith({
    EventStatus<List<LessonModel>>? newGetLessonsListStatus,
  }) {
    return LearningState(
        getLessonsListStatus: newGetLessonsListStatus ?? getLessonsListStatus);
  }
}
