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
import 'footerview.dart';
import 'ExhibitorsView.dart';
import 'FileViewerPage.dart'; 
import 'contactsView.dart';
import 'galleryView.dart';

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
    String ExbhLayoutUrl= "https://firebasestorage.googleapis.com/v0/b/spg23-03112023.appspot.com/o/Layout%2FExbhLayout.jpg?alt=media&token=08ef97e1-e0a0-4589-9461-793d55492989";
    String ConferenceLayoutUrl= "https://firebasestorage.googleapis.com/v0/b/spg23-03112023.appspot.com/o/Layout%2FConference.pdf?alt=media&token=6e7d87b5-d6d0-4dad-9a97-5590dd164c79";
    String RegistrationUrl =  "https://apgindia.org/geoindia2024/registration/?pgID=geoindia/registration/";
    String navigationUrl = "https://g.co/kgs/DrrLukT";
    String BrochureUrl = "https://apgindia.org/UserFiles/files/Geoindia-2024-Brochure.pdf";
    String studentProgramUrl = "https://firebasestorage.googleapis.com/v0/b/spg23-03112023.appspot.com/o/Program%2FStudent.pdf?alt=media&token=440bd8b8-96e6-45bc-98aa-84eec6c4f4e4";
    // String spouseProgramUrl = "https://firebasestorage.googleapis.com/v0/b/spg23-03112023.appspot.com/o/Program%2FSpouses.pdf?alt=media&token=514e86ed-af5d-493a-8481-39a7ca96fe9e";

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
                      url: BrochureUrl,
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
                      IconButtonData(icon: Icons.grid_view, color: Color.fromRGBO(70, 116, 167, 1), label: "Conference\nLayout",
                                view: FileViewerPage(
                                fileUrl: ConferenceLayoutUrl,
                                title: "Conference Layout"),),
                      IconButtonData(icon: Icons.grid_view, color: Color.fromRGBO(70, 116, 167, 1), label: "Exhibition\nLayout", 
                                view: FileViewerPage(
                                fileUrl: ExbhLayoutUrl,
                                title: "Exhibition Layout",)
                                ),
                    ]),
                    // Third Row
                    buildIconRow(context, [
                      IconButtonData(icon: Icons.group, color: Color.fromRGBO(70, 116, 167, 1), label: "Authors", view: AuthorsView()),
                      IconButtonData(icon: Icons.person_add, color: Color.fromRGBO(70, 116, 167, 1), label: "Registration",   
                      view: UrlView(
                                url: RegistrationUrl,
                                title: "Registration",),
                                ),
                      IconButtonData(icon: Icons.handshake, color: Color.fromRGBO(70, 116, 167, 1), label: "Sponsors", view: SponsorsView()),
                    ]),
                    // Fourth Row
                    buildIconRow(context, [
                      IconButtonData(icon: Icons.dashboard, color: Color.fromRGBO(70, 116, 167, 1), label: "CE Courses", view: CECourseView()),
                      IconButtonData(icon: Icons.people, color: Color.fromRGBO(70, 116, 167, 1), label: "Student Program", 
                      view: FileViewerPage(
                                fileUrl: studentProgramUrl,
                                title: "Student Program"),),
                      IconButtonData(icon: Icons.business, color: Color.fromRGBO(70, 116, 167, 1), label: "Exhibitors", view: ExhibitorsView()),
                    ]),
                    // Fifth Row
                    buildIconRow(context, [
                      IconButtonData(icon: Icons.image, color: Color.fromRGBO(70, 116, 167, 1), label: "Gallery", view: GalleryView()),
                      IconButtonData(icon: Icons.phone, color: Color.fromRGBO(70, 116, 167, 1), label: "Contacts", view: ContactsView()),
                      IconButtonData(icon: Icons.map, color: Color.fromRGBO(70, 116, 167, 1), label: "Navigate", 
                                view: UrlView(
                                url: navigationUrl,
                                title: "Navigate",),
                                ),
                    ]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    bottomNavigationBar: FooterView(),
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
