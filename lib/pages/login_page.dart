import 'package:flutter/material.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = "";
  String password = "";
  bool isLoginSuccess = false;
  bool isShown = false;

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 3), () {});
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(
          username: username,
        ),
      ),
    );
  }

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
          prefixIcon: Icon(
            Icons.person_outline,
            color: Colors.purple,
          ),
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
        onChanged: (value) {
          setState(() {
            password = value;
          });
        },
        obscureText: isShown ? false : true,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock_outline, color: Colors.purple),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                isShown = !isShown;
              });
            },
            icon: Icon(
              isShown ? Icons.visibility : Icons.visibility_off,
              color: Colors.purple,
            ),
          ),
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
        child:
            const Text("Login Button", style: TextStyle(color: Colors.white)),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purple,
        ),
        onPressed: () {
          if (username == "Haykal Aliando Usmansyah" && password == "1234") {
            _navigateToHome();
            print("isLoginSuccess : $isLoginSuccess");

            SnackBar snackBar = SnackBar(
              content: Text('Selamat Datang! $username'),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          } else {
            print("isLoginSuccess : $isLoginSuccess");

            SnackBar snackBar = SnackBar(
              content: Text('Login Gagal'),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
      ),
    );
  }
}
