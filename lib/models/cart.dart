import 'package:practice4/models/catalog.dart';

class CartModel {
  //yesko aauta object create hos vanera aauta SINGLETON banako
  //internal ma j lekhdani vayo
  static final cartModel = CartModel._internal();

  //ani mathiko lagi constructor banako
  CartModel._internal();

  //factory ko through define garya ki jaba jaba CartModel() magxa
  //teti bela yo cartModel return garxa
  factory CartModel() => cartModel;

  //_ use garda private hunxa
  //catalog field
  CatalogModel _catalog;

  //Collection of Ids - store Ids of each item
  //final List<int>:final list of item junchaii interger ma xa
  final List<int> _itemIds = [];

  //Yo garera hamile bahira bata _catalog use garna sakxam
  // catalog get garne ko lagi yo method(catalog) use garne
  CatalogModel get catalog => _catalog;

  //catalog set garne ko lagi yo method(catalog) use garne
  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

  //Get items in the cart
  //jati pani itemids xa teslaii id sanga map garne
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  //yo mathiko list use garera total price nikalna laii

  //suruma 0 xa so total 0 hunxa(ie. initial value)
  //current k ho item ho so current.price vaneko item.price vayo
  //ani tespaxi total ma aauxa 0+price in a loop
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  //Add Item
  // void laii add method deko jaslaii item dixam
  void add(Item item) {
    _itemIds.add(item.id); //_itemIds ko vita item.id add garya
  }

  //Remove Item

  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
