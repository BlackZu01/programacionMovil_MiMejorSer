import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:my_app/domain/entities/PracticeClass.dart';
import 'package:my_app/domain/entities/UserClass.dart';
import 'package:my_app/ui/Controller/accountController.dart';
import 'package:my_app/ui/Controller/practiceController.dart';

void main() {
  Get.put(Accountcontroller());
  Practicecontroller practiceController = Practicecontroller();

  group('Practicecontroller Tests', () {
    test('Añadir tarea', () {
      Task task = Task(
          id: 1,
          name: "Tarea de prueba",
          goal: "Terminarla",
          pts: 10,
          goalCounter: 0,
          state: false);
      practiceController.addpractices(task);
      expect(practiceController.getpracticeslist.length, 1);
      expect(practiceController.getpracticeslist.first.name, "Tarea de prueba");
    });

    test('Elimina una tarea', () {
      Task task = Task(
          id: 1,
          name: "Tarea de prueba",
          goal: "Completar tarea",
          pts: 10,
          goalCounter: 0,
          state: false);
      practiceController.addpractices(task);
      practiceController.removepractice("Tarea de prueba");
      expect(practiceController.getpracticeslist.length, 0);
    });

    test('Deberia devolver una practica por nombre', () {
      Task task = Task(
          id: 1,
          name: "Tomar agua",
          goal: "Tomar 5 vasos de agua",
          pts: 5,
          goalCounter: 0,
          state: false);
      practiceController.addpractices(task);
      var retrievedTask = practiceController.getpractice("Tomar agua");
      expect(retrievedTask.name, "Tomar agua");
      expect(retrievedTask.goal, "Tomar 5 vasos de agua");
    });

    test('Editar una practica', () {
      Task task = Task(
          id: 4,
          name: "Leer",
          goal: "Leer 10 paginas",
          pts: 15,
          goalCounter: 0,
          state: false);
      practiceController.addpractices(task);
      practiceController.editpractice("Leer", "Leer 20 paginas");
      expect(practiceController.getpractice("Leer").goal, "Leer 20 paginas");
    });

    test('Incrementa los dias del calendario', () {
      DateTime initialDay = practiceController.focusedDay.value;
      practiceController.advanceCalendarOneDay();
      expect(practiceController.focusedDay.value,
          initialDay.add(Duration(days: 1)));
    });

    test('Revisa si todos las tareas se completaron', () {
      Task task1 = Task(
          id: 1,
          name: "Yoga",
          goal: "Rutina de mañana",
          pts: 5,
          goalCounter: 0,
          state: false);
      Task task2 = Task(
          id: 2,
          name: "Ejercicio",
          goal: "Cardio",
          pts: 10,
          goalCounter: 0,
          state: true);
      practiceController.addpractices(task1);
      practiceController.addpractices(task2);
      expect(practiceController.allTasksCompleted(), false);
    });

    test('Buscar usuario', () {
      User user = User(
          name: "Andrea",
          email: "andrea@bts.com",
          password: "crepes123",
          pts: 0,
          startdate: DateTime.now());
      practiceController.addUser(user);
      User retrievedUser = practiceController.searchUser("andrea@bts.com");
      expect(retrievedUser.email, "andrea@bts.com");
    });
  });
}
