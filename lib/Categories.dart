import 'package:flutter/material.dart';

import 'Items.dart';

class Categories extends StatefulWidget {
  _CategoriesState createState() => new _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> _categories = new List();

  @override
  void initState() {
    _categories.add('Rice');
    _categories.add('Noodles');
    _categories.add('Milk');
    _categories.add('Spices');
  }

  Widget _createWidget() {
    List<Widget> list = new List();
    for (int i = 0; i < _categories.length; i++) {
      list.add(new Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          color: Colors.blueAccent,
          elevation: 10,
          child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            new ListTile(
              title: new Text(_categories[i],
                  style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new Items()));
              },
            )
          ])));
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
        title: new Text('Inentory Items'),
        backgroundColor: Colors.lightBlue,
      ),
      body: new Container(
        child: new Center(
          child: new Column(
            children: <Widget>[new Expanded(child: _createWidget())],
          ),
        ),
      ),
    );
  }
}
