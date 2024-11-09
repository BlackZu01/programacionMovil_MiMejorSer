import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:my_app/ui/Controller/accountController.dart';
import 'package:my_app/ui/Controller/practiceController.dart';
import 'package:my_app/ui/pages/initial.dart';
import 'package:my_app/main.dart';
import 'package:my_app/ui/pages/signup.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});




  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
 final Accountcontroller controller = Get.find();
 final Practicecontroller controllerp = Get.find();
 
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        leading: IconButton(
          onPressed: () {
           Get.off(()=>const HomePage());
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      FadeInUp(
                          duration: const Duration(milliseconds: 1000),
                          child: Text(
                            "Iniciar sesión",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      FadeInUp(
                          duration: const Duration(milliseconds: 1200),
                          child: Text(
                            "Inicia sesión con tu cuenta",
                            style: TextStyle(
                                fontSize: 15,
                                color: Theme.of(context).colorScheme.primary),
                          )),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: <Widget>[
                        FadeInUp(
                          duration: const Duration(milliseconds: 1200),
                          child: makeInput(
                            label: "Correo",
                            controller: emailController,
                          ),
                        ),
                        FadeInUp(
                          duration: const Duration(milliseconds: 1300),
                          child: makeInput(
                            label: "Contraseña",
                            obscureText: true,
                            controller: passwordController,
                          ),
                        ),
                      ],
                    ),
                  ),
                   FadeInUp(
                    duration: const Duration(milliseconds: 1400),
                    child: Padding(padding: const EdgeInsets.symmetric(horizontal: 40),
                         child: ElevatedButton(style: ElevatedButton.styleFrom(
                  backgroundColor:Theme.of(context).colorScheme.primaryContainer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15)),
                          onPressed: () {
                            // Verificar si los datos coinciden
                            int index=controller.emailGetList.indexOf(emailController.text);
                            if (controller.emailGetList.contains(emailController.text) &&
                               controller.confirmPassword(index)==
                               passwordController.text
                               ) {
                                controller.setname(index);
                              controller.emailpassword(emailController.text, passwordController.text);
                              bool op=controllerp.verifyUser(emailController.text);
                              if(op){
                                controllerp.login(emailController.text);
                              }else{
                                controllerp.restartDate();
                              }
                              Get.off(()=>const InitialPage());
                              
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                      Text("Email o contraseña incorrectos"),
                                ),
                              );
                            }
                          },
                          child: Text(
                            "Iniciar sesión",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          ),
              )),
                  FadeInUp(
                    duration: const Duration(milliseconds: 1500),
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text("¿No tienes una cuenta? "),
                         InkWell(
                          onTap: () {
                            Get.off(() => const SignupPage());
                          },
                          child: const Text(
                            "Registrarse",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            FadeInUp(
                duration: const Duration(milliseconds: 1400),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 3,
                  child: Lottie.asset('assets/wave.json',
                      fit: BoxFit.cover, width: screenWidth),
                )),
          ],
        ),
      ),
    );
  }

  Widget makeInput({
    required String label,
    required TextEditingController controller,
    bool obscureText = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).colorScheme.primary),
        ),
        const SizedBox(
          height: 5,
        ),
        TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400)),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400)),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
