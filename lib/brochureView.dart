import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BrochureView extends StatelessWidget {
  final String brochureUrl = "https://apgindia.org/UserFiles/files/Geoindia-2024-Brochure.pdf";

  @override
  Widget build(BuildContext context) {
    // Launch the URL as soon as the widget is built
    _launchBrochureURL();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Brochure View'),
      ),
      body: Center(
        child: CircularProgressIndicator(), // Show a loading indicator while the URL is opening
      ),
    );
  }

  // Function to open the URL in the browser
  Future<void> _launchBrochureURL() async {
    if (await canLaunch(brochureUrl)) {
      await launch(brochureUrl); // Opens the URL in the browser automatically
    } else {
      throw 'Could not launch $brochureUrl';
    }
  }
}
