import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightGreen,
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          title: Text("I am Poor"),
        ),
        body: Center(
          child: Image(
            image: AssetImage('images/i_am_poor.png'),
          ),
        ),
      ),
    ),
  );
}
