import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/Controller/practiceController.dart';
import 'package:my_app/pages/practices.dart';

import '../../Controller/PracticeClass.dart';

class Practice2 extends StatefulWidget {
  const Practice2({super.key});

  @override
  _Practice2State createState() => _Practice2State();
}

class _Practice2State extends State<Practice2> {
  Practicecontroller controller = Get.find();
  final TextEditingController foodController = TextEditingController();
  String error = "";
  bool error2 = false;

  void repeat() {
    error2 = true;
    setState(() {
      error2 = true;
      error = "¡Este alimento ya ha sido agregado!";
    });
  }

  void solve() {
    setState(() {
      error2 = false;
      error = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    Task task;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seguimiento de Comida Saludable'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: IconButton(
          onPressed: () {
            controller.p2List.clear();
            Get.off(() => Practices());
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
              'Registro de Comidas Saludables',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
               textAlign:TextAlign.center
            ),
            Text(
              '(1 pt por cada alimento saludable)',
              style: TextStyle(
                fontSize: 18,
                color: Theme.of(context).colorScheme.primary
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Escribe los alimentos saludable que desea consumir',
              style: TextStyle(fontSize: 22),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Tipo de alimento', // Texto encima del campo de entrada
                style: TextStyle(
                  fontSize: 18, 
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: foodController,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimaryContainer, // Mejora la visibilidad del texto
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Ej: Manzana, Ensalada, Naranja...',
                      hintStyle: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(0.6),
                      ),
                      fillColor: Theme.of(context).colorScheme.primaryContainer,
                      filled: true,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    if (foodController.text.isNotEmpty) {
                      if (controller.p2.contains(foodController.text)) {
                        repeat();
                      } else {
                        controller.add(2, foodController.text);
                        foodController.clear();
                        solve();
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
                    padding: const EdgeInsets.all(12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Icon(Icons.add, size: 30),
                ),
              ],
            ),
            const SizedBox(height: 10),
            error2
                ? Text(
                    error,
                    style: const TextStyle(color: Colors.red, fontSize: 16),
                  )
                : const SizedBox.shrink(),
            const SizedBox(height: 20),
            Expanded(
              child: Obx(() => ListView.builder(
                    itemCount: controller.p2.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          border: Border.all(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          title: Text(controller.p2[index]),
                          trailing: IconButton(
                            icon: Icon(Icons.delete, color: Theme.of(context).colorScheme.primary),
                            onPressed: () {
                              controller.remove(2, index);
                            },
                          ),
                        ),
                      );
                    },
                  )),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                controller.choosen(2);
                task=Task(name:'Alimentación sana',goal:'${controller.p2List.length} ',
                pts:1,state:false);
                controller.addpractices(task);
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
