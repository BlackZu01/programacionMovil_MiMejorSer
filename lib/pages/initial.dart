import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/Controller/accountController.dart';
import 'package:my_app/pages/practices.dart';
import 'package:my_app/pages/task_manager.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  _InitialPage createState() => _InitialPage();
}

class _InitialPage extends State<InitialPage> {
  int completedGoals = 0;
  int totalGoals = 4;

  List<Task> tasks = [
    Task(name: 'EJERCICIO', duration: '30 minutes', status: 'TO DO'),
    Task(name: 'LEER', duration: '20 pages', status: 'TO DO'),
    Task(name: 'ESTUDIAR', duration: '30 minutes', status: 'TO DO'),
    Task(name: 'TOMAR AGUA', duration: '2 minutes', status: 'TO DO')
  ];
  final Accountcontroller controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F4FB),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 100,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF6A5ACD),
                Color(0xFF836FFF)
              ], // Degradado de colores
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
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
        title: const Text(
          'Objetivos',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2, // Espaciado entre letras
          ),
        ),
        centerTitle: true, // Centrar el título
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              onPressed: () {
                goToPractices(context);
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
                goToTaskManager(context);
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
                        'Nombre: ${controller.nameValue}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        'Correo: ${controller.emailValue}',
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
              child: Column(
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
                  Text('$completedGoals/$totalGoals objetivos completados'),
                  const SizedBox(height: 10),
                  LinearProgressIndicator(
                    value:
                        completedGoals / totalGoals, // Progreso en la barrita
                    backgroundColor: Colors.grey[300],
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Colors.deepPurple),
                  ),
                ],
              ),
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

            // Generar la lista de tareas (Por corregir)
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return TaskCard(
                    task: tasks[index],
                    onStatusChange: () {
                      setState(() {
                        if (tasks[index].status == 'TO DO') {
                          tasks[index].status = 'COMPLETE';
                          completedGoals++;
                        } else {
                          tasks[index].status = 'TO DO';
                          completedGoals--;
                        }
                      });
                    },
                  );
                },
              ),
            ),
            Center(
                child: ElevatedButton(
              onPressed: () {
                Get.off(() => Practices());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context)
                    .colorScheme
                    .inversePrimary, // Color de fondo
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(30.0), // Bordes redondeados
                ),
                padding: const EdgeInsets.symmetric(
                    horizontal: 30, vertical: 15), // Espaciado
              ),
              child: const Text(
                'Añadir Practicas',
                style: TextStyle(fontSize: 18), // Estilo del texto
              ),
            ))
          ],
        ),
      ),
    );
  }
}

void goToInit(BuildContext context, String text) {
  Get.off(() => const InitialPage());
}

void goToPractices(BuildContext context) {
  Get.off(() => Practices());
}

void goToTaskManager(BuildContext context) {
  Get.off(() => const TaskAdminPage());
}

// Modelo de tarea booleano
class Task {
  String name;
  String duration;
  String status;

  Task({required this.name, required this.duration, required this.status});
}

// Modelo de tarea con contadores
class TaskCounter {
  String name;
  int numberTimes;
  String status;

  TaskCounter(
      {required this.name, required this.numberTimes, required this.status});
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
            backgroundColor: task.status == 'TO DO'
                ? Colors.orange[100]
                : Colors.purple[100],
            child: Icon(
              task.status == 'TO DO'
                  ? Icons.check_box_outline_blank
                  : Icons.check,
              color: task.status == 'TO DO' ? Colors.orange : Colors.purple,
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                task.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(task.duration),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: onStatusChange, // Cambia el estado de la tarea
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                color: task.status == 'TO DO'
                    ? Colors.orange[100]
                    : Colors.purple[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                task.status,
                style: TextStyle(
                  color: task.status == 'TO DO' ? Colors.orange : Colors.purple,
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
