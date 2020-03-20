import 'package:flutter/material.dart';

import 'AddItem.dart';

class Items extends StatefulWidget {
  _ItemsState createState() => new _ItemsState();
}

class _ItemsState extends State<Items> {
  List<String> _items = new List();

  @override
  void initState() {
    _items.add("Bread");
    _items.add("Noodles");
    _items.add("Milk");
  }

  void _onAdded() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => new AddItem()));
  }

  Widget _createWidget() {
    List<Widget> list = new List();
    for (int i = 0; i < _items.length; i++) {
      list.add(new ListTile(
          contentPadding: EdgeInsets.all(10),
          leading: new CircleAvatar(
            backgroundImage: new NetworkImage(
                'https://2rdnmg1qbg403gumla1v9i2h-wpengine.netdna-ssl.com/wp-content/uploads/sites/3/2019/06/cropped-GettyImages-643764514-745x490.jpg'),
          ),
          title: new Row(children: <Widget>[
            new Expanded(child: new Text(_items[i])),
            new Expanded(child: new Text('9')),
            new Expanded(
                child: new IconButton(
              icon: new Icon(Icons.add),
              onPressed: () {},
              color: Colors.green,
            )),
            new Expanded(
                child: new IconButton(
              icon: new Icon(Icons.remove),
              onPressed: () {},
              color: Colors.red,
            ))
          ]),
          subtitle: Text('2022/09/07'),
          onTap: () {
            print(_items[i]);
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
        title: new Text("Products"),
        backgroundColor: Colors.lightBlue,
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _onAdded,
        child: new Icon(Icons.add),
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
