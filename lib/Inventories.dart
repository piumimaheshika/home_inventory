import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'Categories.dart';

class Inventories extends StatefulWidget {
  _InventoriesState createState() => new _InventoriesState();
}

class _InventoriesState extends State<Inventories> {
  int counter = 0;

  List<Widget> _list = new List<Widget>();

  @override
  void initState() {
    _list.add(_createWidget(1));
    _list.add(_createWidget(2));
  }

  Widget _createWidget(int i) {
    Key key = new Key('item_${i}');
    Container child = new Container(
      key: key,
      padding: new EdgeInsets.all(16.0),
      child: new Chip(
        label: new Text(
          'Inventory ${i}',
          style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.normal,
              color: Colors.blueAccent.shade50),
        ),
        deleteIconColor: Colors.red,
        deleteButtonTooltipMessage: 'Delete',
        onDeleted: () => _removeItem(key),
        avatar: new CircleAvatar(
          child: new Icon(Icons.work),
        ),
      ),
    );

    counter++;
    return child;
  }

  void _removeItem(Key key) {
    for (int i = 0; i < _list.length; i++) {
      Widget child = _list.elementAt(i);
      if (child.key == key) {
        setState(() => _list.removeAt(i));
        print('Removing ${key.toString()}');
      }
    }
  }

  void _onClicked() {
    Widget child = _createWidget(counter);
    setState(() => _list.add(child));
  }
//  Widget _createWidget() {
//    List<Widget> list = new List();
//    for (int i = 0; i < _inventories.length; i++) {
//      list.add(new ListTile(
//          title: Text(_inventories[i]),
//          trailing: Icon(Icons.keyboard_arrow_right),
//          onTap: () {
//            Navigator.push(context,
//                MaterialPageRoute(builder: (context) => new Categories()));
//          }));
//    }
//    ListView listView = new ListView(
//      children: list,
//    );
//    return listView;
//  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("My Inventories"),
        backgroundColor: Colors.lightBlue,
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: null,
        child: new Icon(Icons.add),
      ),
      body: new Center(
//        padding: EdgeInsets.all(32),
//        child: new Center(
        child: new Column(
          children: _list,
        ),
        //),
      ),
    );
  }
}
