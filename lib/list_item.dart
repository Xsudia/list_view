import 'package:flutter/material.dart';
import 'package:list_view/list_item_page.dart';

class ListItem extends StatelessWidget {
  final int obj;
  final VoidCallback callback;
  const ListItem(this.obj, this.callback, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (dir) {
        callback.call();
      },
      background: Container(color: Colors.red),
      key: UniqueKey(),
      child: ListTile(
        onTap: () => Navigator.of(context).push(ListItemPage.route(obj)),
        title: Text('$obj'),
      ),
    );
  }
}
