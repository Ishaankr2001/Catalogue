import 'dart:convert';
import 'package:catalogue/widgets/home_widgets/catalogue_header.dart';
import 'package:catalogue/widgets/home_widgets/catalogue_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:catalogue/utils/catalog.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
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
        backgroundColor: Colors.white,
        body: SafeArea(
          bottom: false,
          child: Container(
            padding: Vx.m16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogueHeader(),
                if (CatalogueModel.items != null)
                  CatalogueList().py12().expand()
                else
                  CircularProgressIndicator().centered().expand(),
              ],
            ),
          ),
        ));
  }
}
