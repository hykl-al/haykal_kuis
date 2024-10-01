import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = "";
  String password = "";
  bool isLoginSuccess = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Image.asset(
              'assets/logo.png',
              height: 100,
              width: 100,
            ),
            const Text(
              "Selamat Datang Kembali",
              style: TextStyle(
                color: Colors.purple,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Image.asset(
              'assets/illustration.png',
              height: 300,
              width: 300,
            ),
            _usernameField(),
            _passwordField(),
            _LoginButton(context), // Added the login button here
          ],
        ),
      ),
    );
  }

  Widget _usernameField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        enabled: true,
        onChanged: (value) {
          setState(() {
            username = value;
          });
        },
        decoration: InputDecoration(
          hintText: 'Masukkan Username',
          contentPadding: const EdgeInsets.all(8.0),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(100)),
            borderSide: BorderSide(color: Colors.purple),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(100)),
            borderSide: BorderSide(color: Colors.purple),
          ),
        ),
      ),
    );
  }

  Widget _passwordField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        enabled: true,
        obscureText: true, // Ensures password is obscured
        onChanged: (value) {
          setState(() {
            password = value;
          });
        },
        decoration: InputDecoration(
          hintText: 'Masukkan Kata sandi',
          contentPadding: const EdgeInsets.all(8.0),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(100)),
            borderSide: BorderSide(color: Colors.purple),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(100)),
            borderSide: BorderSide(color: Colors.purple),
          ),
        ),
      ),
    );
  }

  Widget _LoginButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () {
          String text = "";
          if (username == "Haykal Aliando Usmansyah" && password == "1234") {
            setState(() {
              text = "Login Berhasil";
              isLoginSuccess = true;
            });
          } else {
            setState(() {
              text = "Login Gagal";
              isLoginSuccess = false;
            });
          }
          print("isLoginSuccess : $isLoginSuccess");

          SnackBar snackBar = SnackBar(
            content: Text('Selamat Datang! $username'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Text('Login'),
      ),
    );
  }
}
