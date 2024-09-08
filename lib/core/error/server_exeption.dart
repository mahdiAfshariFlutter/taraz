import 'package:dio/dio.dart';

class ServerException implements Exception {
  DioException? dioErrorObject;
  ServerException({this.dioErrorObject});

  DioException getErrorObject() {
    return dioErrorObject!;
  }
}