
import 'package:my_app/domain/entities/PracticeClass.dart';

class Goal{
  int id;
  late int goal;
 late List<String> list;

  Goal({required this.id});

  addGoal(int goalvalue){
    goal=goalvalue;
  }

  addList(List<String> listvalue){
   list=listvalue;
  }
}

class User{
  int? id;
  String name;
  String email;
  String password;
  int pts;
  DateTime startdate;
 late List<Task> tasks=[]; 
  late List <Goal>goals=[];
  late List<DateTime>days=[];
  late DateTime lastday;
  User({required this.name, required this.email,required  this.password,required this.pts,required this.startdate});
  
  User.id({this.id,required this.name, required this.email,required  this.password,required this.pts,required this.startdate});

  String get getname=>name;
  String get getemail=>email;
  String get getPassword=>password;
  int get getPoints=>pts;
  DateTime get getStartDate=>startdate;
  List<Task> get getTask=>tasks;
   List<Goal> get getGoal=>goals;
   List<DateTime> get getDays=>days;
  DateTime get getLastDay=>lastday;

  void addList(List<Task> list){
   tasks.addAll(list);
  }

  void addDays(List<DateTime> day){
    days.addAll(day);
  }

  void setFocusDay(DateTime day){
   lastday=day;
  }
}