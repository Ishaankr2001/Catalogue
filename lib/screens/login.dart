import 'package:catalogue/utils/routes.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String name = "";
  bool changebutton = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
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
                    decoration: InputDecoration(
                      hintText: "UserName",
                      labelText: "Enter User Name",
                    ),
                    onChanged: (value) {
                      name = value;
                      setState(() {});
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Password",
                      labelText: "Enter Password",
                    ),
                  ),
                  SizedBox(height: 40),
                  InkWell(
                    onTap: () async {
                      setState(() {
                        changebutton = true;
                      });
                      await Future.delayed(Duration(seconds: 1));
                      Navigator.pushNamed(context, MyRoutes.homeRoute);
                    },
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
                          : Text("LOGIN",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                              )),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius:
                            BorderRadius.circular(changebutton ? 55 : 8),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
