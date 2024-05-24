import 'package:flutter/material.dart';

class MyCustomBottomSheet extends StatelessWidget {
  const MyCustomBottomSheet({required this.answer,super.key});
  final bool answer;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
              height: (answer ? 380: 320),
              width: double.infinity,
              child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           SizedBox(
                              width: 200,
                              height:160,
                              child: Image.asset(answer ?'assets/hand.png':'assets/list.png')),
                              Text(answer ? 'Тест пройден!' : 'Тест не пройден :(',
                                   style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 28),),
                              answer ? const Text('Вам начислено +100 опыта',
                                                 style: TextStyle(fontSize: 24,color: Colors.white)): const Text(''),
                              answer ? const Padding(
                                padding: EdgeInsets.only(top: 20,right: 20, left: 20),
                                child:Column(
                                       children: [
                                              LinearProgressIndicator(
                                                value: 0.5,
                                                backgroundColor: Colors.white,
                                                color: Color.fromRGBO(98, 62, 174, 1),
                                                            ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text('500/2',style: TextStyle(color: Colors.white)),
                                                  Text('2 lvl',style: TextStyle(color: Colors.white,))
                                                ],
                                              )
                                         ],
                                  )
                                ):const SizedBox.shrink(),
                              SizedBox(
                                height: 80,
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextButton(
                                    style:ButtonStyle(shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                                      backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(98, 62, 174, 1))),
                                      onPressed: (){
                                         Navigator.pop(context);
                                      }, 
                                      child: Text(answer ? 'Отлично': 'Попробовать еще раз',
                                      style: const TextStyle(color: Colors.white,fontSize: 18),),),
                                ),
                              )
                              ],),
                            
                          );
  
  
  }
}