import 'package:catalogue/utils/catalog.dart';
import 'package:catalogue/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductDetails extends StatelessWidget {
  final Item product;

  const ProductDetails({Key? key, required this.product})
      : assert(product != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        buttonPadding: EdgeInsets.all(10),
        children: [
          "\$${product.price}".text.xl2.semiBold.red800.make(),
          ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(StadiumBorder())),
                  child: "BUY".text.xl.bold.make())
              .wh(100, 50)
        ],
      ).p16(),
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(product.id.toString()),
              child: Image.network(product.image),
            ).py12().h40(context),
            Expanded(
              child: VxArc(
                height: 30,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  width: context.screenWidth,
                  color: Colors.white,
                  child: Column(
                    children: [
                      product.name.text.xl3.bold
                          .color(MyTheme.primarytheme)
                          .make(),
                      product.desc.text.lg.make(),
                      "Dual Sim, 3G, 4G, VoLTE, Wi-Fi, NFC, IR Blaster, \nIP68 dust/water resistant (up to 1.5m for 30 mins), \nStylus support,\nMemory Card Supported upto 256 GB, \nFast Charging"
                          .text
                          .make()
                          .p16()
                    ],
                  ).py32(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
