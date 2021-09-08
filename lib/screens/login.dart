import 'package:catalogue/utils/routes.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String name = "";
  bool changebutton = false;
  final _text = TextEditingController();
  final _pwd = TextEditingController();
  bool _validatetxt = false;
  bool _validatepwd = false;

  moveToHome(BuildContext context) async {
    setState(() {
      changebutton = true;
      _text.text.isEmpty ? _validatetxt = true : _validatetxt = false;
      _pwd.text.isEmpty ? _validatepwd = true : _validatepwd = false;
    });
    if (_validatetxt == false && _validatepwd == false) {
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
    }
    setState(() {
      changebutton = false;
      _validatetxt = false;
      _validatepwd = false;
    });
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
                'assets/images/login.png',
                fit: BoxFit.cover,
                height: 350,
              ),
              SizedBox(height: 20),
              Text(
                "Welcome $name",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 50,
                ),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _text,
                      decoration: InputDecoration(
                        hintText: "User Name",
                        labelText: "Enter User Name",
                        errorText:
                            _validatetxt ? "Please enter User Name" : null,
                      ),
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      controller: _pwd,
                      decoration: InputDecoration(
                        hintText: "Password",
                        labelText: "Enter Password",
                        errorText: _validatepwd ? "Password Required" : null,
                      ),
                    ),
                    SizedBox(height: 40),
                    Material(
                      color: Colors.indigo,
                      borderRadius:
                          BorderRadius.circular(changebutton ? 55 : 8),
                      child: InkWell(
                        onTap: () => moveToHome(context),
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          height: 55,
                          width: changebutton ? 55 : 80,
                          alignment: Alignment.center,
                          child: changebutton
                              ? Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : Text(
                                  "LOGIN",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
