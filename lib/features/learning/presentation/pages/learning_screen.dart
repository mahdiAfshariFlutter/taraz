import 'package:code_challenge/features/learning/presentation/bloc/learning_bloc.dart';
import 'package:code_challenge/features/learning/presentation/widgets/learning_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LearningScreen extends StatelessWidget {
  const LearningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<LearningBloc>(context).add(GetLessonsListEvent());
    return BlocBuilder<LearningBloc, LearningState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: (state is Loading)
              ? const Center(
                  child: CircularProgressIndicator(
                  color: Colors.purple,
                ))
              : (state is Error)
                  ? const Center(
                      child: Text('error'),
                    )
                  : (state is Completed)
                      ? LearningBody(
                          lessonsData: state.lessonDataEntity,
                        )
                      : Container(),
        );
      },
    );
  }
}
