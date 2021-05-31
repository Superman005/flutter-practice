import 'dart:convert'; //dart convert le json file laii decode ra encode garna dinxa

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:practice4/models/catalog.dart';
import 'package:practice4/widgets/themes.dart';
// import 'package:practice4/widgets/drawer.dart';
// import 'package:practice4/widgets/item_widget.dart';
import 'package:velocity_x/velocity_x.dart';

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
      backgroundColor: MyTheme.creamColor,
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
                Center(
                  child: CircularProgressIndicator(),
                )
            ],
          ),
        ),
      ),
    );
  }
}

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Catalog App",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 40,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          "Trending products",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      height: MediaQuery.of(context).size.height * 0.77,
      child: ListView.builder(
        itemCount: CatalogModel.products.length,
        itemBuilder: (context, index) {
          final catalog = CatalogModel.products[index];
          return CatalogItem(catalog: catalog);
        },
      ),
    );
  }
}

class CatalogItem extends StatelessWidget {
  //item chaiiyo jasko name catalog ho ani yesko constructor banako

  final Item catalog;

  const CatalogItem({Key key, @required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Container(
    // height: MediaQuery.of(context).size.height * 0.7,
    // width: MediaQuery.of(context).size.width * 0.7,
    // color: Colors.green,
    //     child: Row(
    //   children: [
    //     Image.asset(
    //       catalog.image,
    //       height: 122,
    //     )
    //   ],
    // ));
    return VxBox(
      child: Row(children: [
        CatalogImage(
          image: catalog.image,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                catalog.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: MyTheme.darkBluishColor,
                ),
              ),
              Text(
                catalog.desc,
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 8),
                child: ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
                  children: [
                    Text(
                      "\$${catalog.price}".toString(),
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            MyTheme.darkBluishColor,
                          ),
                          shape: MaterialStateProperty.all(StadiumBorder())),
                      child: Text(
                        "Buy",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ]),
    ).white.square(120).make().py16();
  }
}

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({Key key, @required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
    ).box.rounded.p8.color(MyTheme.creamColor).make().p16().w32(context);
  }
}
