import 'package:flutter/material.dart';
import 'package:test_app/model/question.dart';
import 'package:test_app/pages/bottomSheet.dart';
import 'package:test_app/pages/test_zone.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override

  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  List<int> selectedAnswers = List.filled(questions.length, -1);
  bool answer = false;
  
 
  @override
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Тестироване',style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: questions.length + 1, 
        itemBuilder: (context, index) {
          if (index < questions.length) {
            return MyCustomTestZone(questionIndex: index, questions: questions,selectedAnswers: selectedAnswers,);
          } else {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
                  backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(118, 212, 103, 1))),
                child: Text(answer ?'Тест пройден, молодец!':'Пройти тест',style: const TextStyle(color: Colors.white,fontSize:18),),
                onPressed:() {
                  int correctAnswers = 0;
                  for (int i = 0; i < questions.length; i++) {
                    if (selectedAnswers[i] == questions[i].correctAnswerIndex) {
                      correctAnswers++;
                    }
                  }
                  setState(() {
                  answer = correctAnswers == questions.length;

                  });
                  showModalBottomSheet(
                    backgroundColor: const Color.fromRGBO(129, 93, 234, 1),
                    context: context,
                    builder: (BuildContext bc) {
                    return MyCustomBottomSheet(answer: answer);
                  }
                );
              }),
            );
          }
        },
      ),
    );
  }
}