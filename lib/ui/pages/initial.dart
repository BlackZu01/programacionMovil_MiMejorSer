import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/ui/Controller/accountController.dart';
import 'package:my_app/ui/Controller/practiceController.dart';
import 'package:my_app/ui/pages/Widgets/Reset.dart';
import 'package:my_app/ui/pages/Widgets/WP1.dart';
import 'package:my_app/ui/pages/login.dart';
import 'package:my_app/ui/pages/practices.dart';
import 'package:my_app/ui/Controller/PracticeClass.dart';
import 'package:my_app/ui/pages/calendar.dart';
import 'package:my_app/ui/pages/task_manager.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  _InitialPage createState() => _InitialPage();
}

class _InitialPage extends State<InitialPage> {
  final Accountcontroller controlleraccount = Get.find();
  final Practicecontroller controllerp = Get.find();
  int completedGoals = 0;
  int points = 0;

  @override
  Widget build(BuildContext context) {
    // Obtener el número total de tareas
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi Mejor Ser'),
        backgroundColor: Colors.greenAccent.shade200,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFFF5F4FB),
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
                // Botón de calendario
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: IconButton(
                    onPressed: () {
                      Get.to(() => CalendarPage());
                    },
                    icon: const Icon(
                      Icons.calendar_today, // Icono de calendario
                      size: 28,
                      color: Colors.white,
                    ),
                    splashRadius: 24,
                  ),
                ),
                // Botón de administrar tareas
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
                // Botón del perfil
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
                            Text(
                              'Puntos: ${controlleraccount.getPts}',
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
                                      controllerp.logout();
                                      controllerp.resetall();
                                      Get.off(() => const LoginPage());
                                    },
                                    child: Text(
                                      "Cerrar sesión",
                                      style: TextStyle(
                                        color: Theme.of(context).colorScheme.tertiary,
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
                  Obx(() {
                int totalTasks = controllerp.getnpractices;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ((completedGoals / totalTasks) != 1)
                          ? "Vamos, ponle animo y completa tus tareas diarias"
                          : "Felicidades,has completado tus tareas",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text('$completedGoals/$totalTasks objetivos completados'),
                    const SizedBox(height: 10),
                    LinearProgressIndicator(
                      value: totalTasks > 0
                          ? completedGoals / totalTasks
                          : 0, // Asegurarse de que no se divida entre 0
                      backgroundColor: Colors.grey[300],
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).colorScheme.secondary),
                    ),
                  ],
                );
              }),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
              const Expanded(child:  Text(
                  "TAREAS DE HOY",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                )),
                IconButton(
                    onPressed: () {
                      points = controllerp.resetDay();
                      controlleraccount.addpts(points);
                      setState(() {
                        completedGoals = 0;
                      });

                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Reset(points: points);
                          });
                      debugPrint('${controllerp.getpracticeslist[0].getstate}');
                    },
                    icon: Icon(Icons.refresh,
                        color: Theme.of(context).colorScheme.primary))
              ],
            ),
            const SizedBox(height: 20),

            // Mostrar tareas o mensaje de que no hay tareas seleccionadas
            Expanded(child: Obx(() {
              return controllerp.getpracticeslist.isEmpty
                  ? const Center(
                      child: Text(
                        'No has seleccionado tareas.',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: controllerp.getpracticeslist.length,
                      itemBuilder: (context, index) {
                        return TaskCard(
                          task: controllerp.getpracticeslist[index],
                          onStatusChange: () {
                            setState(() {
                              if (controllerp.getpracticeslist[index].getstate == false) {
                                controllerp.getpracticeslist[index].trueTask();
                                completedGoals++;
                              } else {
                                controllerp.getpracticeslist[index].falseTask();
                                completedGoals--;
                              }
                            });
                          },
                        );
                      },
                    );
              })
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
      )
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
            backgroundColor: task.getstate == false ? Theme.of(context).colorScheme.tertiaryContainer 
            : Theme.of(context).colorScheme.secondaryContainer,
            child: Icon(
              task.getstate == false ? Icons.check_box_outline_blank : Icons.check,
              color: task.getstate == false ? Theme.of(context).colorScheme.tertiary 
              : Theme.of(context).colorScheme.secondary
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
            final Practicecontroller controllerp = Get.find();
           showDialog(context: context, builder: (BuildContext context){
                switch(task.getname){
                case 'Tomar agua':
                return(WP1(name: task.getname,limit:controllerp.p1Value));
                case 'Pausa activa':return(WP1(name:task.getname,limit:controllerp.p7Value));
                default:
                return(WP1(name: "",limit:30));
                // break;
              }
             
           });
          }, icon: Icon(Icons.info,color: Theme.of(context).colorScheme.primary,)),
          
          GestureDetector(
            onTap: onStatusChange,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                color: task.getstate == false ? Theme.of(context).colorScheme.tertiaryContainer 
                : Theme.of(context).colorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                task.getstate ? "Completa" : "Pendiente",
                style: TextStyle(
                  color: task.getstate == false ? Theme.of(context).colorScheme.tertiary 
                  : Theme.of(context).colorScheme.secondary,
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
