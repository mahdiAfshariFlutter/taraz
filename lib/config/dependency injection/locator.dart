import 'package:code_challenge/core/network/network_info.dart';
import 'package:code_challenge/features/learning/data/datasources/learning_api_provider.dart';
import 'package:code_challenge/features/learning/data/repositories/learning_repository_impl.dart';
import 'package:code_challenge/features/learning/domain/repositories/learning_repository.dart';
import 'package:code_challenge/features/learning/domain/usecases/get_lessons_list_usecase.dart';
import 'package:code_challenge/features/learning/presentation/bloc/learning_bloc.dart';
import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

Future<void> initialazeDependencies() async {
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(() => DataConnectionChecker());
  learningFeature();
}

learningFeature() {
  //api_provider
  sl.registerLazySingleton(() => LearningApiProviderImpl());

  //repositories
  sl.registerLazySingleton<LearningRepository>(
    () => LearningRepositoryImpl(learningApiProvider: sl(), networkInfo: sl()),
  );

  //usecases
  sl.registerLazySingleton(
      () => GetLessonsListUsecase(learningRepository: sl()));

  //blocs
  sl.registerFactory(
    () => LearningBloc(getLessonsListUsecase: sl()),
  );
}
