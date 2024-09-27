import 'package:animate_do/animate_do.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/Controller/accountController.dart';
import 'package:my_app/Controller/practiceController.dart';
import 'package:my_app/PracticesWidgets/W1.dart';
import 'package:my_app/PracticesWidgets/W2.dart';
import 'package:my_app/PracticesWidgets/W3.dart';
import 'package:my_app/PracticesWidgets/W4.dart';
import 'package:my_app/PracticesWidgets/W5.dart';
import 'package:my_app/PracticesWidgets/W6.dart';
import 'package:my_app/PracticesWidgets/W8.dart';
import 'package:my_app/pages/initial.dart';
import 'package:my_app/pages/practices.dart';
import 'package:my_app/pages/welcome.dart';
import 'package:my_app/pages/task_manager.dart';
import 'package:lottie/lottie.dart';
import 'login.dart';
import 'signup.dart';

void main() {
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
      GetPage(name: '/Login', page: () => LoginPage()),
      GetPage(name: '/SignUp', page: () => const SignupPage()),
      GetPage(name: '/Welcome', page: () => const QuestionPage()),
      GetPage(name: '/Initial', page: () => const InitialPage()),
      GetPage(name: '/task_manager', page: () => const TaskAdminPage()),
      GetPage(name: '/Practices', page: () => Practices()),
      GetPage(name: '/Practice1', page: () => const Practice1()),
      GetPage(name: '/Practice2', page: () => const Practice2()),
      GetPage(name: '/Practice3', page: () => const Practice3()),
      GetPage(name: '/Practice4', page: () => const Practice4()),
      GetPage(name: '/Practice5', page: () => const Practice5()),
      GetPage(name: '/Practice6', page: () => const Practice6()),
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
                      child: MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: () {
                          Get.off(() => LoginPage());
                        },
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(50)),
                        child: const Text(
                          "Iniciar sesión",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  FadeInUp(
                      duration: const Duration(milliseconds: 1600),
                      child: Container(
                        padding: const EdgeInsets.only(top: 3, left: 3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: const Border(
                              bottom: BorderSide(color: Colors.black),
                              top: BorderSide(color: Colors.black),
                              left: BorderSide(color: Colors.black),
                              right: BorderSide(color: Colors.black),
                            )),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          height: 60,
                          onPressed: () {
                            Get.to(() => const SignupPage());
                          },
                          color: Colors.yellow,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          child: const Text(
                            "Registrarse",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                        ),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
