import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/ui/Controller/practiceController.dart';
import 'package:my_app/ui/pages/practices.dart';

import '../../Controller/PracticeClass.dart';

class Practice3 extends StatefulWidget {
  const Practice3({super.key});

  @override
  _Practice3State createState() => _Practice3State();
}

class _Practice3State extends State<Practice3> {
  Practicecontroller controller = Get.find();
 final String name="Caminar/Trotar";
 int n=0;

  @override
  Widget build(BuildContext context) {
    Task task;
    n=controller.p3Value;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: IconButton(
          onPressed: () {
            if(controller.editingValue){
            Get.off(()=>Practices());
            controller.setterCounter(3, n);
            controller.changeEditing(false);
           }else{
            Get.off(()=>Practices());
           controller.reset(3);
           }
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Tiempo de Caminar o Trote',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            Text(
              '(3 pts)',
              style: TextStyle(
                fontSize: 18,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Establezca el tiempo (en minutos) que desea dedicar a trotar o caminar hoy para mejorar su resistencia',
              style: TextStyle(fontSize: 22),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Botón de decremento
                ElevatedButton(
                  onPressed: () {
                    controller.decrement(3);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(10),
                  ),
                  child: const Icon(Icons.remove, size: 30),
                ),
                const SizedBox(width: 20),
                // Contador
                Obx(() => Text(
                  '${controller.p3Value}',
                  style: const TextStyle(fontSize: 40),
                )),
                const SizedBox(width: 20),
                // Botón de incremento
                ElevatedButton(
                  onPressed: () {
                    controller.increment(3);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(10),
                  ),
                  child: const Icon(Icons.add, size: 30),
                ),
              ],
            ),
            const SizedBox(height: 40),
            // Botón de aceptar
            ElevatedButton(
              onPressed: () {
               if(controller.p3choosenValue){
                controller.editpractice(name,'${controller.p3Value} minutos');
              }else{
                controller.choosen(3);
              task=Task(id:3,name:name,goal:'${controller.p3Value} minutos',pts:2);
              task.goalCounterValue(controller.p3Value);
              controller.addpractices(task);
              }
              Get.off(()=>Practices());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Aceptar', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
