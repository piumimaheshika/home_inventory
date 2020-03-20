import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'package:intl/intl.dart';

import 'Login.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
//      onTap: () {
//        //FocusScopeNode currentFocus = FocusScope.of(context);
//        FocusScope.of(context).requestFocus(new FocusNode());
////        if (!currentFocus.hasPrimaryFocus) {
////          currentFocus.unfocus();
////        }
//      },
      child: MaterialApp(
        title: 'Home Inventory',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Login(),
      ),
    );
  }
}
