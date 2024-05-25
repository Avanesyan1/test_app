import 'package:flutter/material.dart';
import 'package:test_app/pages/exerscise_page.dart';
import 'package:test_app/pages/test_page.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'exersice_page',
      routes: {
        'exersice_page':(context) => Exerscise_Page(),
        'test_page':(context) => const TestPage(),
      },
    );
  }
}