import 'dart:convert'; //dart convert le json file laii decode ra encode garna dinxa

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:practice4/models/catalog.dart';
import 'package:practice4/utils/routes.dart';
import 'package:practice4/widgets/home_widgets/catalog_header.dart';
import 'package:practice4/widgets/home_widgets/catalog_list.dart';
import 'package:practice4/widgets/themes.dart';

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
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
        backgroundColor: MyTheme.lightBluishColor,
        child: Icon(CupertinoIcons.cart),
      ),
      //cardColor laii lyako
      backgroundColor: Theme.of(context).canvasColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          // color: Colors.grey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              //items null nahos vanera ra empty ni nahos vanera
              if (CatalogModel.products != null &&
                  CatalogModel.products.isNotEmpty)
                CatalogList()
              else
                Expanded(
                  child: Center(child: CircularProgressIndicator()),
                )
            ],
          ),
        ),
      ),
    );
  }
}
