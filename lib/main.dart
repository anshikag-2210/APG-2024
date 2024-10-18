import 'package:flutter/material.dart';
import 'dart:convert'; // For JSON decoding
import 'package:apg2024/brochureView.dart'; 
import 'data_fetcher.dart'; // Import your data fetcher
import 'data_struct.dart';  // Import your data structure
import 'CECourseView.dart';

void main() {
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
      home: Home(),  // Main Home screen
    );
  }
}

class Home extends StatelessWidget {
  // URLs for fetching data
  final String _CECourseurl = "https://spg23-03112023-default-rtdb.asia-southeast1.firebasedatabase.app/tabs/data/CECOURSES.json";
  final String _Scheduleurl = "https://spg23-03112023-default-rtdb.asia-southeast1.firebasedatabase.app/tabs/data/V_SCHEDULE.json";
  final String _themesurl = "https://spg23-03112023-default-rtdb.asia-southeast1.firebasedatabase.app/tabs/data/THEMES.json";
  final String _personsurl = "https://spg23-03112023-default-rtdb.asia-southeast1.firebasedatabase.app/tabs/data/PERSONS.json";
  final String _galleryurl = "https://spg23-03112023-default-rtdb.asia-southeast1.firebasedatabase.app/tabs/data/IMAGES.json";
  final String _sponsorsurl = "https://spg23-03112023-default-rtdb.asia-southeast1.firebasedatabase.app/tabs/data/ORGANIZATIONS.json?orderBy=%22OS_TYPE%22&equalTo=%22SPONSOR%22";
  final String _orgurl = "https://spg23-03112023-default-rtdb.asia-southeast1.firebasedatabase.app/tabs/data/ORGANIZATIONS.json";

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
                    IconButtonData(icon: Icons.book, label: "Sessions", view: TracksView()),
                    IconButtonData(icon: Icons.calendar_today, label: "Schedule", view: ScheduleView()),
                    IconButtonData(icon: Icons.favorite, label: "Favourites", view: FavouritesView()),
                  ]),
                  // Second Row
                  buildIconRow(context, [
                    IconButtonData(icon: Icons.edit, label: "Keynote\nSpeakers", view: Home()),
                    IconButtonData(icon: Icons.person, label: "Conference\nLayout", view: Home()),
                    IconButtonData(icon: Icons.person, label: "Exhibition\nLayout", view: Home()),
                  ]),
                  // Third Row
                  buildIconRow(context, [
                    IconButtonData(icon: Icons.person, label: "Authors", view: Home()),
                    IconButtonData(icon: Icons.edit, label: "Registration", view: Home()),
                    IconButtonData(icon: Icons.group, label: "Sponsors", view: Home()),
                  ]),
                  // Fourth Row
                  buildIconRow(context, [
                    IconButtonData(icon: Icons.school, label: "CE Courses", view: CECourseView()),
                    IconButtonData(icon: Icons.create, label: "Student\nProgram", view: Home()),
                    IconButtonData(icon: Icons.person, label: "Spouse\nProgram", view: Home()),
                  ]),
                  // Fifth Row
                  buildIconRow(context, [
                    IconButtonData(icon: Icons.business, label: "Exhibitors", view: Home()),
                    IconButtonData(icon: Icons.phone, label: "Contacts", view: Home()),
                    IconButtonData(icon: Icons.map, label: "Navigate", view: Home()),
                  ]),
                  // Sixth Row
                  buildIconRow(context, [
                    IconButtonData(icon: Icons.photo_album, label: "Photo\nGallery", view: Home()),
                    IconButtonData(icon: Icons.touch_app, label: "Career\nSymposium", view: Home()),
                    IconButtonData(icon: Icons.public, label: "Geo\nHorizons", view: Home()),
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
              icon: Icon(data.icon, size: 30),
              onPressed: () {
                // Navigate to corresponding view
                Navigator.push(context, MaterialPageRoute(builder: (context) => data.view));
              },
            ),
            Text(
              data.label,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
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

  IconButtonData({required this.icon, required this.label, required this.view});
}

class TracksView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Tracks')));
  }
}

class ScheduleView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Schedule')));
  }
}

class FavouritesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Favourites')));
  }
}
