import 'package:code_challenge/features/learning/data/models/olympiad_exam_error_model.dart';
import 'package:code_challenge/features/learning/domain/entities/olympiad_exam_error_entity.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  String get getErrorMessage;
  OlympiadExamErrorEntity get getOlymiadErrorObject;
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  final DioException? errorObject;
  ServerFailure({this.errorObject});

  @override
  String get getErrorMessage => errorObject!.response!.data['message'];

  @override
  OlympiadExamErrorEntity get getOlymiadErrorObject =>
      OlympiadExamErrorModel.fromJson(errorObject!.response!.data);
}

class CacheFailure extends Failure {
  @override
  // TODO: implement getErrorMessage
  String get getErrorMessage => throw UnimplementedError();

  @override
  // TODO: implement getOlymiadErrorObject
  OlympiadExamErrorEntity get getOlymiadErrorObject =>
      throw UnimplementedError();
}

class OfflineFailure extends Failure {
  final String message;

  OfflineFailure({required this.message});

  @override
  // TODO: implement getErrorMessage
  String get getErrorMessage => message;

  @override
  // TODO: implement getOlymiadErrorObject
  OlympiadExamErrorEntity get getOlymiadErrorObject =>
      throw UnimplementedError();
}
