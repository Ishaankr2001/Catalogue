import 'dart:convert';

import 'package:catalogue/utils/catalog.dart';
import 'package:catalogue/widgets/drawer.dart';
import 'package:catalogue/widgets/item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int age = 20;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    var cataloguejson =
        await rootBundle.loadString("assets/files/catalogue.json");
    var decode = jsonDecode(cataloguejson);
    print(decode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalogue"),
      ),
      body: ListView.builder(
        itemCount: CatalogueModel.items.length,
        itemBuilder: (context, index) {
          return ItemWidget(
            item: CatalogueModel.items[index],
          );
        },
      ),
      drawer: MyDrawer(),
    );
  }
}
