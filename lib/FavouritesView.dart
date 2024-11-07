import 'package:flutter/material.dart';
import 'footerview.dart';

class FavouritesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourites',
          style: TextStyle(
            color: Colors.white, // Set your desired color here
          ),),
        backgroundColor: Color.fromRGBO(70, 116, 167, 1),
      ),
      body: Center(
        child: Text(
          'Coming Soon',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.grey),
        ),
      ),
    bottomNavigationBar: FooterView(),
    );
  
  }
}
