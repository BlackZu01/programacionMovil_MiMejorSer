import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/Controller/accountController.dart';
import 'package:my_app/pages/practices.dart';
import 'package:my_app/pages/initial.dart';

class TaskAdminPage extends StatefulWidget {
  const TaskAdminPage({Key? key}) : super(key: key);

  @override
  _TaskAdminPageState createState() => _TaskAdminPageState();
}

class _TaskAdminPageState extends State<TaskAdminPage> {
  final Accountcontroller controller = Get.find();

  List<Task> tasks = [
    Task(name: 'EJERCICIO', duration: '30 minutos'),
    Task(name: 'LEER', duration: '20 páginas'),
    Task(name: 'ESTUDIAR', duration: '30 minutos'),
    Task(name: 'TOMAR AGUA', duration: '2 minutos'),
  ];

  void _addTask() {
    // Lógica para añadir tarea
  }

  void _editTask(int index) {
    // Lógica para editar tarea
  }

  void _deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  void goToInit(BuildContext context, String text) {
    Get.off(() => const InitialPage());
  }

  void goToPractices(BuildContext context) {
    Get.off(() => Practices());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4F8),
      appBar: AppBar(
        toolbarHeight: 90,
        elevation: 5,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.greenAccent.shade200, Colors.tealAccent.shade400],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0), // Padding a la izquierda
          child: IconButton(
            onPressed: () {
              goToInit(context, controller.nameValue);
            },
            icon: const Icon(
              Icons.home_outlined,
              size: 30,
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0), // Padding a la derecha
            child: IconButton(
              onPressed: () {
                goToPractices(context);
              },
              icon: const Icon(Icons.add_circle_outline,
                  color: Colors.white, size: 30),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12.0), // Padding a la derecha
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.list_alt, color: Colors.white, size: 30),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12.0), // Padding a la derecha
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
          children: [
            const Text(
              'Administrar Tareas Diarias',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: tasks.isEmpty
                  ? const Center(
                      child: Text(
                        'No hay tareas. Añade una nueva tarea.',
                        style: TextStyle(fontSize: 18, color: Colors.black54),
                      ),
                    )
                  : ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            title: Text(
                              tasks[index].name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.teal,
                              ),
                            ),
                            subtitle: Text(tasks[index].duration),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit,
                                      color: Colors.teal),
                                  onPressed: () => _editTask(index),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete,
                                      color: Colors.red),
                                  onPressed: () => _deleteTask(index),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          goToPractices(context);
        },
        backgroundColor: Colors.teal,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

class Task {
  String name;
  String duration;

  Task({required this.name, required this.duration});
}
