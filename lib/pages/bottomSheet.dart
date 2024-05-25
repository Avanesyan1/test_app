import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCustomBottomSheet extends StatelessWidget {
  const MyCustomBottomSheet({required this.answer,super.key});
  final bool answer;

  @override
  Widget build(BuildContext context) {
    return Container(
              decoration: const BoxDecoration(
                           gradient:  RadialGradient(
                                        colors: [
                                          Color.fromRGBO(107, 65, 227, 0.5),
                                          Color.fromRGBO(144, 106, 255, 0.5),
                                        ],
                                      )
                                ),
              height: (answer ? 420: 350),
              width: double.infinity,
              child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           SizedBox(
                              width: 500,
                              height:200,
                              child: Image.asset(answer ?'assets/hand.png':'assets/list.png')),
                              Text(answer ? 'Тест пройден!' : 'Тест не пройден :(',
                                   style: GoogleFonts.inter(textStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 27)),),
                              answer ? Text('Вам начислено +100 опыта',
                                   style: GoogleFonts.inter(textStyle: const TextStyle(fontSize: 18,color: Colors.white)))
                              :const Text(''),
                              answer ? Padding(
                                padding: const EdgeInsets.only(top: 20,right: 40, left: 40),
                                child:Column(
                                       children: [
                                              LinearProgressIndicator(
                                                  borderRadius: BorderRadius.circular(30) ,
                                                  value: 0.5,
                                                  backgroundColor: Colors.white,
                                                  color: const Color.fromRGBO(98, 62, 174, 1),
                                                   ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text('500/1000',style: GoogleFonts.inter(textStyle: const TextStyle(fontSize:12,color: Colors.white))),
                                                  Text('2 lvl',style: GoogleFonts.inter(textStyle: const TextStyle(fontSize:12,color: Colors.white)))
                                                      ],
                                               )
                                       ],
                                      )
                                    ):const SizedBox.shrink(),
                              SizedBox(
                                height: 80,
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(20,10,20,10),
                                  child: TextButton(
                                    style:ButtonStyle(shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                                      backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(98, 62, 174, 1))),
                                      onPressed: (){
                                         Navigator.pop(context);
                                      }, 
                                      child: Text(answer ? 'Отлично': 'Попробовать еще раз',
                                      style: GoogleFonts.inter(textStyle:const TextStyle(color: Colors.white,fontSize: 17),)),),
                                ),
                              )
                              ],),
                            
                          );
  }
}