import 'package:flutter/material.dart';
import 'ScheduleView.dart';
import 'AuthorsView.dart';
import 'TracksView.dart';
import 'keynoteSpeakersView.dart';
import 'about.dart';
import 'sponsorsView.dart';

class Sidebar extends StatelessWidget {
  final Color customColor = Color.fromRGBO(70, 116, 167, 1);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: screenHeight * 0.37, // Set height to 25% of the screen
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/bgImage.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                '',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          _buildListTile(
            context,
            icon: Icons.home,
            title: 'Home',
            onTap: () => Navigator.pop(context),
          ),
          _buildListTile(
            context,
            icon: Icons.book,
            title: 'Tracks',
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TracksView()),
              );
            },
          ),
          _buildListTile(
            context,
            icon: Icons.assignment,
            title: 'Keynote Speakers',
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => KeynoteSpeakersView()),
              );
            },
          ),
          _buildListTile(
            context,
            icon: Icons.calendar_today,
            title: 'Schedule',
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ScheduleView()),
              );
            },
          ),
          _buildListTile(
            context,
            icon: Icons.group,
            title: 'Authors',
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AuthorsView()),
              );
            },
          ),
          _buildListTile(
            context,
            icon: Icons.handshake,
            title: 'Our Sponsors',
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SponsorsView()),
              );
            },
          ),
          _buildListTile(
            context,
            icon: Icons.info,
            title: 'About',
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutPage()),
              );
            },
          ),
        ],
      ),
    );
  }

  ListTile _buildListTile(BuildContext context, {required IconData icon, required String title, required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: customColor),
      title: Text(title, style: TextStyle(color: customColor)),
      onTap: onTap,
    );
  }
}
