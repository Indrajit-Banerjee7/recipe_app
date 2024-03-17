import 'package:flutter/material.dart';
import 'package:recipe_app/views/home.dart';
// 8098ffa0bfmshe8c3314adea97c6p13ca7fjsn6ee3c290edb8

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      home: HomePage(),
    );
  }
}

