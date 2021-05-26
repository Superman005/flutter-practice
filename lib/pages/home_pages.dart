import 'package:flutter/material.dart';
import 'package:practice4/models/catalog.dart';
import 'package:practice4/widgets/drawer.dart';
import 'package:practice4/widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  final int days = 30;
  final String name = 'coding';
  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(20, (index) => CatalogModel.products[0]);
    return Scaffold(
      appBar: AppBar(
          title: Center(
        child: Text(
          "Catalog App",
        ),
      )),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: dummyList.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              item: dummyList[index],
            );
          },
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
