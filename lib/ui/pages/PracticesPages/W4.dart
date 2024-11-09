import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/ui/Controller/practiceController.dart';
import 'package:my_app/ui/pages/practices.dart';

import '../../../domain/entities/PracticeClass.dart';

class Practice4 extends StatefulWidget {
  const Practice4({super.key});

  @override
  _Practice4State createState() => _Practice4State();
}

class _Practice4State extends State<Practice4> {
  Practicecontroller controller = Get.find();
  final TextEditingController exerciseController = TextEditingController();
  String error = "";
  bool error2 = false;
  final String name="Gimnasio"; 
  List<String> list=[];
  void repeat() {
    error2 = true;
    setState(() {
      error2 = true;
      error = "¡Este ejercicio ya ha sido agregado!";
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
    list=controller.p4List;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: IconButton(
          onPressed: () {
             if(controller.editingValue){
               controller.setterList(4, list);
            Get.off(()=>Practices());
            controller.changeEditing(false);
           }else{
           controller.reset(4);        
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
              'Registro de Ejercicios',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            Text(
              '(1 pt por cada ejercicio)',
              style: TextStyle(
                fontSize: 18,
                color: Theme.of(context).colorScheme.primary
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Escribe el tipo de ejercicio que deseas realizar y añádelo a la lista.',
              style: TextStyle(fontSize: 22),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            // Texto "Tipo de ejercicio" sobre el campo de entrada
             Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Tipo de ejercicio', // Texto encima del campo de entrada
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,
                color:Theme.of(context).colorScheme.primary),
              ),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: exerciseController,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimaryContainer, // Mejora la visibilidad del texto
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Ej: Barras, Levantamiento de pesas...',
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
                    if (exerciseController.text.isNotEmpty) {
                      if (controller.p4.contains(exerciseController.text)) {
                        repeat();
                      } else {
                        controller.add(4, exerciseController.text);
                        exerciseController.clear();
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
                    style: TextStyle(color: Theme.of(context).colorScheme.error, fontSize: 16),
                  )
                : const SizedBox.shrink(),
            const SizedBox(height: 20),
            Expanded(
              child: Obx(() => ListView.builder(
                    itemCount: controller.p4.length,
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
                          title: Text(controller.p4[index]),
                          trailing: IconButton(
                            icon: Icon(Icons.delete, color: Theme.of(context).colorScheme.primary),
                            onPressed: () {
                              controller.remove(4, index);
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
                String plural="";
                 if(controller.p4List.length>1){
                  plural="s";
                }
                 if(controller.p4ChoosenValue){
                controller.editpractice(name,'${controller.p4List.length} ejercicio$plural');
                controller.editPracticeList(name, controller.p4List);
              }else{
                controller.choosen(4);
              task=Task(id:4,name:name,goal:'${controller.p4List.length} ejercicio$plural',pts:2,
              goalCounter:controller.p4List.length );
              task.addList(controller.p4List);
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

