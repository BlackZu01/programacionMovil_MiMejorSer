import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:my_app/ui/Controller/practiceController.dart';
import 'package:get/get.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  final Practicecontroller controllerp = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Calendario',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Obx para la actualización reactiva de la tabla del calendario
            Obx(() => TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: controllerp.focusedDay.value,
              // Cambiar a true si el día es igual a focusedDay
              selectedDayPredicate: (day) {
                return isSameDay(controllerp.focusedDay.value, day);
              },
              // Estilo de los días en el calendario
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: Colors.teal[200],
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: Colors.blue, // Cambia el color a azul para el día seleccionado
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
              // Customización de los días con condicionales
              calendarBuilders: CalendarBuilders(
                defaultBuilder: (context, day, focusedDay) {
                  // Encuentra si el día está completado o no
                  var completedDay = controllerp.completedDays.firstWhere(
                    (completed) => isSameDay(completed['day'], day),
                    orElse: () => {},  // Retorna un mapa vacío si no hay información del día
                  );

                  // Si el día tiene información de completado
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

                  // Estilo por defecto para otros días sin información
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
              headerStyle: HeaderStyle(
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
            Obx(() => Text(
              'Día seleccionado: ${controllerp.focusedDay.value.day}/${controllerp.focusedDay.value.month}/${controllerp.focusedDay.value.year}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.teal,
              ),
            )),
          ],
        ),
      ),
    );
  }
}
