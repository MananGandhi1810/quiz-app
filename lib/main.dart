import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/providers/question_provider.dart';
import './presentation/home_page.dart';

void main() {
  runApp(RootApp());
}

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => QuestionProvider(),
      child: MaterialApp(
        theme: ThemeData(
          colorSchemeSeed: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}
