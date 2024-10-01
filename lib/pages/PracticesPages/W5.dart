import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/Controller/practiceController.dart';
import 'package:my_app/pages/practices.dart';

import '../../Controller/PracticeClass.dart';

class Practice5 extends StatefulWidget {
  const Practice5({super.key});

  @override
  _Practice5State createState() => _Practice5State();
}

class _Practice5State extends State<Practice5> {
  Practicecontroller controller = Get.find();
  final TextEditingController exerciseController = TextEditingController();
  String error = "";
  bool error2 = false;
  int hours = 1;
  int totalhours=0;
  final String name="Estudiar";

  void repeat() {
    setState(() {
      error2 = true;
      error = "¡Ya has agregado este tema o asignatura para estudiar!";
    });
  }

  void passhours(){
    error2=true;
    setState(() {
      error2=true;
      error = "¡Estudiar mas de 12 horas es excesivo. Replantea tu horario!";
    });
  }

  void solve() {
    setState(() {
      error2 = false;
      error = "";
    });
  }

  void increaseHours() {
    setState(() {
      if(hours<12){
       hours++;
      }
    });
  }

  void decreaseHours() {
    if (hours > 1) {
      setState(() {
        hours--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Task task;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: IconButton(
          onPressed: () {
           if(controller.editingValue){
            Get.off(()=>Practices());
            controller.changeEditing(false);
           }else{
            Get.off(()=>Practices());
           controller.reset(5);
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
              'Registro de Estudios',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            Text(
              '(2 pts por cada tema o asignatura)',
              style: TextStyle(
                fontSize: 18,
                color: Theme.of(context).colorScheme.primary
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Escribe que asignatura o tema deseas estudiar y cuantas horas deseas estudiar eso',
              style: TextStyle(fontSize: 22),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Asignatura o tema que desea estudiar',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary),
              ),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: exerciseController,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Ej: Calculo, Ciencia, Ingles',
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
                      if (controller.p5.containsKey(exerciseController.text)) {
                        repeat();
                      } else {
                        if(totalhours+hours>=13){
                          passhours();
                        }else{
                          controller.p5modify(exerciseController.text, hours, 1); 
                          totalhours+=hours;
                        exerciseController.clear();
                        solve();
                        setState(() {
                          hours = 1; 
                        });
                        }
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: decreaseHours,
                  icon: Icon(Icons.remove, color: Theme.of(context).colorScheme.primary),
                ),
                Text(
                  '$hours horas',
                  style: TextStyle(fontSize: 18, color: Theme.of(context).colorScheme.primary),
                ),
                IconButton(
                  onPressed: increaseHours,
                  icon: Icon(Icons.add, color: Theme.of(context).colorScheme.primary),
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
                    itemCount: controller.p5.length,
                    itemBuilder: (context, index) {
                      String subject = controller.p5.keys.toList()[index];
                      int hours = controller.p5[subject]!;
                      String text="$subject - $hours horas";
                      controller.add(5,text);
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
                          title: Text(text),
                          trailing: IconButton(
                            icon: Icon(Icons.delete, color: Theme.of(context).colorScheme.primary),
                            onPressed: () {
                             controller.p5modify(subject, 0, 0); // Elimina el elemento
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
                if(controller.p5List.length>1){
                  plural="s";
                }
                if(controller.p5ChoosenValue){
                controller.editpractice(name,'${controller.p5List.length} tema$plural');
                controller.editPracticeList(name, controller.listp5);
              }else{
                controller.choosen(5);
              task=Task(name:name,goal:'${controller.listp5.length} temas$plural',pts:2);
              task.addList(controller.listp5);
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
