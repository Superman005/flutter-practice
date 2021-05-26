class CatalogModel {
  static final products = [
    Item(
        id: 1,
        name: "Andriod Phones",
        desc: "Latest generation technology",
        price: 999,
        color: "red",
        image: "assets/images/phone.png")
  ];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item({this.id, this.name, this.desc, this.price, this.color, this.image});
}
