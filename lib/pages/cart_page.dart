import 'package:flutter/material.dart';
import 'package:practice4/widgets/themes.dart';

import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: "Cart".text.make(),
      ),
      body: Column(
        children: [
          Expanded(
            child: CartList().p32(),
          ),
          Divider(),
          CartTotal(),
        ],
      ),
    );
  }
}

class CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$999".text.xl5.color(context.theme.accentColor).make(),
          WidthBox(30),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Buying Not Supported Yet"),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.deepPurple, // background
              // onPrimary: Colors.white, // foreground
            ),
            child: Text(
              "Buy",
              // style: TextStyle(color: Colors.white),
            ),
          ).w32(context)
        ],
      ),
    );
  }
}

class CartList extends StatefulWidget {
  @override
  _CartListState createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(Icons.remove_circle_outline),
        ),
        title: Text("Item 1"),
      ),
    );
  }
}
