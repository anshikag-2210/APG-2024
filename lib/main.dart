import 'package:flutter/material.dart';
import 'dart:convert'; 
import 'package:apg2024/brochureView.dart'; 
import 'data_fetcher.dart'; 
import 'CECourseView.dart';
import 'ScheduleView.dart';
import 'AuthorsView.dart';
import 'TracksView.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DataManager().fetchData(); // Fetch all data when the app starts
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'APG 2024',  // App title
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(), 
    );
  }
}

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(
        children: [
          // Header Image
          GestureDetector(
            onTap: () {
              // Navigate to brochure view
              Navigator.push(context, MaterialPageRoute(builder: (context) => BrochureView()));
            },
            child: Image.asset(
              'images/showcasespg.png', // Your local image
              height: screenHeight * 0.25,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // First Row
                  buildIconRow(context, [
                    IconButtonData(icon: Icons.book, color: Color.fromRGBO(70, 116, 167, 1), label: "Sessions", view: TracksView()),
                    IconButtonData(icon: Icons.calendar_today, color: Color.fromRGBO(70, 116, 167, 1), label: "Schedule", view: ScheduleView()),
                    IconButtonData(icon: Icons.favorite, color: Color.fromRGBO(70, 116, 167, 1), label: "Favourites", view: FavouritesView()),
                  ]),
                  // Second Row
                  buildIconRow(context, [
                    IconButtonData(icon: Icons.edit, color: Color.fromRGBO(70, 116, 167, 1), label: "Keynote\nSpeakers", view: Home()),
                    IconButtonData(icon: Icons.person, color: Color.fromRGBO(70, 116, 167, 1), label: "Conference\nLayout", view: Home()),
                    IconButtonData(icon: Icons.person, color: Color.fromRGBO(70, 116, 167, 1), label: "Exhibition\nLayout", view: Home()),
                  ]),
                  // Third Row
                  buildIconRow(context, [
                    IconButtonData(icon: Icons.person, color: Color.fromRGBO(70, 116, 167, 1), label: "Authors", view: AuthorsView()),
                    IconButtonData(icon: Icons.edit, color: Color.fromRGBO(70, 116, 167, 1), label: "Registration", view: Home()),
                    IconButtonData(icon: Icons.group, color: Color.fromRGBO(70, 116, 167, 1), label: "Sponsors", view: Home()),
                  ]),
                  // Fourth Row
                  buildIconRow(context, [
                    IconButtonData(icon: Icons.school, color: Color.fromRGBO(70, 116, 167, 1), label: "CE Courses", view: CECourseView()),
                    IconButtonData(icon: Icons.create, color: Color.fromRGBO(70, 116, 167, 1), label: "Student\nProgram", view: Home()),
                    IconButtonData(icon: Icons.person, color: Color.fromRGBO(70, 116, 167, 1), label: "Spouse\nProgram", view: Home()),
                  ]),
                  // Fifth Row
                  buildIconRow(context, [
                    IconButtonData(icon: Icons.business, color: Color.fromRGBO(70, 116, 167, 1), label: "Exhibitors", view: Home()),
                    IconButtonData(icon: Icons.phone, color: Color.fromRGBO(70, 116, 167, 1), label: "Contacts", view: Home()),
                    IconButtonData(icon: Icons.map, color: Color.fromRGBO(70, 116, 167, 1), label: "Navigate", view: Home()),
                  ]),
                  // Sixth Row
                  buildIconRow(context, [
                    IconButtonData(icon: Icons.photo_album, color: Color.fromRGBO(70, 116, 167, 1), label: "Photo\nGallery", view: Home()),
                    IconButtonData(icon: Icons.touch_app, color: Color.fromRGBO(70, 116, 167, 1), label: "Career\nSymposium", view: Home()),
                    IconButtonData(icon: Icons.public, color: Color.fromRGBO(70, 116, 167, 1), label: "Geo\nHorizons", view: Home()),
                  ]),
                ],
              ),
            ),
          ),
          // Footer
          Container(
            color: Color.fromRGBO(70, 116, 167, 1),
            height: 40,
            child: Center(
              child: Text(
                'Welcome to APG 2024',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Function to create a row of icon buttons
  Widget buildIconRow(BuildContext context, List<IconButtonData> iconButtons) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: iconButtons.map((data) {
        return Column(
          children: [
            IconButton(
              icon: Icon(data.icon, size: 30, color: data.color),  // Apply color to the icon
              onPressed: () {
                // Navigate to corresponding view
                Navigator.push(context, MaterialPageRoute(builder: (context) => data.view));
              },
            ),
            Text(
              data.label,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, color: data.color),  // Apply color to the label text
            ),
          ],
        );
      }).toList(),
    );
  }
}

// Data class to store icon button data
class IconButtonData {
  final IconData icon;
  final String label;
  final Widget view;
  final Color color; 

  IconButtonData({
    required this.icon, 
    required this.label, 
    required this.view, 
    required this.color,
  });
}

class FavouritesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Favourites')));
  }
}
