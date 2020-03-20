import 'package:flutter/material.dart';
import 'Inventories.dart';

class Login extends StatefulWidget {
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<Login> {
  //Route to Inventories List Page
  void _onLoginPressed() => Navigator.push(
      context, MaterialPageRoute(builder: (context) => new Inventories()));

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      body: new Container(
        padding: EdgeInsets.fromLTRB(32, 64, 32, 64),
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Container(
                margin: const EdgeInsets.all(4.0),
                padding: const EdgeInsets.all(8.0),
                child: new Column(
                  children: <Widget>[
                    new Text('Login'),
                    new TextField(
                      decoration: new InputDecoration(
                          labelText: "Home Inventory Name",
                          hintText: "Enter Inventory Home Name"),
                      autofocus: true,
                      autocorrect: true,
                    ),
                    new TextField(
                      decoration: new InputDecoration(
                          labelText: "Password", hintText: "Enter Password"),
                      autocorrect: true,
                      obscureText: true,
                    ),
                    new Padding(
                        padding: EdgeInsets.all(16),
                        child: new RaisedButton(
                          onPressed: _onLoginPressed,
                          child: new Text("Login"),
                        ))
                  ],
                ),
              ),
              new Container(
                padding: const EdgeInsets.all(16.0),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new Text('Create Home Inventory Account'),
                    new TextField(
                      decoration: new InputDecoration(
                          labelText: "Home Inventory Name",
                          hintText: "Set up Home Inventory Name"),
                      autocorrect: true,
                    ),
                    new TextField(
                      decoration: new InputDecoration(
                          labelText: "Set Password", hintText: "Set Password"),
                      autocorrect: true,
                      obscureText: true,
                    ),
                    new TextField(
                      decoration: new InputDecoration(
                          labelText: "Confirm Password",
                          hintText: "Re-enter Password"),
                      autofocus: true,
                      autocorrect: true,
                      obscureText: true,
                    ),
                    new Padding(
                        padding: EdgeInsets.all(16),
                        child: new RaisedButton(
                          onPressed: _onLoginPressed,
                          child: new Text("Set Up"),
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
