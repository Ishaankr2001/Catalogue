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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    var cataloguejson =
        await rootBundle.loadString("assets/files/catalogue.json");
    var decode = jsonDecode(cataloguejson);
    var productdata = decode["products"];
    CatalogueModel.items =
        List.from(productdata).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalogue"),
      ),
      body: (CatalogueModel.items != null)
          ? ListView.builder(
              itemCount: CatalogueModel.items!.length,
              itemBuilder: (context, index) {
                return ItemWidget(
                  item: CatalogueModel.items![index],
                );
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
      drawer: MyDrawer(),
    );
  }
}
