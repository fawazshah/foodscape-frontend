import 'package:flutter/material.dart';
import 'package:frontend/core/models/item.dart';
import 'package:frontend/ui/widgets/my_list_item.dart';

class ItemOperationsView extends StatelessWidget {
  const ItemOperationsView({this.item});

  final Item item;

  @override
  Widget build(BuildContext context) {
    final Function viewItem = () {
      Navigator.pushNamed(context, '/item', arguments: item);
    };
    final Function editItem = () {
      Navigator.pushNamed(context, '/items/edit', arguments: item);
    };
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Item name', style: TextStyle(fontSize: 24)),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                child: MyListItem(item: item),
                padding: const EdgeInsets.all(16.0),
              ),
              _makeOperation('View Item', const Icon(Icons.remove_red_eye),
                  onTap: viewItem),
              _makeOperation('Edit Item', const Icon(Icons.edit),
                  onTap: editItem),
              _makeOperation(
                'Mark as Collected',
                const Icon(Icons.check_circle),
              ),
              _makeOperation(
                'Delete Item',
                const Icon(Icons.delete),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _makeOperation(String text, Icon icon, {Function onTap}) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          height: 45.0,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.black,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: icon,
              ),
              Container(
                padding: const EdgeInsets.only(left: 5),
                alignment: Alignment.centerLeft,
                child: Text(
                  text,
                  style: const TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
