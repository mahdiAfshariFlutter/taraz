import 'package:code_challenge/features/learning/data/datasources/learning_api_provider.dart';
import 'package:code_challenge/features/learning/data/repositories/learning_repository_impl.dart';
import 'package:code_challenge/features/learning/domain/repositories/learning_repository.dart';
import 'package:code_challenge/features/learning/domain/usecases/get_lessons_list_usecase.dart';
import 'package:code_challenge/features/learning/presentation/bloc/learning_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

setup() {

  //api_provider
  locator.registerSingleton<LearningApiProvider>(LearningApiProvider());

  //repositories
  locator.registerSingleton<LearningRepository>(LearningRepositoryImpl(learningApiProvider: locator()));

  //usecases
  locator.registerSingleton<GetLessonsListUsecase>(GetLessonsListUsecase(learningRepository: locator()));

  //blocs
  locator.registerSingleton<LearningBloc>(
    LearningBloc(getLessonsListUsecase: locator()),
  );
}
