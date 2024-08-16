import 'package:code_challenge/config/models/error_model.dart';
import 'package:flutter/material.dart';

@immutable
abstract class EventStatus<T> {
  final int? itemId;
  final T? data;
  final ErrorModel? message;

  const EventStatus({
    this.itemId,
    this.data,
    this.message,
  });
}

class EventLoading<T> extends EventStatus<T> {
  const EventLoading({super.itemId});
}

class EventCompleted<T> extends EventStatus<T> {
  const EventCompleted(T data) : super(data: data);
}

class EventLoadMore<T> extends EventStatus<T> {
  const EventLoadMore({super.data});
}

class EventNoData<T> extends EventCompleted<T> {
  const EventNoData(super.data);
}

class EventInitial<T> extends EventStatus<T> {}

class EventError<T> extends EventStatus<T> {
  const EventError({required ErrorModel message})
      : super(
          message: message,
        );
}

