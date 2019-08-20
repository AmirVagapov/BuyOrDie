import 'package:buy_or_die/pages/products.dart';
import 'package:flutter/material.dart';
import 'res/strings.dart' as strings;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: strings.appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductsPage(),
    );
  }
}
