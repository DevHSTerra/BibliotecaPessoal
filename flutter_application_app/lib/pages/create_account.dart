// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/controller_Login.dart';
import 'support.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  var txtNome = TextEditingController();
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Cores.corDeFundo,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Text(
                        'Criar conta',
                        style: GoogleFonts.roboto(
                          fontSize: 25,
                          color: Cores.corPrincipal,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              campoTexto('Nome', Icons.person, txtNome),
              campoTexto('E-mail', Icons.email, txtEmail),
              campoTexto('Senha', Icons.lock, txtSenha, senha: true),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  LoginController().criarConta(
                      context, txtNome.text, txtEmail.text, txtSenha.text);
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
                  'Salvar',
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
                      "Cancelar",
                      style: GoogleFonts.roboto(
                        fontSize: 14,
                        color: Cores.corPrincipal,
                      ),
                    ),
                    onPressed: () => {Navigator.pop(context)},
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
