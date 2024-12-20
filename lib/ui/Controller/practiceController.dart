import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/domain/entities/CalendarDayClass.dart';
import 'package:my_app/domain/entities/PracticeClass.dart';
import 'package:my_app/domain/entities/UserClass.dart';
import 'package:my_app/domain/usecase/user_use_case.dart';
import 'package:my_app/ui/Controller/accountController.dart';
import 'package:table_calendar/table_calendar.dart';



class Practicecontroller extends GetxController{
  
Accountcontroller controller=Get.find();



  var npractices=0.obs;
  
  int get getnpractices=>npractices.value;

  var practiceslist = <Task>[].obs;

  var editing = false.obs;

  bool get editingValue => editing.value;

  var focusedDay = DateTime.now().obs;
  var startday = DateTime.now();
  bool startdayoption = false;

 var completedDays = <Map<String, dynamic>>[].obs;

setUserList(List<User> user){
  userList.value=user;
}

 changeEditing(bool value){
  editing.value=value;
 }

  List<Task> get getpracticeslist => practiceslist;

  void addpractices(Task value) {
    practiceslist.add(value);
  }

  void removepractice(String value) {
    practiceslist.removeWhere((practice) => practice.name == value);
    nochoosen(indexTask(value));
  }

  Task getpractice(String value) {
    for (var practice in practiceslist) {
      if (practice.getname == value) {
        return practice;
      }
    }
    return Task(id: 0, name: "", goal: "", pts: 0, goalCounter: 0);
  }

  addcounter(String name) {
    for (var practice in practiceslist) {
      if (practice.getname == name) {
        practice.counter++;
      }
    }
  }

  editpractice(String name, String goal) {
    for (var practice in practiceslist) {
      if (practice.getname == name) {
        practice.goal = goal;
      }
    }
  }

  editPracticeList(String name, List<String> l) {
    for (var practice in practiceslist) {
      if (practice.getname == name) {
        practice.list.value = l;
      }
    }
  }

  void advanceCalendarOneDay() {
    focusedDay.value = focusedDay.value.add(const Duration(days: 1));
  }

  bool allTasksCompleted() {
    for (var task in practiceslist) {
      if (!task.getstate) {
        return false;
      }
    }
    return true;
  }

  int resetDay() {
    int points = 0;
    bool allCompleted = allTasksCompleted();

    for (int i = 0; i < practiceslist.length; i++) {
      if (practiceslist[i].getstate) {
        switch (practiceslist[i].getId) {
          case 1 || 3 || 6 || 7 || 8 || 9:
            points += practiceslist[i].getPoints;
            practiceslist[i].falseTask();
            break;
          case 2 || 4 || 5 || 10:
            points +=
                practiceslist[i].getPoints * practiceslist[i].getList.length;
            practiceslist[i].falseTask();
            break;
        }
      }
      practiceslist[i].resetCounter();
    }

    if (!startdayoption) {
      startday = focusedDay.value;
      startdayoption = true;
    }
    completedDays.add({
      "day": focusedDay.value,
      "completed": allCompleted,
    });

    advanceCalendarOneDay();
    debugPrint('$points');
    return points;
  }

  List<Map<String, dynamic>> get getCompletedDays => completedDays;

  int indexTask(String name) {
    switch (name) {
      case 'Tomar agua':
        return 1;
      case 'Alimentacion sana':
        return 2;
      case 'Caminar/Trotar':
        return 3;
      case 'Gimnasio':
        return 4;
      case 'Estudiar':
        return 5;
      case 'Leer':
        return 6;
      case 'Pausa activa':
        return 7;
      case 'Tomar una siesta':
        return 8;
      case 'Sin ver pantallas':
        return 9;
      case 'Actividad/Hobby':
        return 10;
      default:
        0;
    }
    return 0;
  }

  var userList = <User>[].obs;

  List<User> get getUserList => userList;

  void addUser(User user) {
    userList.add(user);
  }

  User searchUser(String email) {
    for (int i = 0; i < userList.length; i++) {
      if (userList[i].email == email) {
        // debugPrint(userList[i].getTask[0].name);
        return userList[i];
      }
    }
    return User(
        name: " ", email: " ", password: "", pts: 0, startdate: DateTime.now());
  }

  // practices1
  var p1 = 7.obs; //Valor meta
  var p1inpractice = 0.obs; //Contador
  var p1choosen = false.obs; //Valor para verificar si ha sido eligido

  int get p1Value => p1.value;
  int get p1inpracticeValue => p8inpractice.value;
  bool get p1choosenValue => p1choosen.value;

  // practices 2
  var p2 = <String>[].obs;
  var p2inpractice = 0.obs;
  var p2choosen = false.obs;

  List<String> get p2List => p2;
  bool get p2ChoosenValue => p2choosen.value;

  //  practice3
  var p3 = 10.obs;
  var p3inpractice = 0.obs;
  var p3choosen = false.obs;
  var p3finish = false.obs;

  int get p3Value => p3.value;
  int get p3inpracticeValue => p3inpractice.value;
  bool get p3choosenValue => p3choosen.value;

  // practices 4
  var p4 = <String>[].obs;
  var p4inpractice = 0.obs;
  var p4choosen = false.obs;

  List<String> get p4List => p4;
  bool get p4ChoosenValue => p4choosen.value;

  // practices 5
  var p5 = <String, int>{}.obs;
  var p5inpractice = 0.obs;
  var p5choosen = false.obs;
  var listp5 = <String>[].obs;

  Map<String, int> get p5List => p5;
  List<String> get getListp5 => listp5;
  bool get p5ChoosenValue => p5choosen.value;

//  practice6
  var p6 = 10.obs;
  var p6inpractice = 0.obs;
  var p6choosen = false.obs;

  int get p6Value => p6.value;
  int get p6inpracticeValue => p6inpractice.value;
  bool get p6choosenValue => p6choosen.value;

  //practices7
  var p7 = 1.obs;
  var p7inpractice = 0.obs;
  var p7choosen = false.obs;

  int get p7Value => p7.value;
  int get p7inpracticeValue => p7inpractice.value;
  bool get p7choosenValue => p7choosen.value;

  //practice8
  var p8 = 20.obs;
  var p8inpractice = 0.obs;
  var p8choosen = false.obs;

  int get p8Value => p8.value;
  int get p8inpracticeValue => p8inpractice.value;
  bool get p8choosenValue => p8choosen.value;

  //  practice9
  var p9 = 30.obs;
  var p9inpractice = 0.obs;
  var p9choosen = false.obs;
  var p9finish = false.obs;

  int get p9Value => p9.value;
  int get p9inpracticeValue => p9inpractice.value;
  bool get p9choosenValue => p9choosen.value;

//practice 10
  var p10 = <String>[].obs;
  var p10inpractice = 0.obs;
  var p10choosen = false.obs;

  List<String> get p10List => p10;
  bool get p10ChoosenValue => p10choosen.value;

  increment(int index) {
    switch (index) {
      case 1:
        if (p1.value != 15) {
          p1.value++;
        }
        break;
      case 3:
        if (p3.value != 90) {
          p3.value += 5;
        }
        break;
      case 6:
        if (p6.value != 720) {
          p6.value += 10;
        }
        break;
      case 7:
        if (p7.value != 5) {
          p7.value++;
        }
        break;
      case 8:
        if (p8.value != 90) {
          p8.value += 5;
        }
        break;

      case 9:
        if (p9.value != 300) {
          p9.value += 30;
        }
        break;
    }
  }

  incrementInPractice(int index) {
    switch (index) {
      case 1:
        if (p1inpractice.value != 15) {
          p1inpractice.value++;
        }
        break;
      case 2:
        p2inpractice.value++;
        break;
      case 3:
        if (p3inpractice.value != 90) {
          p3inpractice.value += 5;
        }
      case 4:
        p4inpractice.value++;
        break;
      case 5:
        p5inpractice.value++;
        break;
      case 6:
        if (p6inpractice.value != 720) {
          p6inpractice.value += 10;
        }
        break;
      case 7:
        if (p7inpractice.value != 5) {
          p7inpractice.value++;
        }
        break;
      case 8:
        if (p8inpractice.value != 90) {
          p8inpractice.value += 5;
        }
        break;

      case 9:
        if (p9inpractice.value != 300) {
          p9inpractice.value += 30;
        }
        break;
      case 10:
        p10inpractice.value++;
        break;
    }
  }

  decrement(int index) {
    switch (index) {
      case 1:
        if (p1.value != 7) {
          p1.value--;
        }
      case 3:
        if (p3.value != 10) {
          p3.value -= 5;
        }
        break;
      case 6:
        if (p6.value != 10) {
          p6.value -= 10;
        }
        break;
      case 7:
        if (p7.value != 1) {
          p7.value--;
        }
      case 8:
        if (p8.value != 20) {
          p8.value -= 5;
        }
        break;
      case 9:
        if (p9.value != 30) {
          p9.value -= 30;
        }
        break;
    }
  }

  decrementInPractice(int index) {
    switch (index) {
      case 1:
        if (p1inpractice.value != 7) {
          p1inpractice.value--;
        }
      case 3:
        if (p3inpractice.value != 10) {
          p3inpractice.value -= 5;
        }
        break;
      case 6:
        if (p6inpractice.value != 10) {
          p6inpractice.value -= 10;
        }
        break;
      case 7:
        if (p7inpractice.value != 1) {
          p7inpractice.value--;
        }
      case 8:
        if (p8inpractice.value != 20) {
          p8inpractice.value -= 5;
        }
        break;
      case 9:
        if (p9inpractice.value != 30) {
          p9inpractice.value -= 30;
        }
        break;
    }
  }

  int getInPractice(int index) {
    switch (index) {
      case 1:
        return p1inpractice.value;
      case 2:
        return p2inpractice.value;
      case 3:
        return p3inpractice.value;
      case 4:
        return p4inpractice.value;
      case 5:
        return p5inpractice.value;
      case 6:
        return p6inpractice.value;
      case 7:
        return p7inpractice.value;
      case 8:
        return p8inpractice.value;
      case 9:
        return p9inpractice.value;
      case 10:
        return p10inpractice.value;
      default:
        return 0;
    }
  }

  reset(int index) {
    switch (index) {
      case 1:
        p1.value = 7;
        break;
      case 2:
        p2List.clear();
        break;
      case 3:
        p3.value = 10;
        break;
      case 4:
        p4List.clear();
        break;
      case 5:
        p5List.clear();
        break;
      case 6:
        p6.value = 10;
        break;
      case 7:
        p7.value = 1;
        break;
      case 8:
        p8.value = 20;
        break;
      case 9:
        p9.value = 30;
        break;
      case 10:
        p10List.clear();
        break;
    }
  }

  add(int index, String value) {
    switch (index) {
      case 2:
        p2.add(value);
        break;
      case 4:
        p4.add(value);
        break;
      case 5:
        listp5.add(value);
        break;
      case 10:
        p10.add(value);
        break;
    }
  }

  remove(int n, int index) {
    switch (n) {
      case 2:
        p2.removeAt(index);
        break;
      case 4:
        p4.removeAt(index);
        break;
      case 10:
        p10.removeAt(index);
    }
  }

  p5modify(String value, int number, int index) {
    if (index == 1) {
      p5[value] = number;
    } else {
      p5.remove(value);
    }
  }

  bool p5hourpass() {
    int n = 0;
    p5.forEach((key, value) {
      n += value;
    });
    debugPrint('$n');
    if (n >= 13) {
      return true;
    } else {
      return false;
    }
  }

  void choosen(int index) {
    switch (index) {
      case 1:
        p1choosen.value = true;
        break;
      case 2:
        p2choosen.value = true;
        break;
      case 3:
        p3choosen.value = true;
        break;
      case 4:
        p4choosen.value = true;
        break;
      case 5:
        p5choosen.value = true;
        break;
      case 6:
        p6choosen.value = true;
        break;
      case 7:
        p7choosen.value = true;
        break;
      case 8:
        p8choosen.value = true;
        break;
      case 9:
        p9choosen.value = true;
        break;
      case 10:
        p10choosen.value = true;
        break;
    }
    npractices++;
  }

  var goals = <Goal>[];
  List<Goal> get getGoals => goals;

  void nochoosen(int index) {
    goals.add(Goal(id: index));
    switch (index) {
      case 1:
        p1choosen.value = false;
        break;
      case 2:
        p2choosen.value = false;
        break;
      case 3:
        p3choosen.value = false;
        break;
      case 4:
        p4choosen.value = false;
        break;
      case 5:
        p5choosen.value = false;
        break;
      case 6:
        p6choosen.value = false;
        break;
      case 7:
        p7choosen.value = false;
        break;
      case 8:
        p8choosen.value = false;
        break;
      case 9:
        p9choosen.value = false;
        break;
      case 10:
        p10choosen.value = false;
        break;
    }

    reset(index);
    npractices--;
  }

  int getinPractices(String name) {
    switch (name) {
      case 'Tomar agua':
        return p1inpractice.value;
      case 'Alimentacion sana':
        return p2inpractice.value;
      case 'Caminar/Trotar':
        return p3inpractice.value;
      case 'Gimnasio':
        return p4inpractice.value;
      case 'Estudiar':
        return p5inpractice.value;
      case 'Leer':
        return p6inpractice.value;
      case 'Pausa activa':
        return p7inpractice.value;
      case 'Tomar una siesta':
        return p8inpractice.value;
      case 'Sin ver pantallas':
        return p9inpractice.value;
      case 'Actividad/Hobby':
        return p10inpractice.value;
      default:
        return 0;
    }
  }

  setterCounter(int index, int counter) {
    switch (index) {
      case 1:
        p1.value = counter;
        break;
      case 3:
        p3.value = counter;
        break;
      case 6:
        p6.value = counter;
        break;
      case 7:
        p7.value = counter;
        break;
      case 8:
        p8.value = counter;
        break;
      case 9:
        p9.value = counter;
    }
  }

  setterList(int index, List<String> list) {
    switch (index) {
      case 2:
        p2.value = list;
        break;
      case 4:
        p4.value = list;
        break;
      case 10:
        p10.value = list;
        break;
    }
  }

  void resetall() {
    controller.reset();
    practiceslist.value = [];
    for (int i = 1; i <= 10; i++) {
      nochoosen(i);
    }
    npractices.value = 0;
  }

  void logout() {
    startdayoption = false;
    User user = User(
        name: controller.nameValue,
        email: controller.emailValue,
        password: controller.passwordValue,
        pts: controller.getPts,
        startdate: startday);
    user.addList(getpracticeslist);
    user.addDays(getAllCompletedDays());
    user.setFocusDay(focusedDay.value);
    restartDate();
    if(verifyUser(controller.emailValue)){
       for(int i=0;i<userList.length;i++){
        if(userList[i].email==controller.emailValue){
          userList[i] = user;
          break;
        }
      }
    } else {
      userList.add(user);
    }
  }

  bool verifyUser(String email) {
    for (int i = 0; i < userList.length; i++) {
      debugPrint(userList[i].email);
      if (userList[i].email == email) {
        return true;
      }
    }
    return false;
  }

  void login(String email) {
    startdayoption = true;
    User user = searchUser(email);

    controller.emailpassword(user.email, user.password);
    controller.changename(user.name);
    controller.setpts(user.pts);
    loadUserData(user.startdate, user.getLastDay, user.getDays);
    practiceslist.value = List.from(user.getTask);
    for (int i = 0; i < practiceslist.length; i++) {
      choosen(practiceslist[i].id);
      switch (practiceslist[i].id) {
        case 1 || 3 || 6 || 7 || 8:
          setterCounter(practiceslist[i].id, practiceslist[i].getGoalCounter);
          break;
        case 2 || 4 || 5 || 10:
          setterList(practiceslist[i].id, practiceslist[i].getList);
          break;
      }
    }
  }

  void readpractices() {
    for (int i = 0; i < practiceslist.length; i++) {
      debugPrint(practiceslist[i].name);
    }
  }

  var calendarDays = <CalendarDay>[].obs;
  RxList<DateTime> completedDates = <DateTime>[].obs;

  void setFocusedDay(DateTime day) {
    focusedDay.value = day;
  }

// Carga las fechas para el usuario actual
  void loadUserData(
      DateTime startday, DateTime lastday, List<DateTime> userCompletedDates) {
    completedDates.value = userCompletedDates;
    focusedDay.value = startday;
    for (var day in userCompletedDates) {
      debugPrint("${focusedDay.value}+$day");
      while (!(isSameDay(focusedDay.value, day))) {
        completedDays.add({"day": focusedDay.value, "completed": false});
        advanceCalendarOneDay();
      }
      completedDays.add({"day": focusedDay.value, "completed": true});
      advanceCalendarOneDay();
    }

    while (!isSameDay(focusedDay.value, lastday)) {
      completedDays.add({"day": focusedDay.value, "completed": false});
      advanceCalendarOneDay();
    }
  }

// Restablece el calendario cerrar sesión
  void restartDate() {
    completedDates.clear();
    completedDays.clear();
    for (var day in calendarDays) {
      day.completed = false;
    }
    focusedDay.value = DateTime.now();
    calendarDays.refresh();
    completedDates.refresh();
  }

  List<DateTime> getAllCompletedDays() {
    List<DateTime> days = [];
    for (var day in completedDays) {
      if (day["completed"]) {
        days.add(day["day"]);
      }
    }
    return days;
  }


// Practicecontroller() {
//     getAllUser();
//   }

  

  UserUseCase userUseCase = Get.find();

  Future<void> getAllUser() async {
   try{
    var list = await userUseCase.getAllUser();
    setUserList(list);
   }catch(e){
     Future.error(e);
   }
  }

  void addItem(item) async {
    try{
    await userUseCase.addUser(item);
    }catch(e){
     Future.error(e);
   }
    await getAllUser();
  }

  void removeItem(item) async {
    try{
    await userUseCase.deleteUser(item.id);
    }catch(e){
     Future.error(e);
   }
    await getAllUser();
  }

   void updateItem(item) async {
    try{
    await userUseCase.updateUser(item);
    }catch(e){
     Future.error(e);
   }
    await getAllUser();
  }
  
}

