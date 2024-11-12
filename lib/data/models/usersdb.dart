
import 'package:hive/hive.dart';
import 'package:my_app/domain/entities/PracticeClass.dart';
import 'package:my_app/domain/entities/UserClass.dart';

part "usersdb.g.dart";

@HiveType(typeId: 0)
class Userdb extends HiveObject {
  @HiveField(0)
  String name;
  
  @HiveField(1)
  String email;
  
  @HiveField(2)
  String password;
  
  @HiveField(3)
  int pts;
  
  @HiveField(4)
  DateTime startdate;
  
  @HiveField(5)
  List<Taskdb> tasks;
  
  @HiveField(6)
  List<Goaldb> goals;
  
  @HiveField(7)
  List<DateTime> days;
  
  @HiveField(8)
  DateTime lastday;

  Userdb({
    required this.name,
    required this.email,
    required this.password,
    required this.pts,
    required this.startdate,
    this.tasks = const [],
    this.goals = const [],
    this.days = const [],
    required this.lastday,
  });
}

@HiveType(typeId: 1)
class Taskdb extends HiveObject {
  @HiveField(0)
  int id;
  
  @HiveField(1)
  String name;
  
  @HiveField(2)
  String goal;
  
  @HiveField(3)
  int pts;
  
  @HiveField(4)
  int counter;
  
  @HiveField(5)
  bool state;
  
  @HiveField(6)
  List<String> list;
  
  @HiveField(7)
  int goalCounter;
  
  Taskdb({
    required this.id,
    required this.name,
    required this.goal,
    required this.pts,
    this.counter = 0,
    this.state = false,
    this.list = const [],
    required this.goalCounter,
  });

  factory Taskdb.fromTask({
    required Task task,
  }) {
    return Taskdb(
     id:task.id,
     name:task.name,
     goal:task.goal,
     pts:task.pts,
     counter: task.getGoalCounter,
     state:task.getstate,
     list:task.list,
     goalCounter: task.getGoalCounter

    );
  }
  
  Task toTask(Taskdb taskdb){
    Task task=Task(id:taskdb.id,name:taskdb.name, goal:taskdb.goal,
    pts:taskdb.pts, goalCounter: taskdb.goalCounter);
    task.addList(taskdb.list);
    task.addCounterValue(taskdb.counter);
   return task; 
  }

}

@HiveType(typeId: 2)
class Goaldb extends HiveObject {
  @HiveField(0)
  int id;
  
  @HiveField(1)
  int goal;
  
  @HiveField(2)
  List<String> list;

  Goaldb({
    required this.id,
    this.goal = 0,
    this.list = const [],
  });

factory Goaldb.fromGoal({
    required Goal goal,
  }) {
    return Goaldb(
     id:goal.id,
    goal:goal.goal,
    list:goal.list
    );
  }

  Goal toGoal(Goaldb goaldb){
    Goal goal=Goal(id:goaldb.id);
    goal.addGoal(goaldb.goal);
    goal.addList(goaldb.list);
    return Goal(id:goal.id);

  }
  
}