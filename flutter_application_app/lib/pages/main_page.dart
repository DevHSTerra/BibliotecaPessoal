// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/controller_Login.dart';
import '../pages/support.dart';
import 'list_books.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Cores.corPrincipal,
        toolbarHeight: 70,
        centerTitle: true,
        title: Text(
          'Shared Library',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.fromLTRB(15, 15, 15, 60),
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.account_circle,
                  color: Colors.black,
                ),
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
                      return Text(
                        'State: ${snapshot.connectionState}',
                        selectionColor: Colors.black,
                      );
                    }
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Colors.black,
                ),
                title: Text(
                  "Logout",
                  selectionColor: Colors.black,
                ),
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
                  leading: Icon(
                    Icons.help_sharp,
                    color: Colors.black,
                  ),
                  title: Text(
                    "Sobre o app",
                    selectionColor: Colors.black,
                  ),
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