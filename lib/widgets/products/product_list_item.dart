import 'package:buy_or_die/model/product.dart';
import 'package:buy_or_die/pages/product_details.dart';
import 'package:buy_or_die/widgets/ui.dart/alert_dialog.dart';
import 'package:flutter/material.dart';
import '../../res/dimens.dart' as dimens;
import '../../res/strings.dart' as strings;

class ProductItemWidget extends StatelessWidget {
  final Product product;
  final int index;
  final Function deleteItem;

  ProductItemWidget(this.product, this.index, this.deleteItem);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      confirmDismiss: (direction) async {
        return _showConfirmationDialog(context);
      },
      key: Key(product.name),
      child: ListTile(
        title: Text(product.name),
        trailing: Text(product.count.toString()),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ProductDetailsPage(product);
          }));
        },
      ),
      background: Container(color: Theme.of(context).accentColor),
      secondaryBackground: Container(
        color: Colors.red,
        child: ListTile(
          trailing: Icon(
            Icons.delete,
            color: Colors.black,
          ),
        ),
      ),
      direction: DismissDirection.endToStart,
    );
  }

  Future<bool> _showConfirmationDialog(BuildContext context) async {
    return CustomAlertDialog(
        title: product.name,
        firstBtnText: strings.dialogCancel,
        secondBtnText: strings.dialogDelete,
        cancelAction: () {
          Navigator.pop(context);
        },
        confirmAction: () {
          deleteItem(index);
          Navigator.pop(context);
        }).show(context);
  }
}
