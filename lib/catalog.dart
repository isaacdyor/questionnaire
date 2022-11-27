import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/questionnaire.dart';
import 'package:provider_app/state.dart';

class Catalog extends StatelessWidget {
  Catalog({super.key});
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalog'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<QuestionnaireList>(
                builder: (context, questionnaireList, child) =>
                    Column(children: [
                      for (var myQuestionnaire
                          in questionnaireList.questionnaires)
                        Column(
                          children: [
                            const SizedBox(height: 10),
                            TextButton(
                              style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.blue),
                              ),
                              onPressed: () => {
                                Navigator.pushNamed(context, '/questionnaire'),
                              },
                              child: Text("${myQuestionnaire.title} bruh"),
                            )
                          ],
                        )
                    ])),
          ],
        ),
      ),
    );
  }
}
