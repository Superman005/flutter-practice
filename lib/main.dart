import 'package:flutter/material.dart';
import 'package:practice4/pages/cart_page.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:practice4/pages/home_pages.dart';
import 'package:practice4/pages/login_page.dart';

import 'package:practice4/utils/routes.dart';
import 'package:practice4/widgets/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: HomePage(),
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.cartRoute: (context) => CartPage(),
      },
    );
  }
}
