import 'package:catalogue/screens/details.dart';
import 'package:catalogue/utils/catalog.dart';
import 'package:catalogue/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogueList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final catalog = CatalogueModel.items![index];
        return InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetails(product: catalog),
              )),
          child: CatalogueItem(
            catalogue: catalog,
          ),
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
        Hero(
          tag: Key(catalogue.id.toString()),
          child: CatalogueImage(image: catalogue.image),
        ),
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