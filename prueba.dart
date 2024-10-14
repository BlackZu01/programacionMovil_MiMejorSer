import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String nameValue = 'John Doe';
  final String emailValue = 'johndoe@example.com';
  final int getPts = 42;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Main Content')),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Container(
          height: 100,
          decoration: BoxDecoration(
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
                padding: const EdgeInsets.only(left: 16),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.home_outlined,
                    size: 30,
                    color: Colors.white,
                  ),
                  splashRadius: 24,
                ),
              ),
              Row(
                children: [
                  // Add button
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: IconButton(
                      onPressed: () {
                        Get.off(() => Practices());
                      },
                      icon: const Icon(
                        Icons.add_circle_outline,
                        size: 28,
                        color: Colors.white,
                      ),
                      splashRadius: 24,
                    ),
                  ),
                  // Boton de tareas
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
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
                  // Boton de perfil
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
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
                                'Nombre: $nameValue',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.black87,
                                ),
                              ),
                              Text(
                                'Correo: $emailValue',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                              const Divider(),
                              Text(
                                'Puntos: $getPts',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                              const Divider(),
                              Center(
                                child: TextButton(
                                  onPressed: () {},
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
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Example navigation pages
class Practices extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Practices Page')),
    );
  }
}

class TaskAdminPage extends StatelessWidget {
  const TaskAdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Task Admin Page')),
    );
  }
}
