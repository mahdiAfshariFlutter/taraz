import 'package:code_challenge/core/error/failures.dart';
import 'package:code_challenge/core/error/server_exeption.dart';
import 'package:code_challenge/core/network/network_info.dart';
import 'package:code_challenge/features/learning/data/datasources/learning_api_provider.dart';
import 'package:code_challenge/features/learning/domain/entities/lesson_entitie.dart';
import 'package:code_challenge/features/learning/domain/repositories/learning_repository.dart';
import 'package:dartz/dartz.dart';

class LearningRepositoryImpl extends LearningRepository {
  final LearningApiProviderImpl learningApiProvider;
  final NetworkInfo networkInfo;

  LearningRepositoryImpl(
      {required this.learningApiProvider, required this.networkInfo});

  @override
  Future<Either<Failure, LessonEntity>> lessonsListData() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await learningApiProvider.getLessonsListData();
        return Right(response);
      } on ServerException catch (serverex) {
        return Left(ServerFailure(errorObject: serverex.getErrorObject()));
      }
    } else {
      return Left(OfflineFailure(message: 'No Connection'));
    }
  }
}
