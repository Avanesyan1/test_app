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
        leading: Padding(
           padding: const EdgeInsets.only(left: 20),
           child: Container(
                    width: 40,  
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(243, 243, 243, 1), 
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context); 
                        },
                        icon :const Icon(Icons.arrow_back_ios, color: Color.fromRGBO(44, 47, 54, 1),size: 18,),
                        ),
                    ),
                    ),
                  
         ),
        title: const Text('Тестироване',style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        scrolledUnderElevation: 0,
      ),
      body: ListView.builder(
        itemCount: questions.length + 1, 
        itemBuilder: (context, index) {
          if (index < questions.length) {
            return MyCustomTestZone(questionIndex: index, questions: questions,selectedAnswers: selectedAnswers,);
          } else {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: 358,
                height: 56,
                child: TextButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                    backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(118, 212, 103, 1))),
                  child: Text(answer ?'Тест пройден, молодец!':'Пройти тест',style: const TextStyle(color: Colors.white,fontSize:17),),
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
              ),
            );
          }
        },
      ),
    );
  }
}