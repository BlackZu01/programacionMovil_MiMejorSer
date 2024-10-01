import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/Controller/PracticeClass.dart';
import 'package:my_app/Controller/practiceController.dart';

class WP1 extends StatelessWidget {
  final Practicecontroller controller = Get.find();
  final String name;
  final int limit;

  WP1({super.key, required this.name, required this.limit});

  @override
  Widget build(BuildContext context) {
    Task task = controller.getpractice(name);

    return AlertDialog(
      title: Center(child:Text(task.getname,style: TextStyle(
        color:Theme.of(context).colorScheme.primary),
      )), // Título dinámico
      content: Container(
        width: double.maxFinite,
        constraints: const BoxConstraints(
          maxWidth: 300, 
        ),
        padding: const EdgeInsets.all(20), 
        child: Column(
          mainAxisSize: MainAxisSize.min, 
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10), 
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() => Text("Llevas ${task.getcount}",style: const TextStyle(
                    fontSize: 20 
                  ),),), // Se actualiza automáticamente
                  ElevatedButton(
                    onPressed: () {
                      if(controller.getpractice(name).getcount<limit){
                     controller.addcounter(task.getname); 
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.inversePrimary
                    ),
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20), // Espaciado entre elementos
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el diálogo
              },
              style: ElevatedButton.styleFrom(
                 backgroundColor: Theme.of(context).colorScheme.inversePrimary
              ),
              child: const Text("Aceptar"),
            ),
          ],
        ),
      ),
    );
  }
}

