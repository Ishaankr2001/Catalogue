import 'package:catalogue/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

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
