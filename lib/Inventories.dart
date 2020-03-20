import 'package:flutter/material.dart';

import 'Categories.dart';

class Inventories extends StatefulWidget {
  _InventoriesState createState() => new _InventoriesState();
}

class _InventoriesState extends State<Inventories> {

  List<String> _inventories = new List();

  @override
  void initState() {
    _inventories.add("Food");
    _inventories.add("Bathroom");
    _inventories.add("Stationeray");
  }

  Widget _createWidget() {
    List<Widget> list = new List();
    for (int i = 0; i < _inventories.length; i++) {
      list.add(new ListTile(
          title: Text(_inventories[i]),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => new Categories()));
          }));
    }
    ListView listView = new ListView(
      children: list,
    );
    return listView;
  }

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
      body: new Container(
        padding: EdgeInsets.all(32),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Expanded(child: _createWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
