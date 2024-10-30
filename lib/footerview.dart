import 'package:flutter/material.dart';
import 'main.dart';

class FooterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      color: Color.fromRGBO(70, 116, 167, 1), // Equivalent to SwiftUI color
      child: Center(
        child: IconButton(
          icon: Icon(Icons.house), // Equivalent to house.fill
          color: Colors.white,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyApp()),
            );
          },
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'APG 2024',
      home: MyApp(),
    );
  }
}
// Previewing the FooterView (optional, only in a Flutter app)
class FooterViewPreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: Container()), 
          FooterView(),
        ],
      ),
    );
  }
}
