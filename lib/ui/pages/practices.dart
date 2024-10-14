import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/ui/Controller/practiceController.dart';
import 'package:my_app/ui/pages/PracticesPages/W1.dart';
import 'package:my_app/ui/pages/PracticesPages/W10.dart';
import 'package:my_app/ui/pages/PracticesPages/W2.dart';
import 'package:my_app/ui/pages/PracticesPages/W3.dart';
import 'package:my_app/ui/pages/PracticesPages/W4.dart';
import 'package:my_app/ui/pages/PracticesPages/W5.dart';
import 'package:my_app/ui/pages/PracticesPages/W6.dart';
import 'package:my_app/ui/pages/PracticesPages/W7.dart';
import 'package:my_app/ui/pages/PracticesPages/W8.dart';
import 'package:my_app/ui/Controller/accountController.dart';
import 'package:my_app/ui/pages/PracticesPages/W9.dart';
import 'package:my_app/ui/pages/Widgets/edit.dart';
import 'package:my_app/ui/pages/initial.dart';
import 'package:my_app/ui/pages/login.dart';
import 'package:my_app/ui/pages/task_manager.dart';

// ignore: use_key_in_widget_constructors
class Practices extends StatelessWidget {
  final List<Map<String, dynamic>> items = [
    {"icon": Icons.water_drop, "text": "Tomar agua"},
    {"icon": Icons.restaurant, "text": "Alimentación sana"},
    {"icon": Icons.directions_run, "text": "Caminar/Trotar"},
    {"icon": Icons.fitness_center, "text": "Gimnasio"},
    {"icon": Icons.library_books, "text": "Estudiar"},
    {"icon": Icons.auto_stories, "text": "Leer"},
    {"icon": Icons.pause_circle, "text": "Pausa activa"},
    {"icon": Icons.hotel, "text": "Tomar una siesta"},
    {"icon": Icons.tv_off, "text": "Sin ver pantallas"},
    {"icon": Icons.schedule, "text": "Actividad/Hobby"},
  ];

  get name => null;
  final Accountcontroller controller = Get.find();
  final Practicecontroller controllerp = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi Mejor Ser'),
        backgroundColor: Colors.greenAccent.shade200,
        elevation: 0,
        centerTitle: true,
      ),
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
                padding: const EdgeInsets.only(left: 16),
                child: IconButton(
                  onPressed: () {
                    Get.off(() => const InitialPage());
                  },
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
                  // Boton de administrar tareas
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
                  // Boton del perfil
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
                              Text(
                                'Puntos: ${controller.getPts}',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                              const Divider(),
                              Row(
                                children: [
                                  Icon(Icons.logout,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary),
                                  Center(
                                    child: TextButton(
                                      onPressed: () {
                                        controllerp.logout();
                                        controllerp.resetall();
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
            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Selecciona una práctica saludable",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView.builder(
                itemCount: items.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: 1,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return ElevatedButton(
                    onPressed: () {
                      switch (index) {
                        case 0:
                          if (controllerp.p1choosenValue) {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Edit(name: items[index]["text"]);
                                });
                          } else {
                            Get.off(() => const Practice1());
                          }

                          break;
                        case 1:
                          if (controllerp.p2ChoosenValue) {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Edit(name: items[index]["text"]);
                                });
                          } else {
                            Get.off(() => const Practice2());
                          }
                          break;
                        case 2:
                          if (controllerp.p3choosenValue) {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Edit(name: items[index]["text"]);
                                });
                          } else {
                            Get.off(() => const Practice3());
                          }
                          break;
                        case 3:
                          if (controllerp.p4ChoosenValue) {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Edit(name: items[index]["text"]);
                                });
                          } else {
                            Get.off(() => const Practice4());
                          }
                          break;
                        case 4:
                          if (controllerp.p5ChoosenValue) {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Edit(name: items[index]["text"]);
                                });
                          } else {
                            Get.off(() => const Practice5());
                          }
                          break;
                        case 5:
                          if (controllerp.p6choosenValue) {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Edit(name: items[index]["text"]);
                                });
                          } else {
                            Get.off(() => const Practice6());
                          }
                          break;
                        case 6:
                          if (controllerp.p7choosenValue) {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Edit(name: items[index]["text"]);
                                });
                          } else {
                            Get.off(() => const Practice7());
                          }
                          break;
                        case 7:
                          if (controllerp.p8choosenValue) {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Edit(name: items[index]["text"]);
                                });
                          } else {
                            Get.off(() => const Practice8());
                          }
                          break;
                        case 8:
                          if (controllerp.p9choosenValue) {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Edit(name: items[index]["text"]);
                                });
                          } else {
                            Get.off(() => const Practice9());
                          }
                          break;
                        case 9:
                          if (controllerp.p10ChoosenValue) {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Edit(name: items[index]["text"]);
                                });
                          } else {
                            Get.off(() => const Practice10());
                          }
                          break;
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          items[index]["icon"],
                          size: 70,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          items[index]["text"],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
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
