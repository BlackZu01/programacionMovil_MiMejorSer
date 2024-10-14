import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/ui/Controller/accountController.dart';
import 'package:my_app/ui/pages/initial.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  List<String> tasks = ["Tarea 1", "Tarea 2", "Tarea 3"];

  // Estado para controlar la visibilidad de la lista de tareas
  bool showTasks = false;
  final Accountcontroller controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mi Mejor Ser',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
        toolbarHeight: 110,
        backgroundColor: Colors.lightGreenAccent,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50))),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.black,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FadeInUp(
              duration: const Duration(milliseconds: 1000),
              child: const Text('Seleccione su plan de actividad diario.'),
            ),
            const SizedBox(height: 20),
            FadeInUp(
                duration: const Duration(milliseconds: 1000),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MaterialButton(
                        minWidth: double.infinity,
                        height: 40,
                        color: Colors.lightGreenAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        onPressed: () {
                          setState(() {
                            showTasks = !showTasks;
                          });
                        },
                        child: const Text('Lista de tareas predeterminada')),
                    AnimatedSize(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      child: showTasks
                          ? Column(
                              children: tasks
                                  .map((task) => ListTile(title: Text(task)))
                                  .toList(),
                            )
                          : const SizedBox.shrink(),
                    ),
                    const SizedBox(height: 20),
                    MaterialButton(
                        minWidth: double.infinity,
                        height: 40,
                        color: Colors.lightGreenAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        onPressed: () {
                          controller.changename(controller.obtainName(controller.emailGetList.indexOf(controller.emailValue)));
                          goToInit(context, controller.nameValue);
                        },
                        child: const Text('Crear nueva lista')),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  void goToInit(BuildContext context, String text) {
      Get.off(()=>const InitialPage());
  }
}
