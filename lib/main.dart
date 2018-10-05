import 'package:flutter/material.dart';
import './ui/Login.dart';

void main(){
  runApp(new MaterialApp(
    title:"Login",
    theme: new ThemeData(
      primarySwatch: Colors.green,
      ),
    home: new Login(),
  ));
}