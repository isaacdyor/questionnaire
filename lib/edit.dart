import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/state.dart';
import 'package:provider_app/text_input.dart';

class EditPage extends StatelessWidget {
  EditPage({super.key});
  TextEditingController textController = TextEditingController();
  TextEditingController textController2 = TextEditingController();
  TextEditingController textController3 = TextEditingController();

  Questionnaire myQuestionnaire = Questionnaire();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Questionnaire'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "Create Your Quiz",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 10),
            Consumer<QuestionnaireList>(
                builder: (context, questionnaireList, child) => Column(
                      children: [
                        Text(
                          "Title",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        TextInput(textEditingController: textController),
                        const SizedBox(height: 10),
                        ElevatedButton(
                            onPressed: () => {
                                  myQuestionnaire.setTitle(textController.text),
                                  textController.text = "",
                                },
                            child: const Text("Add")),
                        Text(
                          "Add Question",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        TextInput(textEditingController: textController2),
                        const SizedBox(height: 10),
                        ElevatedButton(
                            onPressed: () => {
                                  myQuestionnaire.addQuestion(
                                      Question(textController2.text)),
                                  textController2.text = "",
                                },
                            child: const Text("Add")),
                        Text(
                          "Answer Choices",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        TextInput(textEditingController: textController3),
                        const SizedBox(height: 10),
                        ElevatedButton(
                            onPressed: () => {
                                  // add text to last question in the list of questions
                                  myQuestionnaire.questions[
                                          myQuestionnaire.questions.length - 1]
                                      .addOption(textController3.text),
                                  // clear text field
                                  textController3.text = "",
                                },
                            child: const Text("Add Answer Choice")),
                        ElevatedButton(
                            onPressed: () => {
                                  questionnaireList
                                      .addQuestionnaire(myQuestionnaire),
                                  myQuestionnaire.setId(
                                      questionnaireList.questionnaires.length -
                                          1),
                                  Navigator.pushNamed(context, '/catalog'),
                                },
                            child: const Text("Complete")),
                      ],
                    )),
          ],
        ),
      ),
    );
  }
}
