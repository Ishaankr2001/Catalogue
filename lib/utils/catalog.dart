class CatalogueModel {
  static final items = [
    Item(
      id: 1,
      name: "IPhone 12 Pro",
      desc: "Gold 128 GB",
      price: 999,
      color: "33305a",
      url:
          "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-12-pro-max-gold-hero?wid=940&hei=1112&fmt=png-alpha&.v=1604021660000",
    ),
    Item(
      id: 2,
      name: "IPhone 12 Pro",
      desc: "Graphite 128 GB",
      price: 999,
      color: "33305a",
      url:
          "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-12-pro-graphite-hero?wid=940&hei=1112&fmt=png-alpha&.v=1604021660000",
    )
  ];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String url;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.url});
}
