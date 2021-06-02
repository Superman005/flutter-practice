import 'package:flutter/material.dart';
import 'package:practice4/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

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