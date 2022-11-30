import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/create.dart';
import 'package:provider_app/catalog.dart';
import 'package:provider_app/edit.dart';
import 'package:provider_app/form.dart';
import 'package:provider_app/results.dart';
import 'package:provider_app/state.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => QuestionnaireList(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => CreatePage(),
        '/catalog': (context) => Catalog(),
        '/results': (context) => ResultsPage(),
        '/form': (context) => FormPage(),
        '/edit': (context) => EditPage(),
      },
    );
  }
}
