import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pemantauan_ternak/pages/HomePage.dart';

const SERVER_IP = 'localhost:8000';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  final storage = GetStorage();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Log In"),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: <Widget>[
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(labelText: "Email"),
              ),
              TextField(
                controller: _passwordController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(labelText: "Password"),
              ),
              TextButton(
                onPressed: () async {
                  var email = _emailController.text;
                  var password = _passwordController.text;

                  var jwt = await attemptLogIn(email, password);

                  if (jwt != null) {
                    var token = jsonDecode(jwt)['token'];
                    storage.write('token', token);
                    Get.off(HomePage());
                  } else {
                    displayDialog(
                        context, "Error", "Terjadi kesalahan saat login");
                  }
                },
                child: Text("Log In"),
              ),
              ElevatedButton(onPressed: () {}, child: Text("Sign Up"))
            ],
          ),
        ),
      )),
    );
  }

  void displayDialog(BuildContext context, String title, String text) =>
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(title),
                content: Text(text),
              ));

  Future<String> attemptLogIn(String email, String password) async {
    var res = await http.post(Uri.http(SERVER_IP, "api/login"),
        body: {"email": email, "password": password});

    if (res.statusCode == 200) return res.body;
    return null;
  }
}
