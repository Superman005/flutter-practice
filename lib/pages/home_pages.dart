import 'dart:convert'; //dart convert le json file laii decode ra encode garna dinxa

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:practice4/models/catalog.dart';
import 'package:practice4/widgets/drawer.dart';
import 'package:practice4/widgets/item_widget.dart';

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
    await Future.delayed(Duration(seconds: 2));
    //await kinaki rootbundle le future return garxa jasma time lagna sakxa file load huna
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productData = decodedData["products"];
    //List<Item> :item ko list banako
    //from(k bata liyera banaune ho list)
    //map<item> :kinaki hamile item ko mapper banako ho
    //ya List<Item> ko satta CatalogModel.product use gardeko sajilo ko laii
    CatalogModel.products =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {}); //setState le build method feri call garxa
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
        child:
            (CatalogModel.products != null && CatalogModel.products.isNotEmpty)
                // ? ListView.builder(
                //     itemCount: CatalogModel.products.length,
                //     itemBuilder: (context, index) => ItemWidget(
                //       item: CatalogModel.products[index],
                //     ),
                //   )
                //ListView.builder ko satta GridView use garya
                ? GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16),
                    itemBuilder: (context, index) {
                      final item = CatalogModel.products[index];
                      return Card(
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: GridTile(
                            header: Container(
                              child: Text(
                                item.name,
                                style: TextStyle(color: Colors.white),
                              ),
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.deepPurple,
                              ),
                            ),
                            child: Image.asset(
                              item.image,
                            ),
                            footer: Container(
                              child: Text(
                                item.price.toString(),
                                style: TextStyle(color: Colors.white),
                              ),
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.blueGrey,
                              ),
                            ),
                          ));
                    },
                    itemCount: CatalogModel.products.length,
                  )
                : Center(
                    child: CircularProgressIndicator(
                      color: Colors.deepPurple,
                    ),
                  ),
      ),
      drawer: MyDrawer(),
    );
  }
}
