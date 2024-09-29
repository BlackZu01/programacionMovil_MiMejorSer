import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/Controller/practiceController.dart';
import 'package:my_app/pages/practices.dart';

import '../../Controller/PracticeClass.dart';

class Practice8 extends StatefulWidget {
  const Practice8({super.key});

  @override
  _Practice8State createState() => _Practice8State();
}

class _Practice8State extends State<Practice8> {
  Practicecontroller controller = Get.find();

final String name="Tomar una siesta";
int n=0;
  @override
  Widget build(BuildContext context) {
    n=controller.p8Value;
    Task task;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: IconButton(
          onPressed: () {
            if(controller.editingValue){
            Get.off(()=>Practices());
            controller.changeEditing(false);
            controller.setterCounter(8, n);
           }else{
            Get.off(()=>Practices());
           controller.reset(8);
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
              'Tomar una Siesta',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            Text(
              '(2 pts)',
              style: TextStyle(
                fontSize: 18,
                color: Theme.of(context).colorScheme.primary
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Establezca como meta la cantidad de tiempo que desea dormir hoy para una siesta reparadora.',
              style: TextStyle(fontSize: 22),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Botón de decremento
                ElevatedButton(
                  onPressed:() {controller.decrement(8);}, // método para reducir tiempo
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
                  '${controller.p8Value} min', // valor del tiempo en minutos
                  style: const TextStyle(fontSize: 40),
                )),
                const SizedBox(width: 20),
                // Botón de incremento
                ElevatedButton(
                  onPressed: (){controller.increment(8);}, 
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
                 if(controller.p8choosenValue){
                controller.editpractice(name,'${controller.p8Value} minutos');
              }else{
                controller.choosen(8);
              task=Task(name:name,goal:'${controller.p8Value} minutos',pts:2,state:false);
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
