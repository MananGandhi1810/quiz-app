import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/models/question_model.dart';
import 'package:quiz_app/providers/question_provider.dart';
import 'package:quiz_app/providers/score_provider.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  QuestionModel? _question;
  String? _submittedAnswer;

  @override
  void initState() {
    super.initState();
    setState(() {
      _question = context.read<QuestionProvider>().getRandomQuestion();
    });
  }

  void submitAnswer(String answer) {
    if (_submittedAnswer != null) {
      return;
    }
    context.read<ScoreProvider>().submitAnswer(answer == _question?.answer);
    setState(() {
      _submittedAnswer = answer;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Question"),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Text(
              "${context.watch<ScoreProvider>().correct}/${context.watch<ScoreProvider>().total}",
              style: TextStyle(fontSize: 24),
            ),
          )
        ],
      ),
      body: _question != null
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          _question?.question ?? "",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Padding(
                          padding: EdgeInsets.all(4),
                        ),
                        for (int i = 0; i < 4; i++)
                          Column(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: ElevatedButton(
                                  onPressed: () =>
                                      submitAnswer(_question?.options[i]),
                                  style: ButtonStyle(
                                    elevation: WidgetStatePropertyAll(2),
                                    backgroundColor: WidgetStatePropertyAll(
                                      _submittedAnswer != null
                                          ? _question?.answer ==
                                                  _question?.options[i]
                                              ? Colors.green
                                              : _submittedAnswer ==
                                                      _question?.options[i]
                                                  ? Colors.red
                                                  : Colors.white
                                          : Colors.white,
                                    ),
                                  ),
                                  child: Text(
                                    _question?.options[i] ?? "",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                              i != 3
                                  ? Padding(
                                      padding: EdgeInsets.all(4),
                                    )
                                  : Container(),
                            ],
                          )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("End"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_submittedAnswer == null) {
                            return;
                          }
                          Navigator.of(context).pushReplacement(
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      const QuestionPage(),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                const begin = Offset(1.0, 0.0);
                                const end = Offset.zero;
                                const curve = Curves.ease;

                                final tween = Tween(begin: begin, end: end);
                                final curvedAnimation = CurvedAnimation(
                                  parent: animation,
                                  curve: curve,
                                );

                                return SlideTransition(
                                  position: tween.animate(curvedAnimation),
                                  child: child,
                                );
                              },
                            ),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            Colors.lightBlue,
                          ),
                        ),
                        child: Text(
                          "Next",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
