import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/Controller/accountController.dart';
import 'package:my_app/Controller/practiceController.dart';
import 'package:my_app/pages/practices.dart';
import 'package:my_app/Controller/PracticeClass.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  _InitialPage createState() => _InitialPage();
}

class _InitialPage extends State<InitialPage> {
  final Accountcontroller controlleraccount = Get.find();
  final Practicecontroller controllerp = Get.find();
  int completedGoals = 0;

  @override
  Widget build(BuildContext context) {
    
   
     // Obtener el número total de tareas
    return Scaffold(
      backgroundColor: const Color(0xFFF5F4FB),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Obx(() => Text(
              'Saludos, ${controlleraccount.nameValue} 👋',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            )),
        centerTitle: false,
        actions: const [
          Icon(Icons.notifications_none, color: Colors.black),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Barra de progreso
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child:
              //  int totalTasks = controllerp.getnpractices;
              Obx(() { int totalTasks = controllerp.getnpractices;
               return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Ya casi has completado tus objetivos diarios, sigue así!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text('$completedGoals/$totalTasks objetivos completados'),
                  const SizedBox(height: 10),
                  LinearProgressIndicator(
                    value: totalTasks > 0 ? completedGoals / totalTasks : 0, // Asegurarse de que no se divida entre 0
                    backgroundColor: Colors.grey[300],
                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.deepPurple),
                  ),
                ],
              );
              }),
            ),
            const SizedBox(height: 20),
            const Text(
              "TAREAS DE HOY",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 20),

            // Mostrar tareas o mensaje de que no hay tareas seleccionadas
            Expanded(
              child: Obx((){
                var tasks = controllerp.getpracticeslist;
                return tasks.isEmpty
                  ? const Center(
                      child: Text(
                        'No has seleccionado tareas.',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                    )
                  : Obx(()=>ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        return TaskCard(
                          task: tasks[index],
                          onStatusChange: () {
                            setState(() {
                              if (tasks[index].state == false) {
                                tasks[index].state = true;
                                completedGoals++;
                              } else {
                                tasks[index].state = false;
                                completedGoals--;
                              }
                            });
                          },
                        );
                      },
                    ));
              })
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => Practices());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                child: const Text(
                  'Añadir Practicas',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget TaskCard
class TaskCard extends StatelessWidget {
  final Task task;
  final VoidCallback onStatusChange;

  const TaskCard({super.key, required this.task, required this.onStatusChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: task.getstate == false ? Colors.orange[100] : Colors.purple[100],
            child: Icon(
              task.getstate == false ? Icons.check_box_outline_blank : Icons.check,
              color: task.getstate == false ? Colors.orange : Colors.purple,
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                task.getname,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(task.getgoal),
            ],
          ),
          const Spacer(),
          IconButton(onPressed: (){

          }, icon:const Icon(Icons.info,color: Colors.blue,)),
          const Spacer(),
          GestureDetector(
            onTap: onStatusChange,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                color: task.getstate == false ? Colors.orange[100] : Colors.purple[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                task.getstate ? "Complete" : "TO DO",
                style: TextStyle(
                  color: task.getstate == false ? Colors.orange : Colors.purple,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
