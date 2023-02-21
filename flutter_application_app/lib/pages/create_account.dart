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
  var txtName = TextEditingController();
  var txtEmail = TextEditingController();
  var txtPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade50,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(0, 40, 0, 40),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Text(
                        'Criar conta',
                        style: GoogleFonts.roboto(
                          fontSize: 30,
                          color: Color.fromARGB(255, 32, 3, 70),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              fieldText('Nome'  , Icons.person, txtName),
              fieldText('E-mail', Icons.email, txtEmail),
              fieldText('Senha' , Icons.lock, txtPassword, password: true),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  LoginController().createAccount(
                      context, txtName.text, txtEmail.text, txtPassword.text);
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
                  'Salvar',
                  style: GoogleFonts.roboto(fontSize: 22),
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
                        fontSize: 16,
                        color: Color.fromARGB(255, 32, 3, 70),
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
