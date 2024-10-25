import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BrochureView extends StatelessWidget {
  final String brochureUrl = "https://apgindia.org/UserFiles/files/Geoindia-2024-Brochure.pdf";

  @override
  Widget build(BuildContext context) {
    _launchBrochureURL();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Brochure View'),
        backgroundColor: Color.fromRGBO(70, 116, 167, 1), 
      ),
      body: Center(
        child: CircularProgressIndicator(), // Show a loading indicator while the URL is opening
      ),
    );
  }
  Future<void> _launchBrochureURL() async {
    if (await canLaunch(brochureUrl)) {
      await launch(brochureUrl); // Opens the URL in the browser automatically
    } else {
      throw 'Could not launch $brochureUrl';
    }
  }
}
