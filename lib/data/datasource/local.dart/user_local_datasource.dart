
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:my_app/data/models/usersdb.dart';
import 'package:my_app/domain/entities/PracticeClass.dart';

import 'package:my_app/domain/entities/UserClass.dart';

class UserLocalDataSourceHive {

   List<Taskdb> tasksToTaskdbList(List<Task> tasks) {
  return tasks.map((task) => Taskdb.fromTask(task: task)).toList();
   }

   List<Goaldb> convertGoalToGoaldbList(List<Goal> goals) {
  return goals.map((goal) => Goaldb.fromGoal(goal: goal)).toList();
   }
   
  

  add(User user) async {
     debugPrint("-1-");
  Hive.box('user').add(Userdb(name:user.name,
   email:user.getemail,
   password:user.getPassword,
   pts:user.getPoints,
   startdate:user.getStartDate,
   lastday:user.getLastDay,
   days: user.getDays,
   tasks: tasksToTaskdbList(user.getTask),
   goals:convertGoalToGoaldbList(user.getGoal)
  ));
  }


Future<List<User>> getAll() async {
  try {

    return Hive.box('user').values
        .map((e) {
          print('Usuario: ${e.name}'); // Imprime el nombre del usuario para verificar

          // Convertir tasks y goals
          List<Task> taskList = e.tasks.map((taskdb) {
            return taskdb.toTask(taskdb);  // Convierte Taskdb a Task
          }).toList();

          List<Goal> goalList = e.goals.map((goaldb) {
            return goaldb.toGoal(goaldb);  // Convierte Goaldb a Goal
          }).toList();

          return User.id(
            id: e.key as int,
            name: e.name,
            email: e.email,
            password: e.password,
            pts: e.pts,
            startdate: e.startdate,
          )
          ..tasks = e.tasks.map((taskdb) {
            return taskdb.toTask(taskdb); // Convierte cada Taskdb en un Tas
          }).toList()
          ..days = List<DateTime>.from(e.days)
          ..goals = e.goals.map((goaldb) {
            return goaldb.toGoal(goaldb);})
          ..lastday = e.lastday;
        })
        .toList();
  } catch (e, stacktrace) {
    print('Error en getAll: $e');
    print('Stacktrace: $stacktrace');
    return [];
  }
}








 delete(int index) async {
 Hive.box('user').delete(index);
}


  updateUser(User user) async {
  Userdb userdb= Userdb(name:user.getname, email:user.getemail,
   password:user.getPassword,
   pts:user.getPoints,
   startdate:user.getStartDate,
   lastday:user.getLastDay,
   days: user.getDays,
   tasks: tasksToTaskdbList(user.getTask),
   goals:convertGoalToGoaldbList(user.getGoal)
  );
 Hive.box('user').put(user.id, userdb);
}
}