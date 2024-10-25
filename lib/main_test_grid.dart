import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Icon Grid')),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, // Number of columns
            childAspectRatio: 1, // Aspect ratio for each cell
          ),
          itemCount: 12, // Total number of icons
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                // border: Border.all(color: Colors.grey),
                // borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: Center(
                child: Icon(
                  _getIcon(index),
                  size: 40, // Size of the icons
                  color: Colors.blue, // Icon color
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  IconData _getIcon(int index) {
    switch (index) {
      case 0:
        return Icons.home;
      case 1:
        return Icons.person;
      case 2:
        return Icons.settings;
      case 3:
        return Icons.mail;
      case 4:
        return Icons.camera;
      case 5:
        return Icons.favorite;
      case 6:
        return Icons.star;
      case 7:
        return Icons.notifications;
      case 8:
        return Icons.map;
      case 9:
        return Icons.directions_car;
      case 10:
        return Icons.flag;
      case 11:
        return Icons.book;
      default:
        return Icons.help; // Default icon if needed
    }
  }
}
