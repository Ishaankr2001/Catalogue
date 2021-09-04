import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        children: [
          Image.asset(
            'assets/images/login.png',
            fit: BoxFit.cover,
          ),
          SizedBox(height: 20),
          Text(
            "Welcome",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 50),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "UserName",
                    labelText: "Enter User Name",
                  ),
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password",
                    labelText: "Enter Password",
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  child: Text("LOGIN"),
                  onPressed: () {},
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
