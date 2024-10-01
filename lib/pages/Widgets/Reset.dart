

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/Controller/practiceController.dart';

class Reset extends StatelessWidget {
  final Practicecontroller controller = Get.find();
  final int points;

  Reset({super.key, required this.points});
  
 

  @override
  Widget build(BuildContext context) {


    return AlertDialog(
      title: Center(child:Text("¡Felicidades!",style: TextStyle(
        color:Theme.of(context).colorScheme.primary,
        fontSize: 32),
      )), // Título dinámico
      content:Container(
        width: double.maxFinite,
        constraints: const BoxConstraints(
          maxWidth: 300, 
        ),
        padding: const EdgeInsets.all(10), 
        child: Column(
          mainAxisSize: MainAxisSize.min, 
          children:[
              Padding(
              padding: const EdgeInsets.symmetric(vertical: 10), 
              child: Text("Has obtenido $points pts",
              style:const TextStyle(fontSize: 20))
              ),
             const SizedBox(height: 20),
             ElevatedButton(onPressed: (){
              Navigator.of(context).pop();
             }, child: Text("Aceptar",
             style:TextStyle(color: Theme.of(context).colorScheme.primary) ,))
          ]
      )
    ));
  }
}
