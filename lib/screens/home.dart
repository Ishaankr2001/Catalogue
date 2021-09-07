import 'package:catalogue/widgets/drawer.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalogue"),
      ),
      body: Center(
        child: Container(
          child: Text(
            'Hey There\n\nI am $age years old.',
          ),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
