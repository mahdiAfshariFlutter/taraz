import 'package:code_challenge/config/models/event_status.dart';
import 'package:code_challenge/config/widgets/event_status_layout.dart';
import 'package:code_challenge/features/learning/presentation/bloc/learning_bloc.dart';
import 'package:code_challenge/features/learning/presentation/widgets/learning_body_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LearningScreen extends StatelessWidget {
  const LearningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LearningBloc, LearningState>(
      builder: (context, state) {
        if (state.getLessonsListStatus is EventInitial) {
          BlocProvider.of<LearningBloc>(context).add(GetLessonsListEvent());
        }
        return Scaffold(
          backgroundColor: Colors.white,
          body: EventStatusLayout(
            status: state.getLessonsListStatus,
            onCompletedStatus: (context, data) {
              return LearningBodyWidget(
                lessonsData: state.getLessonsListStatus,
              );
            },
            onErrorStatus: const Center(
              child: Text('error'),
            ),
            onInitialStatus: Container(),
            onLoadingStatus: const Center(
              child: CircularProgressIndicator(
                color: Colors.purple,
              ),
            ),
          ),
        );
      },
    );
  }
}
