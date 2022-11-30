import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/state.dart';

class Catalog extends StatelessWidget {
  const Catalog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalog'),
      ),
      body: Center(
        child: Column(
          children: [
            Consumer<QuestionnaireList>(
                builder: (context, questionnaireList, child) =>
                    Column(children: [
                      Text(
                        "Questionnaires",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 10),
                      if (questionnaireList.questionnaires.isEmpty)
                        const Text("No Questionnaires")
                      else
                        Column(
                          children: [
                            for (var myQuestionnaire
                                in questionnaireList.questionnaires)
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                        style: ButtonStyle(
                                          foregroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.white),
                                        ),
                                        onPressed: () => {
                                          questionnaireList
                                              .setActive(myQuestionnaire.id),
                                          Navigator.pushNamed(context, '/form'),
                                        },
                                        child: Text(myQuestionnaire.title),
                                      ),
                                      ElevatedButton(
                                        style: ButtonStyle(
                                          foregroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.white),
                                        ),
                                        onPressed: () => {
                                          questionnaireList
                                              .setActive(myQuestionnaire.id),
                                          Navigator.pushNamed(
                                              context, '/results'),
                                        },
                                        child: const Text("Results"),
                                      ),
                                      ElevatedButton(
                                        style: ButtonStyle(
                                          foregroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.white),
                                        ),
                                        onPressed: () => {
                                          questionnaireList
                                              .setActive(myQuestionnaire.id),
                                          Navigator.pushNamed(context, '/edit'),
                                        },
                                        child: const Text("Edit"),
                                      ),
                                      ElevatedButton(
                                        style: ButtonStyle(
                                          foregroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.white),
                                        ),
                                        onPressed: () => {
                                          questionnaireList.deleteQuestionnaire(
                                              myQuestionnaire.id),
                                        },
                                        child: const Text("Delete"),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              ),
                          ],
                        ),
                      ElevatedButton(
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                        ),
                        onPressed: () => {
                          Navigator.pushNamed(context, '/'),
                        },
                        child: const Text("Create New Questionnaire"),
                      )
                    ])),
          ],
        ),
      ),
    );
  }
}
