import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/ui/Controller/practiceController.dart';
import 'package:my_app/ui/pages/practices.dart';

import '../../Controller/PracticeClass.dart';

class Practice9 extends StatefulWidget {
  const Practice9({super.key});

  @override
  _Practice9State createState() => _Practice9State();
}

class _Practice9State extends State<Practice9> {
  Practicecontroller controller = Get.find();
  final String name = "Sin ver pantallas";
  int n = 0;

  @override
  Widget build(BuildContext context) {
    Task task;
    n = controller.p9Value;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: IconButton(
          onPressed: () {
            if (controller.editingValue) {
              Get.off(() => Practices());
              controller.setterCounter(9, n);
              controller.changeEditing(false);
            } else {
              Get.off(() => Practices());
              controller.reset(9);
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
              'Sin ver pantallas',
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
              'Establezca el tiempo (en minutos) que desea dedicar sin estar frente a una pantalla para cuidar su salud visual',
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
                    controller.decrement(9);
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
                  '${controller.p9Value}',
                  style: const TextStyle(fontSize: 40),
                )),
                const SizedBox(width: 20),
                // Botón de incremento
                ElevatedButton(
                  onPressed: () {
                    controller.increment(9);
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
                if (controller.p9choosenValue) {
                  controller.editpractice(name, '${controller.p9Value} minutos');
                } else {
                  controller.choosen(9);
                  task = Task(id: 9, name: name, goal: '${controller.p9Value} minutos', pts: 2);
                  task.goalCounterValue(controller.p9Value);
                  controller.addpractices(task);
                }
                Get.off(() => Practices());
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
