import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'package:intl/intl.dart';

class AddItem extends StatefulWidget {
  _AddItemState createState() => new _AddItemState();
}

class _AddItemState extends State<AddItem> {
  int _quantity = 0;

  var textController = new TextEditingController();

  void _increment() {
    setState(() {
      _quantity++;
    });
  }

  void _reduce() {
    setState(() {
      _quantity = _quantity == 0 ? _quantity : _quantity - 1;
    });
  }

  void _onSave() {
    setState(() {});
    Navigator.pop(context);
  }

  void _onCreateNew() {
    setState(() {
      textController.text = '';
      _quantity = 0;
    });
  }

  void _onSubmit(String value) {
    setState(() {});
  }

  //Datepicker
  String _expireDate = DateFormat('yyyy/MM/dd').format(DateTime.now());
  Future _selectDate() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2000),
        lastDate: new DateTime(3000));

    if (picked != null)
      setState(() {
        _expireDate = DateFormat('yyyy/MM/dd').format(picked);
      });
  }

  @override
  void initState() {
    _quantity = 0;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: new AppBar(
        title: new Text('Add Item'),
        backgroundColor: Colors.lightBlue,
      ),
      body: new Center(
          child: new Container(
        padding: EdgeInsets.all(16),
        child: new Column(
          children: <Widget>[
            new Container(
              height: 200,
              width: 200,
              padding: EdgeInsets.all(16.0),
              child: new Image.network(
                  'https://image.shutterstock.com/image-photo/dry-instant-noodle-asian-ramen-260nw-1377772079.jpg'),
            ),
            new Padding(
                padding: EdgeInsets.fromLTRB(16, 32, 16, 32),
                child: new TextField(
                  controller: textController,
                  decoration: new InputDecoration(
                      labelText: "Item Name", hintText: "Enter Item Name"),
                  autofocus: true,
                  autocorrect: true,
                )),
            new Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 64, 16),
              child: new Row(
                children: <Widget>[
                  new Text('Expire on : $_expireDate',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.blueAccent.shade50)),
                  new FlatButton(
                    onPressed: _selectDate,
                    child: new Icon(Icons.calendar_today),
                  )
                ],
              ),
            ),
            new Container(
              margin: const EdgeInsets.all(16.0),
              padding: const EdgeInsets.all(8.0),
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.blueAccent)),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                      child: new IconButton(
                    icon: new Icon(Icons.add),
                    onPressed: _increment,
                    color: Colors.green,
                  )),
                  Expanded(
                    child: new Text(
                      _quantity.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent.shade50),
                    ),
                  ),
                  Expanded(
                      child: new IconButton(
                    icon: new Icon(Icons.remove),
                    onPressed: _reduce,
                    color: Colors.red,
                  ))
                ],
              ),
            ),
            new Spacer(),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new RaisedButton(
                  onPressed: _onSave,
                  child: new Text('Save & Close'),
                  color: Colors.blueAccent.shade100,
                ),
                new RaisedButton(
                  onPressed: _onCreateNew,
                  child: new Text('Save & Create New'),
                  color: Colors.blueAccent.shade200,
                )
              ],
            ),
            new Spacer()
          ],
        ),
      )),
    );
  }
}
