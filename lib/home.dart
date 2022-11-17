import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/create.dart';
import 'package:provider_app/state.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
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
            Consumer<Counter>(
                builder: (context, counter, child) => Column(children: [
                      counter.questionIndex < counter.userQuestions.length
                          ? Column(
                              children: [
                                Text(
                                  counter.userQuestions[counter.questionIndex],
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium,
                                ),
                                SizedBox(
                                  width: 500.0,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                    controller: textController,
                                    maxLines: null,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                ElevatedButton(
                                    onPressed: () => {
                                          counter
                                              .formSubmit(textController.text),
                                          textController.text = "",
                                        },
                                    child: const Text("Submit"))
                              ],
                            )
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
                                for (var response in counter.responses)
                                  Container(
                                    width: double.infinity,
                                    margin: const EdgeInsets.all(10),
                                    child: Text(
                                      response,
                                      style: const TextStyle(fontSize: 18),
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
