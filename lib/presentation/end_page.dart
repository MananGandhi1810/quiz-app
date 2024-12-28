import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/providers/score_provider.dart';

class EndPage extends StatelessWidget {
  const EndPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Score"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Your final score is:"),
            Padding(
              padding: EdgeInsets.all(4),
            ),
            Text(
              "${context.watch<ScoreProvider>().correct}/${context.watch<ScoreProvider>().total}",
              style: TextStyle(fontSize: 24),
            ),
            Padding(
              padding: EdgeInsets.all(4),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<ScoreProvider>().resetScore();
                Navigator.of(context).pop();
              },
              child: Text("Okay!"),
            )
          ],
        ),
      ),
    );
  }
}
