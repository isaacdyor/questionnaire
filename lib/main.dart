import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/create.dart';
import 'package:provider_app/state.dart';
import 'package:provider_app/home.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Counter(),
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
        '/create': (context) => MyHomePage(),
      },
    );
  }
}
