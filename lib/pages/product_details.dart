import 'package:buy_or_die/model/product.dart';
import 'package:flutter/material.dart';
import '../res/strings.dart' as strings;
import '../res/dimens.dart' as dimens;

class ProductDetailsPage extends StatefulWidget {
  final Product product;

  ProductDetailsPage(this.product);

  @override
  State<StatefulWidget> createState() {
    return _ProductDetailsPageState();
  }
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  bool _isEditMode = false;
  final _productNameTextController = TextEditingController();
  final _productCountTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.product.name),
          actions: _isEditMode
              ? <Widget>[
                  IconButton(
                    icon: Icon(Icons.done),
                    onPressed: () {},
                  )
                ]
              : null,
        ),
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: dimens.decimalPadding),
            child: Column(
              children: [
                _buildProductNameTextForm(context),
                _buildProductCountTextForm(context)
              ],
            )));
  }

  Widget _buildProductNameTextForm(BuildContext context) {
    if (widget.product != null) {
      _productNameTextController.text = widget.product.name;
    }
    return TextFormField(
      controller: _productNameTextController,
      decoration: _getDecoration(context, strings.productName),
      validator: (value) {
        if(value.isEmpty) {
          return strings.nameRequired;
        }
      },
      onSaved: (value) {},
    );
  }

  Widget _buildProductCountTextForm(BuildContext context) {
    if (widget.product != null) {
      _productCountTextController.text = widget.product.count.toString();
    }
    return TextFormField(
        controller: _productCountTextController,
        decoration: _getDecoration(context, strings.productCount),
        validator: (value) {
          if(value.isEmpty) {
            return strings.countRequired;
          }
        },
        onSaved: (value) {});
  }

  InputDecoration _getDecoration(BuildContext context, String label) {
    return InputDecoration(labelText: label);
  }
}
