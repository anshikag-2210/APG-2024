import 'package:flutter/material.dart';
import 'dart:convert'; 
import 'package:apg2024/brochureView.dart'; 
import 'data_fetcher.dart'; 
import 'CECourseView.dart';
import 'ScheduleView.dart';
import 'AuthorsView.dart';
import 'TracksView.dart';
import 'keynoteSpeakersView.dart';
import 'UrlView.dart';
import 'sponsorsView.dart';

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
      body: Center( // Center the entire body
        child: Column(
          children: [
            // Header Image
            GestureDetector(
              onTap: () {
                // Navigate to brochure view
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UrlView(
                      url: "https://apgindia.org/UserFiles/files/Geoindia-2024-Brochure.pdf",
                      title: "Brochure View",
                    ),
                  ),
                );
              },
              child: Image.asset(
                'images/showcasespg.png', // Your local image
                height: screenHeight * 0.25,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 30), // Add space between the image and the icon rows
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
                      IconButtonData(icon: Icons.assignment, color: Color.fromRGBO(70, 116, 167, 1), label: "Keynote\nSpeakers", view: KeynoteSpeakersView()),
                      IconButtonData(icon: Icons.grid_view, color: Color.fromRGBO(70, 116, 167, 1), label: "Conference\nLayout", view: Home()),
                      IconButtonData(icon: Icons.grid_view, color: Color.fromRGBO(70, 116, 167, 1), label: "Exhibition\nLayout", view: Home()),
                    ]),
                    // Third Row
                    buildIconRow(context, [
                      IconButtonData(icon: Icons.group, color: Color.fromRGBO(70, 116, 167, 1), label: "Authors", view: AuthorsView()),
                      IconButtonData(icon: Icons.person_add, color: Color.fromRGBO(70, 116, 167, 1), label: "Registration",   
                      view: UrlView(
                                url: "https://apgindia.org/geoindia2024/registration/?pgID=geoindia/registration/",
                                title: "Registration",),
                                ),
                      IconButtonData(icon: Icons.handshake, color: Color.fromRGBO(70, 116, 167, 1), label: "Sponsors", view: SponsorsView()),
                    ]),
                    // Fourth Row
                    buildIconRow(context, [
                      IconButtonData(icon: Icons.dashboard, color: Color.fromRGBO(70, 116, 167, 1), label: "CE Courses", view: CECourseView()),
                      IconButtonData(icon: Icons.people, color: Color.fromRGBO(70, 116, 167, 1), label: "Studen Program", view: Home()),
                      IconButtonData(icon: Icons.business, color: Color.fromRGBO(70, 116, 167, 1), label: "Exhibitors", view: Home()),
                    ]),
                    // Fifth Row
                    buildIconRow(context, [
                      IconButtonData(icon: Icons.image, color: Color.fromRGBO(70, 116, 167, 1), label: "Gallery", view: Home()),
                      IconButtonData(icon: Icons.phone, color: Color.fromRGBO(70, 116, 167, 1), label: "Contacts", view: Home()),
                      IconButtonData(icon: Icons.map, color: Color.fromRGBO(70, 116, 167, 1), label: "Navigate", 
                                view: UrlView(
                                url: "https://g.co/kgs/DrrLukT",
                                title: "Navigate",),
                                ),
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
      ),
    );
  }

  // Function to create a row of icon buttons
  Widget buildIconRow(BuildContext context, List<IconButtonData> iconButtons) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Use spaceEvenly to provide equal spacing
      children: iconButtons.map((data) {
        return Column(
          mainAxisSize: MainAxisSize.min, // Prevents column from taking unnecessary height
          children: [
            IconButton(
              icon: Icon(data.icon, size: 40, color: data.color),  // Apply color to the icon
              onPressed: () {
                // Navigate to corresponding view
                Navigator.push(context, MaterialPageRoute(builder: (context) => data.view));
              },
            ),
            // SizedBox(height: 06),
            Text(
              data.label,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: data.color),  // Apply color to the label text
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
