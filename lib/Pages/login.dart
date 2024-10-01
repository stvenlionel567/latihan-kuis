// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kuis_prak/Pages/home.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String username = '';
  String password = '';
  bool _obscureText = true;

  navigateToHome() async {
    await Future.delayed(Duration(microseconds: 500), () {});
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Beranda(
                  username: username,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromARGB(255, 8, 25, 34),
      body: Column(
        children: [
          SizedBox(
            height: 250,
          ),
          Text(
            "Login",
            style: GoogleFonts.poppins(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Log in untuk mengakses fitur",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          usernameField(),
          passwordField(),
          loginButton()
        ],
      ),
    );
  }

  Widget usernameField() {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        child: TextFormField(
            enabled: true,
            onChanged: (value) {
              username = value;
            },
            decoration: InputDecoration(
              labelText: 'Username',
              hintText: 'Bagaimana kami memanggil anda?',
              icon: Icon(Icons.account_circle),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(color: Colors.white, width: 2.0)),
            ),
            style: GoogleFonts.poppins(color: Colors.white, fontSize: 12)),
      ),
    );
  }

  Widget passwordField() {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        child: TextFormField(
            enabled: true,
            obscureText: true,
            onChanged: (value) {
              password = value;
            },
            decoration: InputDecoration(
              labelText: 'Password',
              hintText: 'Masukan Password Anda',
              icon: Icon(Icons.lock),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(color: Colors.white, width: 1.0)),
            ),
            style: GoogleFonts.poppins(color: Colors.white, fontSize: 12)),
      ),
    );
  }

  Widget loginButton() {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: ElevatedButton(
          onPressed: () {
            if (username == 'lilionel' && password == 'lili') {
              setState(() {
                navigateToHome();
                SnackbarSuccess(context);
              });
            } else {
              SnackbarFailure(context);
            }
          },
          child: Text("Login"),
        ));
  }
}

void SnackbarSuccess(BuildContext context) {
  final snackBar = SnackBar(
    content: AwesomeSnackbarContent(
      title: 'Success',
      message: 'Your action was successful!',
      contentType: ContentType.success,
    ),
    duration: Duration(seconds: 5),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void SnackbarFailure(BuildContext context) {
  final snackBar = SnackBar(
    content: AwesomeSnackbarContent(
      title: 'Oh No!',
      titleTextStyle:
          GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.bold),
      message: 'Cek kembali username atau password anda',
      contentType: ContentType.failure,
    ),
    duration: Duration(seconds: 3),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
