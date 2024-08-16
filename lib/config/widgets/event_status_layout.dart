import 'package:code_challenge/config/models/error_model.dart';
import 'package:code_challenge/config/models/event_status.dart';
import 'package:flutter/widgets.dart';


class EventStatusLayout<T> extends StatelessWidget {
  final EventStatus<T> status;
  final Widget onErrorStatus;
  final void Function(ErrorModel error)? onErrorListener;
  final Widget Function(BuildContext context, T? data) onCompletedStatus;
  final Widget Function(BuildContext context, T? data)? onLoadMore;
  final Widget onInitialStatus;
  final Widget onLoadingStatus;
  const EventStatusLayout({
    super.key,
    required this.status,
    required this.onCompletedStatus,
    required this.onErrorStatus,
    required this.onInitialStatus,
    required this.onLoadingStatus,
    this.onLoadMore,
    this.onErrorListener,
  });

  @override
  Widget build(BuildContext context) {
    if (status is EventError) {
      if (onErrorListener != null) {
        onErrorListener!(status.message!);
      }
    }
    if (status is EventCompleted || status is EventNoData || status is EventLoadMore) {
      return StreamBuilder(
        stream: Stream.value(status),
        builder: (context, snapshot) {
          return onCompletedStatus(context, status.data);
        },
      );
    }
    if (status is EventError) {
      return onErrorStatus;
    }
    if (status is EventInitial) {
      return onInitialStatus;
    }
    if (status is EventLoading) {
      return onLoadingStatus;
    }
    return Container();
  }
}

