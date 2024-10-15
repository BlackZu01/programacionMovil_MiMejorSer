import 'package:flutter/material.dart';
import 'package:my_app/ui/Controller/accountController.dart';
import 'package:my_app/ui/pages/initial.dart';
import 'package:my_app/ui/pages/login.dart';
import 'package:my_app/ui/pages/practices.dart';
import 'package:my_app/ui/pages/task_manager.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:my_app/ui/Controller/practiceController.dart';
import 'package:get/get.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  final Practicecontroller controllerp = Get.find();
  final Accountcontroller controlleraccount=Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Calendario',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.greenAccent.shade200,
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
                          Get.off(() => CalendarPage());
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
          children: [
            Obx(() => TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: controllerp.focusedDay.value,
              selectedDayPredicate: (day) {
                return isSameDay(controllerp.focusedDay.value, day);
              },
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: Colors.teal[200],
                  shape: BoxShape.circle,
                ),
                selectedDecoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                isTodayHighlighted: true,
                defaultDecoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 6,
                      spreadRadius: 2,
                    ),
                  ],
                ),
              ),
              calendarBuilders: CalendarBuilders(
                defaultBuilder: (context, day, focusedDay) {
                  var completedDay = controllerp.completedDays.firstWhere(
                    (completed) => isSameDay(completed['day'], day),
                    orElse: () => {},
                  );

                  if (completedDay.isNotEmpty && completedDay['completed'] != null) {
                    bool completed = completedDay['completed'];
                    return Container(
                      margin: const EdgeInsets.all(4.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: completed ? Colors.green[400] : Colors.red[400],
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 6,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Text(
                        '${day.day}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    );
                  }

                  return Container(
                    margin: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    child: Text(
                      '${day.day}',
                      style: const TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                },
              ),
              headerStyle:const  HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                titleTextStyle: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
            )),
            const SizedBox(height: 16),
            // Mostrar el día seleccionado
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
