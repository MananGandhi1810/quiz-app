import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/models/question_model.dart';
import 'package:quiz_app/providers/question_provider.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  QuestionModel? _question;

  @override
  void initState() {
    super.initState();
    setState(() {
      _question = context.read<QuestionProvider>().getRandomQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Question"),
        centerTitle: true,
      ),
      body: _question != null
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    _question?.question ?? "",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(4),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    _question?.options[1] ?? "",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(4),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    _question?.options[2] ?? "",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(4),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    _question?.options[3] ?? "",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(4),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    _question?.options[4] ?? "",
                  ),
                ),
              ],
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
