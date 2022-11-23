import 'package:flutter/material.dart';
import 'package:list_view/list_item.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<int> obj = List.generate(1000, (index) => index);

  final _textFieldController = TextEditingController();
  @override
  void initState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: obj.length,
        itemBuilder: (context, index) {
          return (ListItem(
            obj[index],
            () {
              _deleteItem(index);
            },
          ));
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        _displayTextInputDialog(context);
      }),
    );
  }

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('TextField in Dialog'),
            content: TextField(
              onChanged: (value) {},
              controller: _textFieldController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: "Text Field in Dialog"),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    _addItem(int.parse(_textFieldController.text));
                  },
                  child: Text('Ok'))
            ],
          );
        });
  }

  _addItem(int item) {
    setState(() {
      obj.insert(0, item);
    });
  }

  _deleteItem(int index) {
    obj.removeAt(index);
    setState(() {});
  }
}
