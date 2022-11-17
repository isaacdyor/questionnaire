import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/home.dart';
import 'package:provider_app/state.dart';

class CreatePage extends StatelessWidget {
  CreatePage({super.key});
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
            Text(
              "Create Your Quiz",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 10),
            Consumer<Counter>(
                builder: (context, counter, child) => Column(children: [
                      Column(
                        children: [
                          for (var response in counter.userQuestions)
                            Container(
                              width: double.infinity,
                              margin: const EdgeInsets.all(10),
                              child: Text(
                                response,
                                style: const TextStyle(fontSize: 18),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          SizedBox(
                            width: 500.0,
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              controller: textController,
                              maxLines: null,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                  onPressed: () => {
                                        counter
                                            .addQuestion(textController.text),
                                        textController.text = "",
                                      },
                                  child: const Text("Add")),
                              ElevatedButton(
                                  onPressed: () => {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MyHomePage()),
                                        )
                                      },
                                  child: const Text("Complete"))
                            ],
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
