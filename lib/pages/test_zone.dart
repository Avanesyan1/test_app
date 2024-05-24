import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:test_app/model/question.dart';

// ignore: must_be_immutable
class MyCustomTestZone extends StatefulWidget {
  MyCustomTestZone({required this.selectedAnswers,required this.questions,required this.questionIndex,super.key});
  int questionIndex;
  List<Question> questions;
  final List<int> selectedAnswers;
  
  @override
  State<MyCustomTestZone> createState() => _MyCustomTestZoneState();
}
class _MyCustomTestZoneState extends State<MyCustomTestZone> {
  @override
  Widget build(BuildContext context) {
  return SingleChildScrollView(
    child: 
      Card(
            margin: const EdgeInsets.fromLTRB(15,30, 15, 0) ,
            elevation: 0,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(questions[widget.questionIndex].question, 
                    style: const TextStyle(fontWeight: FontWeight.w400,color: Colors.black, fontSize: 18)),
                  ),
                
                ...List.generate(questions[widget.questionIndex].option.length, (optionIndex) {
                  MapEntry entry = questions[widget.questionIndex].option.entries.elementAt(optionIndex);
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.selectedAnswers[widget.questionIndex] = optionIndex;
                      });
                    },
                    child:  Row(
            children: [
              Flexible(
                flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 5,right: 5),
                    decoration: BoxDecoration(
                      color: widget.selectedAnswers[widget.questionIndex] == optionIndex 
                             ? const Color.fromRGBO(129, 93, 234, 1) 
                             : const Color.fromARGB(96, 209, 209, 209),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: ListTile(
                      title: Text(entry.key,
                        style: TextStyle(
                          fontSize: 20,
                          color: widget.selectedAnswers[widget.questionIndex] == optionIndex 
                                 ? Colors.white : Colors.black,
                        )
                    )
                          )),
              ),
              Flexible(
                flex: 3,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 5),
                  decoration: BoxDecoration(
                    color: widget.selectedAnswers[widget.questionIndex] == optionIndex 
                           ? const Color.fromRGBO(129, 93, 234, 1) 
                           : const Color.fromARGB(96, 209, 209, 209),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: ListTile(
                    title: Text(entry.value,
                      style: TextStyle(
                        color: widget.selectedAnswers[widget.questionIndex] == optionIndex 
                               ? Colors.white : Colors.black,
                      )
                  )
            )
            )
          )
          ]
        )
      );
      }
      ),
           Padding(
             padding: const EdgeInsets.only(top: 10),
             child: DottedBorder(
                    dashPattern: const [2, 3],
                    color: Colors.black,
                    strokeWidth: 2,
                    child: Container(
                        margin: const EdgeInsets.all(8),
                        child: Text(questions[widget.questionIndex].infotext))),
           ),
      ]),
      ),
      );
  }
}