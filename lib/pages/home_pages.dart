import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practice4/models/catalog.dart';
import 'package:practice4/widgets/drawer.dart';
import 'package:practice4/widgets/item_widget.dart';
import 'dart:convert'; //dart convert le json file laii decode ra encode garna dinxa

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = 'coding';

  @override
  void initState() {
    super.initState();
    loadData(); //method banako
  }

  //loaddata ko definition deko
  loadData() async {
    //await kinaki rootbundle le future return garxa jasma time lagna sakxa file load huna
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productData = decodedData["products"];
    //List<Item> item ko list banako
    //from(k bata liyera banaune ho list)
    //map<item>kinaki hamile item ko mapper banako ho
    //ya List<Item> ko satta CatalogModel.product use gardeko sajilo ko laii
    CatalogModel.products =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final dummyList = List.generate(20, (index) => CatalogModel.products[0]);
    return Scaffold(
      appBar: AppBar(
          title: Center(
        child: Text(
          "Catalog App",
        ),
      )),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 30, 40),
        child: ListView.builder(
          itemCount: CatalogModel.products.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              item: CatalogModel.products[index],
            );
          },
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
