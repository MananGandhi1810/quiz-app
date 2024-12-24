import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/providers/question_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () => mounted ? context.read<QuestionProvider>().loadQuestions() : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.blue),
              foregroundColor: WidgetStatePropertyAll(Colors.white),
              iconColor: WidgetStatePropertyAll(Colors.white),
            ),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Start Quiz",
                  style: TextStyle(fontSize: 28),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8),
                ),
                Icon(
                  Icons.arrow_right_alt_rounded,
                  size: 56,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
