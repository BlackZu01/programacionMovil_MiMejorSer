import 'package:animate_do/animate_do.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_app/data/models/usersdb.dart';
import 'package:my_app/domain/repository/User_repository.dart';
import 'package:my_app/domain/usecase/user_use_case.dart';
import 'package:my_app/ui/Controller/accountController.dart';
import 'package:my_app/ui/Controller/practiceController.dart';

import 'package:my_app/ui/pages/PracticesPages/W1.dart';
import 'package:my_app/ui/pages/PracticesPages/W2.dart';
import 'package:my_app/ui/pages/PracticesPages/W3.dart';
import 'package:my_app/ui/pages/PracticesPages/W4.dart';
import 'package:my_app/ui/pages/PracticesPages/W5.dart';
import 'package:my_app/ui/pages/PracticesPages/W6.dart';
import 'package:my_app/ui/pages/PracticesPages/W7.dart';
import 'package:my_app/ui/pages/PracticesPages/W8.dart';
import 'package:my_app/ui/pages/initial.dart';
import 'package:my_app/ui/pages/practices.dart';
import 'package:my_app/ui/pages/welcome.dart';
import 'package:my_app/ui/pages/calendar.dart';
import 'package:my_app/ui/pages/task_manager.dart';
import 'package:lottie/lottie.dart';
import 'ui/pages/login.dart';
import 'ui/pages/signup.dart';

Future<List<Box>> _openBox() async {
  List<Box> boxList = [];
  await Hive.initFlutter();
 Hive.registerAdapter(UserdbAdapter());
  Hive.registerAdapter(TaskdbAdapter());
  Hive.registerAdapter(GoaldbAdapter());
  boxList.add(await Hive.openBox('user'));
  return boxList;
}
void main () async{
    WidgetsFlutterBinding.ensureInitialized();
    await _openBox();
  Get.put(UserRepository());
  Get.put(UserUseCase());
   Get.put(Accountcontroller(), permanent: true);
   Get.put(Practicecontroller(), permanent: true);
 
  
  
 
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: FlexThemeData.light(
      scheme: FlexScheme.greenM3,
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 7,
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: true,
      swapLegacyOnMaterial3: true,
    ),
    darkTheme: FlexThemeData.dark(
      scheme: FlexScheme.greenM3,
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 13,
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: true,
      swapLegacyOnMaterial3: true,
      // To use the Playground font, add GoogleFonts package and uncomment
      // fontFamily: GoogleFonts.notoSans().fontFamily,
    ),
// If you do not have a themeMode switch, uncomment this line
// to let the device system mode control the theme mode:
// themeMode: ThemeMode.system,,
    initialRoute: '/Home',
    getPages: [
      GetPage(name: '/Home', page: () => const HomePage()),
      GetPage(name: '/Login', page: () => const LoginPage()),
      GetPage(name: '/SignUp', page: () => const SignupPage()),
      GetPage(name: '/Welcome', page: () => const QuestionPage()),
      GetPage(name: '/Initial', page: () => const InitialPage()),
      GetPage(name: '/task_manager', page: () => const TaskAdminPage()),
      GetPage(name: '/Practices', page: () => Practices()),
      GetPage(name: '/Calendar', page: () => CalendarPage()),
      GetPage(name: '/Practice1', page: () => const Practice1()),
      GetPage(name: '/Practice2', page: () => const Practice2()),
      GetPage(name: '/Practice3', page: () => const Practice3()),
      GetPage(name: '/Practice4', page: () => const Practice4()),
      GetPage(name: '/Practice5', page: () => const Practice5()),
      GetPage(name: '/Practice6', page: () => const Practice6()),
      GetPage(name: '/Practice7', page: () => const Practice7()),
      GetPage(name: '/Practice8', page: () => const Practice8())
    ],
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  FadeInUp(
                      duration: const Duration(milliseconds: 1000),
                      child: const Text(
                        "Bienvenido a Mi Mejor Ser",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  FadeInUp(
                      duration: const Duration(milliseconds: 1200),
                      child: Text(
                        "Ingresa tus credenciales para utilizar la aplicación",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey[700], fontSize: 15),
                      )),
                ],
              ),
              FadeInUp(
                  duration: const Duration(milliseconds: 1400),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 3,
                    child: Lottie.asset('assets/sunflower.json'),
                  )),
              Column(
                children: <Widget>[ 
                   FadeInUp(
                      duration: const Duration(milliseconds: 1500),     
                    child: ElevatedButton(style: ElevatedButton.styleFrom(
                  backgroundColor:Colors.yellow,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 85, vertical: 15)),
                            onPressed: () {
                          Get.off(() => const LoginPage());
                        },
                        child: const  Text(
                          "Iniciar sesión",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 26,color: Colors.black54),
                        ),
                      )
              ),
                  const SizedBox(
                    height: 20,
                  ), FadeInUp(
                      duration: const Duration(milliseconds: 1600),child:
                   ElevatedButton(style: ElevatedButton.styleFrom(
                  backgroundColor:Colors.yellow,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15)),
                          onPressed: () {
                            Get.to(() => const SignupPage());
                          },
                          child: const Text(
                            "Registrarse",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 26,color:Colors.black54),
                          ),
                        ),
              ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
