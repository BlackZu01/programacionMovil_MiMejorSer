import 'package:flutter/material.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  List<String> tasks = ["Tarea 1", "Tarea 2", "Tarea 3"];

  // Estado para controlar la visibilidad de la lista
  bool showTasks = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'Mi Mejor Ser',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        )),
        centerTitle: true,
        toolbarHeight: 110,
        backgroundColor: Colors.lightGreenAccent,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50))),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              const PopupMenuItem(
                child: Text('Editar'),
              ),
              const PopupMenuItem(
                child: Text('Eliminar'),
              )
            ],
          )
        ],
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
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    showTasks = !showTasks;
                  });
                },
                child: const Text('Mostrar lista de tareas')),
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
            ElevatedButton(onPressed: () {}, child: const Text('Otro boton')),
          ],
        ),
      ),
    );
  }
}
