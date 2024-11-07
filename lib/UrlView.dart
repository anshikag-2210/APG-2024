import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlView extends StatelessWidget {
  final String url;
  final String title;

  UrlView({required this.url, required this.title});

  @override
  Widget build(BuildContext context) {
    // Optionally launch the URL here if needed, but can also be done on button press
    _launchURL();

    return Scaffold(
      appBar: AppBar(
        title: Text(title,
          style: TextStyle(
            color: Colors.white, // Set your desired color here
          ),),
        backgroundColor: Color.fromRGBO(70, 116, 167, 1),
      ),
      body: Center(
        child: CircularProgressIndicator(), // Show a loading indicator while the URL is opening
      ),
    );
  }

  Future<void> _launchURL() async {
    if (await canLaunch(url)) {
      await launch(url); // Opens the URL in the browser automatically
    } else {
      throw 'Could not launch $url';
    }
  }
}
