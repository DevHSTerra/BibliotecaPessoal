// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/controller_Login.dart';
import 'list_books.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var corPrincial = Color.fromARGB(255, 35, 2, 56);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: corPrincial,
          toolbarHeight: 70,
          title: Row(children: [
            Expanded(
              child: Text(
                'Shared Library',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ])),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.fromLTRB(15, 15, 15, 60),
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.account_circle),
                FutureBuilder<String>(
                  future: LoginController().retornarUsuarioLogado(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      if (snapshot.hasError) {
                        return const Text('Error');
                      } else if (snapshot.hasData) {
                        return Text(
                          snapshot.data.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.roboto(
                            fontSize: 16,
                          ),
                        );
                      } else {
                        return const Text('Empty data');
                      }
                    } else {
                      return Text('State: ${snapshot.connectionState}');
                    }
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListTile(
                leading: Icon(Icons.logout),
                title: Text("Logout"),
                onTap: () {
                  LoginController().logout();
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    'login',
                    (Route<dynamic> route) => false,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListTile(
                  leading: Icon(Icons.help_sharp),
                  title: Text("Sobre Nós"),
                  onTap: () {
                    Navigator.pushNamed(context, 'about_us');
                  }),
            ),
          ],
        ),
      ),
      body: ListBooks(),
    );
  }
}
