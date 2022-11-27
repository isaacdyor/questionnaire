import 'package:flutter/material.dart';

class QuestionnaireList extends ChangeNotifier {
  List<Questionnaire> questionnaires = [];

  int activeQuestionnaire = 0;

  void addQuestionnaire(Questionnaire questionnaire) {
    questionnaires.add(questionnaire);
    notifyListeners();
  }
}

class Questionnaire extends ChangeNotifier {
  int id = 0;

  void setId(int myId) {
    id = myId;
    notifyListeners();
  }

  int questionIndex = 0;

  void incrementIndex() {
    questionIndex += 1;
    notifyListeners();
  }

  List<Question> questions = [];

  void addQuestion(Question question) {
    questions.add(question);
    notifyListeners();
  }

  String title = "";

  void setTitle(String myTitle) {
    title = myTitle;
    notifyListeners();
  }
}

class Question extends ChangeNotifier {
  String value = "";

  void setValue(String questionValue) {
    value = questionValue;
    notifyListeners();
  }

  List<String> options = [];

  void addOption(String option) {
    options.add(option);
    notifyListeners();
  }

  Question(this.value);
}
