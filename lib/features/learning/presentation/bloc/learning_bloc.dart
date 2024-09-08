import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:code_challenge/features/learning/domain/entities/lesson_entitie.dart';
import 'package:code_challenge/features/learning/domain/usecases/get_lessons_list_usecase.dart';
import 'package:equatable/equatable.dart';

part 'learning_event.dart';
part 'learning_state.dart';

class LearningBloc extends Bloc<LearningEvent, LearningState> {
  final GetLessonsListUsecase getLessonsListUsecase;
  LearningBloc({
    required this.getLessonsListUsecase,
  }) : super(LearninigInitial()) {
    on<GetLessonsListEvent>(onGetLessonsList);
  }
  //
  FutureOr<void> onGetLessonsList(
      GetLessonsListEvent event, Emitter<LearningState> emit) async {
    emit(Loading());

    final res = await getLessonsListUsecase();
    emit(await res.fold((failure) {
      return Error(message: failure.getErrorMessage);
      //or show exact server error message
    }, (response) {
      return Completed(lessonDataEntity: response);
    }));
  }
}
