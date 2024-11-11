import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/ui/Controller/accountController.dart';
import 'package:my_app/ui/Controller/practiceController.dart';
import 'package:my_app/ui/pages/Widgets/edit.dart';
import 'package:my_app/ui/pages/calendar.dart';
import 'package:my_app/ui/pages/initial.dart';
import 'package:my_app/ui/pages/login.dart';
import 'package:my_app/ui/pages/practices.dart';

class TaskAdminPage extends StatefulWidget {
  const TaskAdminPage({super.key});

  @override
  _TaskAdminPageState createState() => _TaskAdminPageState();
}

class _TaskAdminPageState extends State<TaskAdminPage> {
  final Accountcontroller controllerAccount = Get.find();
  final Practicecontroller controllerPractice = Get.find();
  int completedGoals = 0;

  void _editTask(String name) {
    controllerPractice.changeEditing(true);
    route(name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi Mejor Ser'),
        backgroundColor: Colors.greenAccent.shade200,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFFF0F4F8),
      bottomNavigationBar: BottomAppBar(
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 0),
          height: 75,
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              gradient: LinearGradient(
                colors: [
                  Colors.greenAccent.shade200,
                  Colors.tealAccent.shade400,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 4),
                  blurRadius: 8,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Boton home
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: IconButton(
                    onPressed: () {
                      Get.off(()=>const InitialPage());
                    },
                    icon: const Icon(
                      Icons.home_outlined,
                      size: 30,
                      color: Colors.white,
                    ),
                    splashRadius: 24,
                  ),
                ),      // Boton de administrar tareas
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: IconButton(
                        onPressed: () {
                          Get.off(() => const TaskAdminPage());
                        },
                        icon: const Icon(
                          Icons.list_alt,
                          size: 28,
                          color: Colors.white,
                        ),
                        splashRadius: 24,
                      ),
                    ),
                    // Botón del calendario
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: IconButton(
                        onPressed: () {
                          // Navega a la página de calendario
                          Get.off(() => const CalendarPage());
                        },
                        icon: const Icon(
                          Icons.calendar_today,
                          size: 30,
                          color: Colors.white,
                        ),
                        splashRadius: 24,
                      ),
                    ),
                    // Boton del perfil
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: PopupMenuButton(
                        icon: const Icon(
                          Icons.person_outline,
                          size: 30,
                          color: Colors.white,
                        ),
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
                                  'Nombre: ${controllerAccount.nameValue}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.black87,
                                  ),
                                ),
                                Text(
                                  'Correo: ${controllerAccount.emailValue}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                                const Divider(),
                                Text(
                                  'Puntos: ${controllerAccount.getPts}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                                const Divider(),
                                Row(
                                  children: [
                                    Icon(Icons.logout,
                                        color: Theme.of(context).colorScheme.tertiary),
                                    Center(
                                      child: TextButton(
                                        onPressed: () {
                                          controllerPractice.logout();
                                          controllerPractice.resetall();
                                          Get.off(() => const LoginPage());
                                        },
                                        child: Text(
                                          "Cerrar sesión",
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .tertiary,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    
              ],
            ),
          ),
        ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
              child: Obx(() {
                var tasks = controllerPractice.getpracticeslist;
                return tasks.isEmpty
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
                                tasks[index].getname,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.teal,
                                ),
                              ),
                              subtitle: Text(tasks[index].getgoal),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.edit,
                                        color: Colors.teal),
                                    onPressed: () =>
                                        _editTask(tasks[index].getname),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.delete,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .error),
                                    onPressed: () => controllerPractice
                                        .removepractice(tasks[index].getname),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
              }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => Practices()); // Ir a la página de añadir prácticas
        },
        backgroundColor: Colors.teal,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
