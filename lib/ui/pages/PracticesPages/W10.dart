import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/ui/Controller/practiceController.dart';
import 'package:my_app/ui/pages/practices.dart';

import '../../../domain/entities/PracticeClass.dart';

class Practice10 extends StatefulWidget {
  const Practice10({super.key});

  @override
  _Practice10State createState() => _Practice10State();
}

class _Practice10State extends State<Practice10> {
  Practicecontroller controller = Get.find();
  final TextEditingController hobbyController = TextEditingController();
  String error = "";
  bool error2 = false;
  final String name = "Actividad/hobby";
  List<String> list = [];

  void repeat() {
    error2 = true;
    setState(() {
      error2 = true;
      error = "¡Esta actividad ya ha sido agregada!";
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
    list = controller.p10List;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: IconButton(
          onPressed: () {
            if (controller.editingValue) {
              Get.off(() => Practices());
              controller.setterList(10, list);
              controller.changeEditing(false);
            } else {
              controller.reset(10);
              Get.off(() => Practices());
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
              'Registro de Actividades/Hobbies',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              '(1 pt por cada actividad realizada)',
              style: TextStyle(
                fontSize: 18,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Escribe las actividades o hobbies que deseas realizar',
              style: TextStyle(fontSize: 22),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Tipo de actividad',
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
                  flex: 1,
                  child: TextField(
                    controller: hobbyController,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Ej: Cantar, Pintar...',
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
                    if (hobbyController.text.isNotEmpty) {
                      if (controller.p10.contains(hobbyController.text)) {
                        repeat();
                      } else {
                        controller.add(10, hobbyController.text);
                        hobbyController.clear();
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
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                      fontSize: 16,
                    ),
                  )
                : const SizedBox.shrink(),
            const SizedBox(height: 20),
            Expanded(
              child: Obx(() => ListView.builder(
                    itemCount: controller.p10.length,
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
                          title: Text(controller.p10[index]),
                          trailing: IconButton(
                            icon: Icon(Icons.delete, color: Theme.of(context).colorScheme.primary),
                            onPressed: () {
                              controller.remove(10, index);
                            },
                          ),
                        ),
                      );
                    },
                  )),
            ),
            ElevatedButton(
              onPressed: () {
                String plural = "";
                if (controller.p10List.length > 1) {
                  plural = "es";
                }
                if (controller.p10ChoosenValue) {
                  controller.editpractice(name, '${controller.p10List.length} actividad$plural');
                  controller.editPracticeList(name, controller.p10List);
                } else {
                  controller.choosen(10);
                  task = Task(id:10,
                      name: name,
                      goal: '${controller.p10List.length} actividad$plural',
                      pts: 2);
                  task.addList(controller.p10List);
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
