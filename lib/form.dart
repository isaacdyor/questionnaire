import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/state.dart';
import 'package:provider_app/text_input.dart';

class FormPage extends StatelessWidget {
  FormPage({super.key});
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
                              questionnaireList
                                  .questionnaires[
                                      questionnaireList.activeQuestionnaire]
                                  .questions[questionnaireList
                                      .questionnaires[
                                          questionnaireList.activeQuestionnaire]
                                      .questionIndex]
                                  .value,
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            questionnaireList
                                    .questionnaires[
                                        questionnaireList.activeQuestionnaire]
                                    .questions[questionnaireList
                                        .questionnaires[questionnaireList
                                            .activeQuestionnaire]
                                        .questionIndex]
                                    .options
                                    .isEmpty
                                ? Column(
                                    children: [
                                      TextInput(
                                          textEditingController:
                                              textController),
                                      const SizedBox(height: 10),
                                      ElevatedButton(
                                          onPressed: () => {
                                                // add response
                                                questionnaireList
                                                    .questionnaires[
                                                        questionnaireList
                                                            .activeQuestionnaire]
                                                    .questions[questionnaireList
                                                        .questionnaires[
                                                            questionnaireList
                                                                .activeQuestionnaire]
                                                        .questionIndex]
                                                    .addResponse(
                                                        textController.text),
                                                // increment index
                                                if (questionnaireList
                                                        .questionnaires[
                                                            questionnaireList
                                                                .activeQuestionnaire]
                                                        .questionIndex <
                                                    questionnaireList
                                                            .questionnaires[
                                                                questionnaireList
                                                                    .activeQuestionnaire]
                                                            .questions
                                                            .length -
                                                        1)
                                                  questionnaireList
                                                      .questionnaires[
                                                          questionnaireList
                                                              .activeQuestionnaire]
                                                      .incrementIndex()
                                                else
                                                  {
                                                    Navigator.pushNamed(
                                                        context, '/results'),
                                                    questionnaireList
                                                        .questionnaires[
                                                            questionnaireList
                                                                .activeQuestionnaire]
                                                        .resetIndex()
                                                  },

                                                // reset text field
                                                textController.text = "",
                                                // rebuild
                                                questionnaireList
                                                    .dummyOperation(),
                                              },
                                          child: const Text("Submit")),
                                    ],
                                  )
                                : Column(
                                    children: [
                                      for (var choice in questionnaireList
                                          .questionnaires[questionnaireList
                                              .activeQuestionnaire]
                                          .questions[questionnaireList
                                              .questionnaires[questionnaireList
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
                                                              .questions[questionnaireList
                                                                  .questionnaires[
                                                                      questionnaireList
                                                                          .activeQuestionnaire]
                                                                  .questionIndex]
                                                              .addResponse(
                                                                  choice),
                                                          if (questionnaireList
                                                                  .questionnaires[
                                                                      questionnaireList
                                                                          .activeQuestionnaire]
                                                                  .questionIndex <
                                                              questionnaireList
                                                                      .questionnaires[
                                                                          questionnaireList
                                                                              .activeQuestionnaire]
                                                                      .questions
                                                                      .length -
                                                                  1)
                                                            questionnaireList
                                                                .questionnaires[
                                                                    questionnaireList
                                                                        .activeQuestionnaire]
                                                                .incrementIndex()
                                                          else
                                                            {
                                                              Navigator.pushNamed(
                                                                  context,
                                                                  '/results'),
                                                              questionnaireList
                                                                  .questionnaires[
                                                                      questionnaireList
                                                                          .activeQuestionnaire]
                                                                  .resetIndex()
                                                            },
                                                          questionnaireList
                                                              .dummyOperation(),
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
                                                    child: Text(choice))),
                                            const SizedBox(height: 10),
                                          ],
                                        )
                                    ],
                                  )
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
