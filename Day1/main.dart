import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.red,
          title: Text('29 Ekim.png'),
        ),
        body: Center(
          child: Image.asset('images/29Ekim.png'),
        ),
      ),
    ),
  );
}

