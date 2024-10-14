
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/ui/Controller/practiceController.dart';
import 'package:my_app/ui/pages/PracticesPages/W10.dart';
import 'package:my_app/ui/pages/PracticesPages/W2.dart';
import 'package:my_app/ui/pages/PracticesPages/W3.dart';
import 'package:my_app/ui/pages/PracticesPages/W4.dart';
import 'package:my_app/ui/pages/PracticesPages/W5.dart';
import 'package:my_app/ui/pages/PracticesPages/W6.dart';
import 'package:my_app/ui/pages/PracticesPages/W7.dart';
import 'package:my_app/ui/pages/PracticesPages/W8.dart';
import 'package:my_app/ui/pages/PracticesPages/W9.dart';
import '../PracticesPages/W1.dart';

void route(String name){
     switch(name){
    case 'Tomar agua':Get.off(()=>const Practice1());
    break;
    case 'Alimentación sana':Get.off(()=>const Practice2());
    break;
    case 'Caminar/Trotar':Get.off(()=>const Practice3());
    break;
    case 'Gimnasio':Get.off(()=>const Practice4());
    break;
    case 'Estudiar':Get.off(()=>const Practice5());
    break;
    case 'Leer':Get.off(()=>const Practice6());
    break;
    case 'Pausa activa':Get.off(()=>const Practice7());
    break;
    case 'Tomar una siesta':Get.off(()=>const Practice8());
    break;
    case 'Tiempo fuera de las pantallas':Get.off(()=> const Practice9());
    case 'Actividad/Hobby':Get.off(()=>const Practice10());
    default:0;
  }

 }

class Edit extends StatelessWidget {
  final Practicecontroller controller = Get.find();
  final String name;

  Edit({super.key, required this.name});
  
 

  @override
  Widget build(BuildContext context) {


    return AlertDialog(
      title: Center(child:Text("¡Ya seleccionaste esta tarea!",style: TextStyle(
        color:Theme.of(context).colorScheme.primary),
      )), // Título dinámico
      content:Container(
        width: double.maxFinite,
        constraints: const BoxConstraints(
          maxWidth: 300, // Limita el ancho máximo del diálogo
        ),
        padding: const EdgeInsets.all(10), // Agrega padding a todo el contenido
        child: Column(
          mainAxisSize: MainAxisSize.min, // Limita el tamaño a su contenido
          children: [
          const  Padding(
              padding: EdgeInsets.symmetric(vertical: 10), // Espaciado vertical
              child: Center(
                child: Text("Ya tienes esta tarea en tu lista de tareas te invitamos a editarla. ¿Quieres editarla?",
              style: TextStyle(fontSize: 18),)),
            ),
            const SizedBox(height: 20), // Espaciado entre elementos
            Row(children: [
              Padding(padding: const EdgeInsets.symmetric(horizontal: 20) , 
              child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); 
                debugPrint(name);
               route(name); 
              controller.changeEditing(true);
              },
              style: ElevatedButton.styleFrom(
                 backgroundColor: Theme.of(context).colorScheme.inversePrimary
              ),
              child: const Text("Si"),
            ),),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 20),
            child:ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el diálogo
              },
              style: ElevatedButton.styleFrom(
                 backgroundColor: Theme.of(context).colorScheme.inversePrimary
              ),
              child: const Text("No"),
            ))
            ],),
          ],
        ),
      )
    );
  }
}
