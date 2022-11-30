import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/state.dart';
import 'package:provider_app/text_input.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({super.key});
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Questionnaire'),
      ),
      body: Center(
        child: Column(
          children: [
            Consumer<QuestionnaireList>(
                builder: (context, questionnaireList, child) => Column(
                      children: [
                        Column(
                          children: [
                            Text(
                              "Responses",
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            const SizedBox(height: 30),
                            if (questionnaireList
                                .questionnaires[
                                    questionnaireList.activeQuestionnaire]
                                .questions
                                .isEmpty)
                              const Text("No Questions")
                            else
                              Column(children: [
                                for (var question in questionnaireList
                                    .questionnaires[
                                        questionnaireList.activeQuestionnaire]
                                    .questions)
                                  Column(
                                    children: [
                                      Text(
                                        question.value,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall,
                                      ),
                                      if (question.responses.isNotEmpty)
                                        for (var response in question.responses)
                                          Text(response)
                                      else
                                        const Text("No Responses")
                                    ],
                                  ),
                                const SizedBox(height: 50),
                                ElevatedButton(
                                  style: ButtonStyle(
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                  ),
                                  onPressed: () => {
                                    Navigator.pushNamed(context, '/catalog'),
                                  },
                                  child: const Text("Catalog"),
                                )
                              ])
                          ],
                        )
                      ],
                    )),
          ],
        ),
      ),
    );
  }
}
