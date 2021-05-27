class CatalogModel {
  static List<Item> products = [
    Item(
        id: 1,
        name: "Andriod Phones",
        desc: "Latest generation technologys",
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

  //data map form ma aako xa so (Map) ani yesma key string xa so string natra dynamic huntheyo
  //factory use chaii kei var ma logic lagayera initilize garnaxa vane use hunxa

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map["id"],
      name: map["name"],
      desc: map["desc"], //yo wala part ma decode garya ho
      price: map["price"], //map bata class banako ya
      color: map["color"],
      image: map["image"],
    );
  }

  toMap() => {
        "id": id, //"id" key ho id value haldeko
        "name": name,
        "desc": desc,
        "price": price,
        "color": color,
        "image": image,
      };
}
