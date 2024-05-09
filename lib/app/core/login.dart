import 'package:flutter/material.dart';
import 'package:gps_semovil/app/core/modules/database/firestore.dart';
import 'package:gps_semovil/user/models/user_model.dart';
import 'modules/authentication/authentication.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double maxFieldWidth = screenWidth > 600 ? 400 : screenWidth * 0.8;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/SEMOVIL.png',
                width: 200,
                height: 200,
              ),
              Container(
                constraints: BoxConstraints(maxWidth: maxFieldWidth),
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: userController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.orange[100],
                            hintText: 'Correo',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: passwordController,
                          obscureText: !_passwordVisible,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.orange[100],
                            hintText: 'Contraseña',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextButton(
                          onPressed: () async {
                            await Authentication.resetPassword(
                                userController.text);
                          },
                          child: const Text(
                            'He olvidado mi contraseña',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate() == false) {
                              return;
                            }
                            if (await Authentication.loginUser(
                                    userController.text,
                                    passwordController.text) ==
                                false) {
                              return;
                            }
                            UserModel userModel =
                                await getUser(userController.text);

                            Navigator.pushReplacementNamed(
                                context, '/user_homepage',
                                arguments: userModel);
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.green), // Background color
                            foregroundColor: MaterialStateProperty.all<Color>(
                                Colors.white), // Text color
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          child: const Text('Log in'),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/sign_up');
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.orange), // Background color
                            foregroundColor: MaterialStateProperty.all<Color>(
                                Colors.white), // Text color
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          child: const Text('Sign up'),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

void forgotPassword() {}
