import 'package:bloc/bloc.dart';
import 'package:code_challenge/config/models/data_state.dart';
import 'package:code_challenge/config/models/event_status.dart';
import 'package:code_challenge/features/learning/data/models/lesson_model.dart';
import 'package:code_challenge/features/learning/domain/usecases/get_lessons_list_usecase.dart';
import 'package:equatable/equatable.dart';

part 'learning_event.dart';
part 'learning_state.dart';

class LearningBloc extends Bloc<LearningEvent, LearningState> {
  final GetLessonsListUsecase getLessonsListUsecase;
  LearningBloc({
    required this.getLessonsListUsecase,
  }) : super(
          LearningState(
            getLessonsListStatus: EventInitial(),
          ),
        ) {
    //
    on<GetLessonsListEvent>((event, emit) async {
      emit(
        state.copyWith(
          newGetLessonsListStatus: const EventLoading(),
        ),
      );
      var result = await getLessonsListUsecase();
      if (result is DataSuccess) {
        return emit(
          state.copyWith(newGetLessonsListStatus: EventCompleted(result.data!)),
        );
      } else if (result is DataFailed) {
        return emit(
          state.copyWith(
            newGetLessonsListStatus: EventError(message: result.error!),
          ),
        );
      }
    });
  }
}
