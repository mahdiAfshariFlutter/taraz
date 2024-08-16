
import 'package:code_challenge/config/models/error_model.dart';

abstract class DataState<T> {
  final T? data;
  final ErrorModel? error;

  const DataState(this.data, this.error);
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data, null);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(ErrorModel error) : super(null, error);
}