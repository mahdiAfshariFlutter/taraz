import 'package:code_challenge/app.dart';
import 'package:code_challenge/config/dependency%20injection/locator.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialazeDependencies();
  runApp(
    const App(),
  );
}