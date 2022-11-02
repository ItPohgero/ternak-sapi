import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pemantauan_ternak/app/core/values/colors.dart';
import 'package:pemantauan_ternak/app/modules/login/login_controller.dart';

class LoginPage extends StatelessWidget {
  final String _title =
      "ReMax App"; //"Aplikasi Pemantauan Ternak\nBBPTUHPT Baturraden";

  final _loginForm = GlobalKey<FormState>();

  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        body: GetBuilder<LoginController>(
      builder: (_) => SafeArea(
          child: Obx(() => (_.isLoading.value)
              ? Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Padding(
                  padding: EdgeInsets.all(16),
                  child: ListView(
                    children: <Widget>[
                      SizedBox(
                        height: size.height / 15,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Image(
                          image: AssetImage("assets/images/logo.png"),
                          width: size.width / 2,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          _title,
                          style: TextStyle(
                              fontSize: 27, fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Form(
                          key: _loginForm,
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                  controller: _emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                      labelText: "Email",
                                      border: OutlineInputBorder()),
                                  validator: (val) {
                                    if (val == null || val.isEmpty) {
                                      return "Email harus diisi..";
                                    } else if (!val.isEmail) {
                                      return "Email tidak valid..";
                                    } else {
                                      return null;
                                    }
                                  }),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: _passwordController,
                                keyboardType: TextInputType.text,
                                obscureText: true,
                                maxLines: 1,
                                decoration: InputDecoration(
                                    labelText: "Password",
                                    border: OutlineInputBorder()),
                                validator: (val) => (val == null || val.isEmpty)
                                    ? "Password harus diisi.."
                                    : null,
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Material(
                                color: ColorsPallete.PRIMARY,
                                borderRadius: BorderRadius.circular(10),
                                child: InkWell(
                                  customBorder: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Container(
                                    width: size.width,
                                    height: 50,
                                    child: Center(
                                      child: Text(
                                        "Login",
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    if (_loginForm.currentState.validate()) {
                                      _.login(_emailController.text.toString(),
                                          _passwordController.text.toString());
                                    }
                                  },
                                ),
                              )
                            ],
                          ))
                    ],
                  )))),
    ));
  }
}
