import 'package:code_challenge/config/dependency%20injection/locator.dart';
import 'package:code_challenge/features/learning/presentation/bloc/learning_bloc.dart';
import 'package:code_challenge/features/learning/presentation/pages/learning_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => locator<LearningBloc>(),
        ),
      ],
      child: const MaterialApp(
        home: LearningScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
