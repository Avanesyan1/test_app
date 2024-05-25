import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:test_app/model/question.dart';
import 'package:google_fonts/google_fonts.dart';

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
    child:Card(
            margin: const EdgeInsets.fromLTRB(20,20, 20, 0), 
            elevation: 0,
            child: Column(
              children: [
                IntrinsicHeight(
                  child: Row(
                    children: [
                        Text(questions[widget.questionIndex].question[0][0], 
                          style: GoogleFonts.inter(textStyle: const TextStyle(fontWeight: FontWeight.bold,color: Colors.black, fontSize: 15))),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(questions[widget.questionIndex].question[1][0], 
                                   style: GoogleFonts.inter(textStyle: const TextStyle(fontWeight: FontWeight.bold,color: Colors.black, fontSize: 15))),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
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
                          Expanded(
                              flex: 15,
                              child: Center(
                                child: Container(
                                  constraints: BoxConstraints(
                                    minHeight: MediaQuery.of(context).size.width * 0.15,
                                    minWidth: MediaQuery.of(context).size.height * 0.15,
                                    maxHeight: double.infinity,
                                    maxWidth: double.infinity
                                  ),
                                  margin: const EdgeInsets.only(top: 3,bottom: 3,right: 3),
                                  decoration: BoxDecoration(
                                    color: widget.selectedAnswers[widget.questionIndex] == optionIndex 
                                          ? const Color.fromRGBO(129, 93, 234, 1) 
                                          : const Color.fromARGB(96, 209, 209, 209),
                                    borderRadius: BorderRadius.circular(16),
                                              ),
                                  child:Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Center(
                                      child: Text(entry.key,
                                          style: GoogleFonts.inter(
                                            textStyle: TextStyle(
                                                  fontSize: 22,
                                                  color: widget.selectedAnswers[widget.questionIndex] == optionIndex 
                                                        ? Colors.white : const Color.fromRGBO(137, 138, 141, 1),
                                                        )
                                                   )
                                              ),
                                          ),
                                  )
                                       ),
                              ),
                          ),
                          Expanded(
                            flex: 50,
                            child: Container(
                              constraints: BoxConstraints(
                                minWidth:  MediaQuery.of(context).size.height * 0.09,
                                minHeight:  MediaQuery.of(context).size.height * 0.09,
                                maxHeight: double.infinity,
                                maxWidth: double.infinity
                              ),
                              margin: const EdgeInsets.only(top :3, bottom: 3),
                              decoration: BoxDecoration(
                                color: widget.selectedAnswers[widget.questionIndex] == optionIndex 
                                      ? const Color.fromRGBO(129, 93, 234, 1) 
                                      : const Color.fromARGB(96, 209, 209, 209),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child:Padding(
                                padding: const EdgeInsets.all(10),
                                child: Center(
                                  child: Text(entry.value,
                                      style: GoogleFonts.inter(textStyle: TextStyle(
                                        color: widget.selectedAnswers[widget.questionIndex] == optionIndex 
                                              ? Colors.white : Colors.black,
                                      ))
                                  ),
                                ),
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
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(10),
                          dashPattern: const [2, 3],
                          color: Colors.black,
                          strokeWidth: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Text(questions[widget.questionIndex].infotext,
                            style: GoogleFonts.inter())))),
        ]
      ),
      ),
      );
  }
}