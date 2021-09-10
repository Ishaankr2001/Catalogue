import 'dart:convert';
import 'package:catalogue/utils/catalog.dart';
import 'package:catalogue/widgets/drawer.dart';
import 'package:catalogue/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

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
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogueHeader(),
                if (CatalogueModel.items != null)
                  CatalogueList().expand()
                else
                  Center(
                    child: CircularProgressIndicator(),
                  )
              ],
            ),
          ),
        ));
  }
}

class CatalogueHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          "Catalogue".text.xl5.bold.color(MyTheme.primarytheme).make(),
          "Trending Products".text.xl.color(MyTheme.primarytheme).make(),
        ],
      ),
    );
  }
}

class CatalogueList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final catalog = CatalogueModel.items![index];
        return CatalogueItem(
          catalogue: catalog,
        );
      },
      itemCount: CatalogueModel.items!.length,
    );
  }
}

class CatalogueItem extends StatelessWidget {
  final Item catalogue;

  const CatalogueItem({Key? key, required this.catalogue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        CatalogueImage(image: catalogue.image),
        Expanded(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              catalogue.name.text.xl2.bold.color(MyTheme.primarytheme).make(),
              catalogue.desc.text.make(),
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.all(10),
                children: [
                  "\$${catalogue.price}".text.lg.make(),
                  ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(StadiumBorder())),
                      child: "BUY".text.make())
                ],
              )
            ]))
      ],
    )).rounded.square(200).make().py12();
  }
}

class CatalogueImage extends StatelessWidget {
  final String image;

  const CatalogueImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(image).box.py12.white.rounded.make().wHalf(context);
  }
}
