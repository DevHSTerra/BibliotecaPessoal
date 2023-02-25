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
  var txtSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    txtEmail.text = '';
    txtSenha.text = '';
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 5),
                child: Center(
                  child: Icon(
                    Icons.book_sharp,
                    color: Cores.corPrincipal,
                    size: 75.0,
                  ),
                ),
              ),
              campoTexto('Email', Icons.email, txtEmail),
              campoTexto('Senha', Icons.lock, txtSenha, senha: true),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    child: Text(
                      "Esqueceu a senha?",
                      style: GoogleFonts.roboto(
                        fontSize: 14,
                        color: Cores.corPrincipal,
                      ),
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(
                            'Informe seu e-mail',
                            style: GoogleFonts.roboto(
                              fontSize: 16,
                              color: Cores.corPrincipal,
                            ),
                          ),
                          titlePadding: EdgeInsets.all(20),
                          content: Container(
                            width: 350,
                            height: 80,
                            child: Column(
                              children: [
                                campoTexto('E-mail', Icons.email, txtEmail),
                              ],
                            ),
                          ),
                          backgroundColor: Cores.corDeFundo,
                          actionsPadding: EdgeInsets.fromLTRB(0, 0, 20, 20),
                          actions: [
                            TextButton(
                              style: TextButton.styleFrom(
                                minimumSize: Size(100, 30),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Cancelar',
                                style: GoogleFonts.roboto(
                                  fontSize: 14,
                                  color: Cores.corDeFundo,
                                ),
                              ),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                backgroundColor: Cores.corPrincipal,
                                minimumSize: Size(100, 30),
                              ),
                              onPressed: () async {
                                if (txtEmail.text.isNotEmpty) {
                                  LoginController()
                                      .esqueceuSenha(txtEmail.text);
                                  sucesso(
                                      context, 'E-mail enviado com sucesso.');
                                } else {
                                  erro(context,
                                      'Informe o e-mail para recuperar a senha.');
                                }

                                Navigator.pop(context);
                              },
                              child: Text(
                                'Enviar',
                                style: GoogleFonts.roboto(
                                  fontSize: 14,
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
                      .login(context, txtEmail.text, txtSenha.text);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Cores.corPrincipal,
                  minimumSize:
                      Size(MediaQuery.of(context).size.width * 0.7, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: Text(
                  'Entrar',
                  style: GoogleFonts.roboto(fontSize: 16),
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
                        fontSize: 14,
                        color: Cores.corPrincipal,
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
