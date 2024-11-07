import 'package:flutter/material.dart';
import 'dart:convert'; 
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
import 'FavouritesView.dart';
import 'sideBarView.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DataManager().fetchData(); // Fetch all data when the app starts
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GeoIndia', 
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(), 
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends  State<Home>  {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override 
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    String galleryUrl = DataManager().allUrls["galleryUrl"] ?? '';
    String ExbhLayoutUrl = DataManager().allUrls["ExbhLayoutUrl"] ?? '';    
    String ConferenceLayoutUrl =  DataManager().allUrls["ConferenceLayoutUrl"] ?? ''; 
    String navigationUrl =  DataManager().allUrls["navigationUrl"] ?? '';
    String BrochureUrl =  DataManager().allUrls["BrochureUrl"] ?? '';
    String spouseProgramUrl =  DataManager().allUrls["spouseProgramUrl"] ?? '';
    String studentProgramUrl =  DataManager().allUrls["studentProgramUrl"] ?? '';
    String RegistrationUrl =  DataManager().allUrls["RegistrationUrl"] ?? '';

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          'Geo India 2024',
          style: TextStyle(
            color: Colors.white, // Text color
            fontSize: 25.0, // Font size
            fontFamily: 'YourFontFamily', // Replace with the desired font family
            fontWeight: FontWeight.bold, // Optional: makes the text bold
          ),
          textAlign: TextAlign.center,
          ),
        backgroundColor: Color.fromRGBO(70, 116, 167, 1),
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.white,),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
      ),
      drawer: Sidebar(), 
      body: Center( // Center the entire body
        child: Column(
          children: [
            // Header Image
            GestureDetector(
              onTap: () {
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
                'images/bgImage.png', // Your local image
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
                                title: "Conference Layout"
                                ),),
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
                      IconButtonData(icon: Icons.people, color: Color.fromRGBO(70, 116, 167, 1), label: "Spouse Program", 
                      view: FileViewerPage(
                                fileUrl: spouseProgramUrl,
                                title: "Spouse Program"),),
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
