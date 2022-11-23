import 'package:flutter/material.dart';

class ListItemPage extends StatelessWidget {
  static Route route(int obj) => MaterialPageRoute(builder: (_) => ListItemPage(obj));

  final int obj;

  const ListItemPage(this.obj, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('this is a page of $obj'),
      ),
    );
  }
}
