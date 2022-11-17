import 'package:flutter/material.dart';

class Counter extends ChangeNotifier {
  int questionIndex = 0;

  List<String> responses = [];

  void formSubmit(String response) {
    responses.add(response);
    questionIndex += 1;
    notifyListeners();
  }

  final List<String> userQuestions = [];

  void addQuestion(String response) {
    userQuestions.add(response);
    notifyListeners();
  }
}
