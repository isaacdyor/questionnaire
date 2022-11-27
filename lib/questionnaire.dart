import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/create.dart';
import 'package:provider_app/state.dart';

class QuestionnairePage extends StatelessWidget {
  QuestionnairePage({super.key});
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Questionnaire'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<QuestionnaireList>(
                builder: (context, questionnaireList, child) =>
                    Column(children: [
                      // if question index < questions.length
                      questionnaireList
                                  .questionnaires[
                                      questionnaireList.activeQuestionnaire]
                                  .questionIndex <
                              questionnaireList
                                  .questionnaires[
                                      questionnaireList.activeQuestionnaire]
                                  .questions
                                  .length
                          // display the question and answer options
                          ? Column(
                              children: [
                                Text(
                                  questionnaireList
                                      .questionnaires[
                                          questionnaireList.activeQuestionnaire]
                                      .questions[questionnaireList
                                          .questionnaires[questionnaireList
                                              .activeQuestionnaire]
                                          .questionIndex]
                                      .value,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium,
                                ),
                                Text(
                                    'Index: ${questionnaireList.questionnaires[questionnaireList.activeQuestionnaire].questionIndex}'),
                                questionnaireList
                                        .questionnaires[questionnaireList
                                            .activeQuestionnaire]
                                        .questions[questionnaireList
                                            .questionnaires[questionnaireList
                                                .activeQuestionnaire]
                                            .questionIndex]
                                        .options
                                        .isEmpty
                                    ? Column(
                                        children: [
                                          SizedBox(
                                            width: 500.0,
                                            child: TextField(
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                              ),
                                              controller: textController,
                                              maxLines: null,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          ElevatedButton(
                                              onPressed: () => {
                                                    questionnaireList
                                                        .questionnaires[
                                                            questionnaireList
                                                                .activeQuestionnaire]
                                                        .incrementIndex()
                                                  },
                                              child: const Text("Submit"))
                                        ],
                                      )
                                    : Column(
                                        children: [
                                          for (var choice in questionnaireList
                                              .questionnaires[questionnaireList
                                                  .activeQuestionnaire]
                                              .questions[questionnaireList
                                                  .questionnaires[
                                                      questionnaireList
                                                          .activeQuestionnaire]
                                                  .questionIndex]
                                              .options)
                                            Column(
                                              children: [
                                                SizedBox(
                                                  width: 400,
                                                  child: ElevatedButton(
                                                    onPressed: () => {
                                                      questionnaireList
                                                          .questionnaires[
                                                              questionnaireList
                                                                  .activeQuestionnaire]
                                                          .incrementIndex()
                                                    },
                                                    style: ButtonStyle(
                                                        textStyle:
                                                            MaterialStateProperty.all(
                                                                const TextStyle(
                                                                    color: Colors
                                                                        .white)),
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all(Colors
                                                                    .blue)),
                                                    child: Text(choice),
                                                  ),
                                                ),
                                                const SizedBox(height: 10),
                                              ],
                                            )
                                        ],
                                      )
                              ],
                            )
                          // display results
                          : Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  margin: const EdgeInsets.all(10),
                                  child: const Text(
                                    "Results",
                                    style: TextStyle(fontSize: 28),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            )
                    ])),
          ],
        ),
      ),
    );
  }
}
