// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/controller_Login.dart';
import 'support.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var txtEmail = TextEditingController();
  var txtPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    txtEmail.text = '';
    txtPassword.text = '';
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Center(
                  child: Icon(
                    Icons.book_rounded,
                    color: Color.fromARGB(255, 32, 3, 70),
                    size: 80.0,
                  ),
                ),
              ),
              fieldText('Email', Icons.email, txtEmail),
              fieldText('Senha', Icons.lock, txtPassword, password: true),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    child: Text(
                      "Esqueceu a senha?",
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        color: Color.fromARGB(255, 32, 3, 70),
                      ),
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(
                            'Informe seu e-mail',
                            style: GoogleFonts.roboto(
                              fontSize: 20,
                              color: Color.fromARGB(255, 32, 3, 70),
                            ),
                          ),
                          titlePadding: EdgeInsets.all(10),
                          content: Container(
                            width: 350,
                            height: 80,
                            child: Column(
                              children: [
                                fieldText('E-mail', Icons.email, txtEmail),
                              ],
                            ),
                          ),
                          backgroundColor: Colors.blueGrey.shade50,
                          actionsPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          actions: [
                            TextButton(
                              style: TextButton.styleFrom(
                                minimumSize: Size(100, 40),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Cancelar',
                                style: GoogleFonts.roboto(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 32, 3, 70),
                                ),
                              ),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Color.fromARGB(255, 32, 3, 70),
                                minimumSize: Size(100, 40),
                              ),
                              onPressed: () async {
                                if (txtEmail.text.isNotEmpty) {
                                  LoginController()
                                      .forgotPassword(txtEmail.text);
                                  success(
                                      context, 'E-mail enviado com success.');
                                } else {
                                  error(context,
                                      'Informe o e-mail para recuperar a senha.');
                                }

                                Navigator.pop(context);
                              },
                              child: Text(
                                'Enviar',
                                style: GoogleFonts.roboto(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  LoginController()
                      .login(context, txtEmail.text, txtPassword.text);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 32, 3, 70),
                  minimumSize:
                      Size(MediaQuery.of(context).size.width * 0.9, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: Text(
                  'Entrar',
                  style: GoogleFonts.roboto(fontSize: 20),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    child: Text(
                      "Novo usuário?",
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        color: Color.fromARGB(255, 32, 3, 70),
                      ),
                    ),
                    onPressed: () =>
                        {Navigator.pushNamed(context, 'create_account')},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
