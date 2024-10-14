import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/ui/Controller/accountController.dart';
import 'package:my_app/main.dart';
import 'package:my_app/ui/Controller/practiceController.dart';
import 'package:my_app/ui/pages/login.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>(); // Llave para manejar el Form
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final Accountcontroller controller = Get.find();
  final Practicecontroller controllerp = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        leading: IconButton(
          onPressed: () {
            Get.off(() => const HomePage());
          },
          icon: const Icon(Icons.arrow_back_ios, size: 20, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Form(
            key: _formKey, // Form que permite validar los TextFormFields
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    FadeInUp(
                      duration: const Duration(milliseconds: 1000),
                      child: Text(
                        "Registrarse",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary),
                      ),
                    ),
                    const SizedBox(height: 20),
                    FadeInUp(
                      duration: const Duration(milliseconds: 1200),
                      child: Text(
                        "Crea una cuenta nueva",
                        style: TextStyle(
                            fontSize: 15,
                            color: Theme.of(context).colorScheme.primary),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    FadeInUp(
                      duration: const Duration(milliseconds: 1200),
                      child: makeInput(
                        label: "Nombre",
                        controller: nameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingrese un nombre';
                          }
                          return null;
                        },
                      ),
                    ),
                    FadeInUp(
                      duration: const Duration(milliseconds: 1200),
                      child: makeInput(
                        label: "Correo electronico",
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingrese un correo electronico';
                          }
                          if (!value.contains('@')) {
                            return 'Ingrese un correo electronico valido';
                          }
                          if(controllerp.verifyUser(value)){
                             return 'Ya ese correo fue registrado';
                          }
                          return null;
                        },
                      ),
                    ),
                    FadeInUp(
                      duration: const Duration(milliseconds: 1300),
                      child: makeInput(
                        label: "Contraseña",
                        obscureText: true,
                        controller: passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingrese una contraseña';
                          }
                          if (value.length < 6) {
                            return 'La contraseña debe tener más de 6 caracteres';
                          }
                          return null;
                        },
                      ),
                    ),
                    FadeInUp(
                      duration: const Duration(milliseconds: 1400),
                      child: makeInput(
                        label: "Confirmar contraseña",
                        obscureText: true,
                        controller: confirmPasswordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor confirme su contraseña';
                          }
                          if (value != passwordController.text) {
                            return 'Las contraseñas no coinciden';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                FadeInUp(
                  duration: const Duration(milliseconds: 1500),
                  child:  ElevatedButton(style: ElevatedButton.styleFrom(
                  backgroundColor:Theme.of(context).colorScheme.primaryContainer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15)),
                      onPressed: () {
                        // Verificar si el formulario es válido
                        if (_formKey.currentState!.validate()) {
                          // Si es válido, navega a la página de inicio con los datos
                          controller.addEmailList(emailController.text);
                          controller.addPasswordList(passwordController.text);
                          controller.addnameList(nameController.text);
                          debugPrint(
                              '${controller.emailGetList.contains('$emailController')}');
                          Get.off(() => const HomePage());
                        }
                      },
                      child: Text(
                        "Registrarse",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Theme.of(context).colorScheme.primary),
                      ),
                    ),
                  
                ),
                FadeInUp(
                  duration: const Duration(milliseconds: 1600),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("¿No tienes una Cuenta? "),
                      InkWell(
                          onTap: () {
                            Get.off(() => const LoginPage());
                          },
                          child: const Text(
                            "Iniciar Sesion",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Función que genera el campo de entrada con validación
  Widget makeInput(
      {label,
      obscureText = false,
      required TextEditingController controller,
      String? Function(String?)? validator}) {
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
        const SizedBox(height: 5),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.primary),
            ),
            border: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.primary),
            ),
          ),
          validator: validator, // Añadir validación
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
