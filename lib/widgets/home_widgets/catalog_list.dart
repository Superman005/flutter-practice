import 'package:flutter/material.dart';
import 'package:practice4/models/cart.dart';
import 'package:practice4/models/catalog.dart';
import 'package:practice4/pages/home_detail_page.dart';
import 'package:practice4/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import 'catalog_image.dart';

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
          //or yesko satta
          // final catalog = CatalogModel.getByPosition(index);
          //yo mathi ko ma hamile uta static hatako ho item ko aagadi ani yo chaldaiina
          return InkWell(
            //Day 18 video ko time:10:35
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeDetailPage(
                  //ya mathi bata position ko basi ma aayo catalog bata
                  catalog: catalog,

                  //mathi yesko satta maile pixel 5 aauxa onTap
                  // catalog: CatalogModel.getById(2),
                ),
              ),
            ),
            child: CatalogItem(catalog: catalog),
          );
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
        Hero(
          tag: Key(catalog.id.toString()),
          child: CatalogImage(
            image: catalog.image,
          ),
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
                    _AddToCart(catalog: catalog)
                  ],
                ),
              )
            ],
          ),
        )
      ]),
    ).color(context.cardColor).rounded.square(120).make().py16();
  }
}

class _AddToCart extends StatefulWidget {
  final Item catalog; //mathibata layko catalog
  const _AddToCart({
    Key key,
    this.catalog,
  }) : super(key: key);

  @override
  __AddToCartState createState() => __AddToCartState();
}

class __AddToCartState extends State<_AddToCart> {
  bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        isAdded = isAdded.toggle();
        final _catalog = CatalogModel();
        final _cart = CartModel();
        _cart.catalog = _catalog;
        _cart.add(widget.catalog); // cart ko add vanne ma catalog halya
        //catalog model ma ta dheraii item xa kun add garne explain in day 24 6:00
        setState(() {});
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            MyTheme.darkBluishColor,
          ),
          shape: MaterialStateProperty.all(StadiumBorder())),
      child: isAdded
          ? Icon(Icons.done)
          : Text(
              "Add",
              style: TextStyle(
                fontSize: 12,
              ),
            ),
    );
  }
}
