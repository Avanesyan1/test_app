import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_app/model/exercise_Info.dart';

class Exerscise_Page extends StatefulWidget {
  Exerscise_Page({super.key});

  @override
  State<Exerscise_Page> createState() => _Exerscise_PageState();
}

class _Exerscise_PageState extends State<Exerscise_Page> {
  @override
  Widget build(BuildContext context) {
  exerscise_Info info = exerscises_Info.contents[0];

    return Scaffold(
      appBar: AppBar(
        title: Text(info.name,style: const TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Stack(
            children: [
                Image.asset('assets/foto.jpg'),
                TextButton(
                  style: ButtonStyle(backgroundColor:  MaterialStateProperty.all(Colors.white)),
                  onPressed: (){}, 
                  child: const Text('Время изучения: 10 минут',style: TextStyle(color: Colors.black)),),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                  style: ButtonStyle(backgroundColor:  MaterialStateProperty.all(Colors.white)),
                  onPressed: (){}, 
                  icon: const Icon(Icons.check)),)

            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(96, 209, 209, 209),
                borderRadius: BorderRadius.circular(15)),
              child:Column(
                children: [
                  const Align(
                    alignment: Alignment.topLeft,  
                    child: Text('Описание упражнения',style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 22))),
                  Align(
                    child: Text(info.description))
                ],
                
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              child:Column(
                children: [
                    Align(
                    alignment: Alignment.topLeft,  
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.topLeft,
                          child:Text('Инструкция к выполнению:',style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 22)),
                          ),
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: info.steps.length,
                            itemBuilder: (context, index){
                              int key = info.steps.keys.elementAt(index);
                              return RichText(text: TextSpan(
                                children: <TextSpan>[
                                   TextSpan(text: '$key ', style: TextStyle(color: Colors.purple[900],fontWeight: FontWeight.bold, fontSize:35)),
                                   TextSpan(text: '${info.steps[key]}', style: const TextStyle(color: Colors.black,fontSize: 16)),
                                ]
                              ));
                            })
                      ],)
              )],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.orange)) ,
              child: const Text('Пройти тест: +200 опыта',style: TextStyle(color: Colors.white),),
              onPressed:() {
              Navigator.pushNamed(context, 'test_page');
            }),
          ),
        ],),
    );
  }
}