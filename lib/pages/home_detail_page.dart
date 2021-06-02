import 'package:flutter/material.dart';
import 'package:practice4/models/catalog.dart';
import 'package:practice4/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  //catalog import garya kinaki yesko details hamilaii chaiiyo
  final Item catalog;

  const HomeDetailPage({Key key, @required this.catalog})
      : assert(catalog != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    //catalog ley dekhako image deukhauna laii thulo ma
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(12),
          child: ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            buttonPadding: EdgeInsets.zero,
            children: [
              Text(
                "\$${catalog.price}".toString(),
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.red[800],
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
                  "Add To Cart",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ).wh(120, 50)
            ],
          ).py24(),
        ),
      ),
      body: SafeArea(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Hero(
              tag: Key(
                catalog.id.toString(),
              ),
              child: Image.asset(catalog.image),
            ).h32(context),
          ),
          Expanded(
            child: VxArc(
              height: 30,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                color: Colors.white,
                width: context.screenWidth,
                child: Column(
                  children: [
                    Text(
                      catalog.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: MyTheme.darkBluishColor,
                        fontSize: 40,
                      ),
                    ),
                    Text(
                      catalog.desc,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    "  dolore. Elit id fugiat mollit anim mollit irure eiusmod. Laborum non Lorem ipsum eiusmod sit mollit exercitation enim ex sunt commodo. Non non aliqua fugiat esse ad id. Do nisi quis nulla fugiat ut amet eu elit sit quis. Eiusmod non velit do officia."
                        .text
                        .textStyle(context.captionStyle)
                        .make()
                        .p16()
                  ],
                ).py64(),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
