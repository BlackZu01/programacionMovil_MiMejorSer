import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/Controller/accountController.dart';
import 'package:my_app/Controller/practiceController.dart';
import 'package:my_app/pages/PracticeWidgets/WP1.dart';
import 'package:my_app/pages/practices.dart';
import 'package:my_app/Controller/PracticeClass.dart';
import 'package:my_app/pages/task_manager.dart';

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
        toolbarHeight: 100,
        elevation: 0,
        flexibleSpace: Container(
          decoration:  BoxDecoration(
            gradient: LinearGradient(
              colors: [
               Colors.greenAccent.shade200, Colors.tealAccent.shade400,
              ], // Degradado de colores
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26, // Sombra suave
                offset: Offset(0, 4),
                blurRadius: 8,
              ),
            ],
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: IconButton(
            onPressed: () {},
            icon:
                const Icon(Icons.home_outlined, size: 30, color: Colors.white),
            splashRadius: 24, // Radio del efecto de splash
          ),
        ),
        centerTitle: true, // Centrar el título
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              onPressed: () {
                Get.off(()=> Practices());
              },
              icon: const Icon(Icons.add_circle_outline,
                  color: Colors.white, size: 28),
              splashRadius: 24,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              onPressed: () {
                Get.off(()=>const TaskAdminPage());
              },
              icon: const Icon(Icons.list_alt, color: Colors.white, size: 28),
              splashRadius: 24,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: PopupMenuButton(
              icon: const Icon(Icons.person_outline,
                  size: 30, color: Colors.white),
              offset: const Offset(0, 50),
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nombre: ${controlleraccount.nameValue}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        'Correo: ${controlleraccount.emailValue}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      const Divider(),
                      const Text(
                        'Puntos: 100',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
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
           showDialog(context: context, builder: (BuildContext context){
                switch(task.getname){
                case 'Tomar agua':
                return(WP1(name: task.getname));
                default:
                return(WP1(name: ""));
                break;
              }
             
           });
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
                task.getstate ? "Completa" : "Pendiente",
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
