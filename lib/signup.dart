import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:my_app/main.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>(); // Llave para manejar el Form
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
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
                      child: const Text(
                        "Registrarse",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 20),
                    FadeInUp(
                      duration: const Duration(milliseconds: 1200),
                      child: Text(
                        "Crea una cuenta nueva",
                        style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
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
                  child: Container(
                    padding: const EdgeInsets.only(top: 3, left: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: const Border(
                        bottom: BorderSide(color: Colors.black),
                        top: BorderSide(color: Colors.black),
                        left: BorderSide(color: Colors.black),
                        right: BorderSide(color: Colors.black),
                      ),
                    ),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () {
                        // Verificar si el formulario es válido
                        if (_formKey.currentState!.validate()) {
                          // Si es válido, navega a la página de inicio con los datos
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(
                                username: emailController.text,
                                password: passwordController.text,
                              ),
                            ),
                          );
                        }
                      },
                      color: Colors.greenAccent,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Text(
                        "Registrarse",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                    ),
                  ),
                ),
                FadeInUp(
                  duration: const Duration(milliseconds: 1600),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Already have an account?"),
                      Text(
                        " Login",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
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
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        const SizedBox(height: 5),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
          ),
          validator: validator, // Añadir validación
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
