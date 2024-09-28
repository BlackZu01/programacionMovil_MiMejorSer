


import 'package:get/get.dart';

class Task {
  String name;
  String goal;
  int pts;
  var counter=0.obs;
  bool state;

  Task({required this.name, required this.goal,required this.pts,required this.state});

  String get getname=>name;
  String get getgoal=>goal;
  int get getcount=>counter.value;
  bool get getstate=>state;
}

// void main() {
//   // Lista de objetos Practices
//   List<Practices> practicesList = [
//     Practices(name: 'Gym', meta: '3 veces por semana', estado: true),
//     Practices(name: 'Estudiar', meta: '2 horas al día', estado: true),
//     Practices(name: 'Tomar agua', meta: '8 vasos al día', estado: false),
//   ];

//   // Eliminar objeto de la lista donde el nombre es 'Estudiar'
//   practicesList.removeWhere((practice) => practice.name == 'Estudiar');

//   // Imprimir la lista actualizada
//   practicesList.forEach((practice) {
//     print('Name: ${practice.name}, Meta: ${practice.meta}, Estado: ${practice.estado}');
//   });
// }
