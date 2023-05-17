import 'package:flutter/material.dart';
import 'package:office_project/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Store',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const HomeScreen(),
    );
  }
}
