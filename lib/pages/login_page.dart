import 'package:flutter/material.dart';
import 'package:practice4/utils/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;

  final _formkey = GlobalKey<FormState>();

  //method banako aauta
  moveToHome(BuildContext content) async {
    if (_formkey.currentState.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              Image.asset(
                "assets/images/undraw_Mobile_application_mr4r.png",
                fit: BoxFit.cover,
                // height: 20,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Welcome $name",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                child: Form(
                  key: _formkey,
                  child: Column(children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "username",
                        hintText: "Enter username",
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Username not entered";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        hintText: "Enter password",
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Password not entered";
                        } else if (value.length < 6) {
                          return "Password length should be at least 6";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Material(
                      //ancestors dida tesko child vitra decoration hunuvayena
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(
                        changeButton ? 50 : 8,
                      ),
                      child: InkWell(
                        onTap: () => moveToHome(context),
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 350),
                          width: changeButton ? 50 : 130,
                          height: 50,
                          alignment: Alignment.center,
                          child: changeButton
                              ? Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : Text("Login",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  )),
                          // decoration: BoxDecoration(
                          //   color: Colors.deepPurple,
                          //   borderRadius: BorderRadius.circular(
                          //     changeButton ? 50 : 8,
                          //   ),
                          // ),
                        ),
                      ),
                    )

                    // ElevatedButton(
                    //   child: Text(
                    //     'Login',
                    //     style: TextStyle(fontSize: 25),
                    //   ),
                    //   style: TextButton.styleFrom(minimumSize: Size(130, 40)),
                    //   onPressed: () {
                    //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                    //   },
                    // ),
                  ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
