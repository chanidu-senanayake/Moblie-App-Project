import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String username = "admin";
  String password = "1234";

  void _login() {
    String enteredUsername = usernameController.text.trim();
    String enteredPassword = passwordController.text.trim();

    if (enteredUsername.isEmpty || enteredPassword.isEmpty) {
      _showDialog("Error", "Please enter both username and password.");
      return;
    }

    if (enteredUsername == username && enteredPassword == password) {
      // Navigate to the next screen or perform any action upon successful login
      print("Login successful!");
      Navigator.pushNamed(context, '/stores');
    } else {
      // Show error message
      _showDialog("Error", "Username or password is incorrect.");
    }
  }

  void _showDialog(String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              Image.asset(
                "assets/login1.jpg",
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.5),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                      ),
                    ),
                    width: 500,
                    height: 150,
                    child: const Center(
                      child: Text(
                        "OTO VIN ENTERPRISES",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 50,
                          fontFamily: 'Qetod',
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        labelText: "Username",
                        hintText: 'Enter the username',
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.7),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: "Password",
                        hintText: 'Enter the password',
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.7),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      obscureText: true,
                    ),
                  ),
                  Container(
                    height: 200,
                  ),
                  Container(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        minimumSize:
                            MaterialStateProperty.all(const Size(200.0, 50.0)),
                        backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 2, 99, 178),
                        ),
                      ),
                      onPressed: _login,
                      child: const Text(
                        "Login ->",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                  ),
                  Container(
                    child: const Text(
                      "MD :- Mr.Mahinda Senanayake",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
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
