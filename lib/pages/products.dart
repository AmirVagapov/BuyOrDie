import 'package:buy_or_die/model/product.dart';
import 'package:buy_or_die/widgets/products/product_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../res/strings.dart' as strings;
import '../adaptive_elements.dart/appbar_elevation.dart';

class ProductsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProductsPageState();
  }
}

class _ProductsPageState extends State<ProductsPage> {
  final productsList = [
    Product(name: "Food", count: 2),
    Product(name: "Food1", count: 43),
    Product(name: "Food2", count: 432),
    Product(name: "Food3", count: 1)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(strings.appName),
        elevation: getElevation(context),
      ),
      body: RefreshIndicator(
        child: _buildProductsList(),
        onRefresh: _updateList,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }

  Widget _buildProductsList() {
    Widget content;
    if (productsList.isEmpty) {
      content = Center(
        child: Text(strings.emptyList),
      );
    } else {
      content = ListView.builder(
        itemBuilder: (context, count) {
          return ProductItemWidget(
              productsList[count], count, _deleteItem);
        },
        itemCount: productsList.length,
      );
    }
    return content;
  }

  void _deleteItem(int count) {
    setState(() {
      productsList.removeAt(count);
    });
  }

  Future<Null>  _updateList() async {
    setState(() {
      _buildProductsList();
    });
  }
}
