import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'dart:async';

void main(){
  runApp(new MaterialApp(home: new Login()));
}

class Login extends StatefulWidget{
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<Login>{
  //Route to Inventories List Page
  void _onLoginPressed() => Navigator.push(context, MaterialPageRoute(builder: (context)=> new Inventories()));

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        padding: EdgeInsets.fromLTRB(32, 64, 32, 64),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text('Login'),
              new TextField(
                decoration: new InputDecoration(
                  labelText: "User Name",
                  hintText: "Enter User Name"
                ),
                autofocus: true,
                autocorrect: true,
              ),
              new TextField(
                decoration: new InputDecoration(
                    labelText: "Password",
                    hintText: "Enter Password"
                ),
                autofocus: true,
                autocorrect: true,
                obscureText: true,
              ),
              new Padding(padding: EdgeInsets.all(16), child:  new RaisedButton(onPressed:  _onLoginPressed, child: new Text("Login"),))

            ],
          ),
        ),
      ),
    );
  }
}

class Inventories extends StatefulWidget{
  _InventoriesState createState () => new _InventoriesState();
}

class _InventoriesState extends State<Inventories>{
//
//  Map _inventories = new Map();
//
//  void _getInventoriesList() async{
//    var url = 'http://country.io/names.json';
//    var response = await http.get(url);
//    if (response.statusCode == 200){
//      setState(() {
//        _inventories = json.decode(response.body);
//        print('Loaded ${_inventories.length} Inventories for user');
//      });
//    }
//  }

  List <String> _inventories = new List();

  @override
  void initState() {
    _inventories.add("Food");
    _inventories.add("Bathroom");
    _inventories.add("Stationeray");
    //_getInventoriesList();
  }

//  Widget _createWidget(){
//    List<Widget> list = new List();
//    for (int i =0 ; i < _inventories.length; i++){
//      String key = _inventories.keys.elementAt(i);
//      list.add(new ListTile(
//        leading: new CircleAvatar(
//          backgroundImage: new NetworkImage('https://2rdnmg1qbg403gumla1v9i2h-wpengine.netdna-ssl.com/wp-content/uploads/sites/3/2019/06/cropped-GettyImages-643764514-745x490.jpg'),
//        ),
//          title: Text(_inventories[key]),
//          subtitle: Text('3'),
//          trailing: Icon(Icons.keyboard_arrow_right),
//          onTap: () {
//            print(_inventories[key]);
//          }
//      ));
//    }
//    ListView listView = new ListView(children: list,);
//    return listView;
//  }

  Widget _createWidget(){
    List<Widget> list = new List();
    for (int i =0 ; i < _inventories.length; i++){
      list.add(new ListTile(
          title: Text(_inventories[i]),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> new Categories()));
          }
      ));
    }
    ListView listView = new ListView(children: list,);
    return listView;
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("My Inventories"),
        backgroundColor: Colors.lightBlue,
      ),
      floatingActionButton: new FloatingActionButton(onPressed: null,
      child: new Icon(Icons.add),),
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

class Categories extends StatefulWidget{
  _CategoriesState createState () => new _CategoriesState();
}

class _CategoriesState extends State<Categories>{

  List <String> _categories = new List();

  @override
  void initState() {
    _categories.add('Rice');
    _categories.add('Noodles');
    _categories.add('Milk');
    _categories.add('Spices');
  }

  Widget _createWidget(){
    List<Widget> list = new List();
    for (int i =0 ; i < _categories.length; i++){
      list.add(new Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.blueAccent,
        elevation: 10,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
        new ListTile(
        title: new Text(_categories[i], style: TextStyle(color: Colors.white)),
          onTap:() {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> new Items()));
          },
      )])));
    }
    ListView listView = new ListView(children: list,);
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
            children: <Widget>[
              new Expanded(child: _createWidget())
            ],
          ),
        ),
      ),
    );
  }
}


class Items extends StatefulWidget{
  _ItemsState createState () => new _ItemsState();
}

class _ItemsState extends State<Items>{

  List <String> _items = new List();

  @override
  void initState() {
    _items.add("Bread");
    _items.add("Noodles");
    _items.add("Milk");
  }

  Widget _createWidget(){
    List<Widget> list = new List();
    for (int i =0 ; i < _items.length; i++){
      list.add(new ListTile(
        contentPadding: EdgeInsets.all(10),
        leading: new CircleAvatar(
          backgroundImage: new NetworkImage('https://2rdnmg1qbg403gumla1v9i2h-wpengine.netdna-ssl.com/wp-content/uploads/sites/3/2019/06/cropped-GettyImages-643764514-745x490.jpg'),
        ),
          title: new Row(
            children: <Widget>[
              new Expanded(child: new Text(_items[i])),
              new Expanded(child: new Text('9')),
              new Expanded(child: new IconButton(icon: new Icon(Icons.add), onPressed: () {}, color: Colors.green,)),
              new Expanded(child: new IconButton(icon: new Icon(Icons.remove), onPressed: (){}, color: Colors.red,))

            ]),
          subtitle: Text('2022/09/07'),
          onTap: () {
            print(_items[i]);
          }
      ));
    }
    ListView listView = new ListView(children: list,);
    return listView;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Products"),
        backgroundColor: Colors.lightBlue,
      ),
      floatingActionButton: new FloatingActionButton(onPressed: null,
          child: new Icon(Icons.add),),
      body: new Container(
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Expanded(child: _createWidget())
            ],
          ),
        ),
      ),
    );
  }
}