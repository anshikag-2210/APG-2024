import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'footerview.dart';

class AboutPage extends StatelessWidget {
  final String imagePath = 'images/aboutBg.png'; 

  // Function to open mail
  void _openEmail(String email) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
    );
    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    } else {
      throw 'Could not launch $email';
    }
  }

  // Function to open phone
void _openPhone(String phoneNumber) async {
  final Uri phoneLaunchUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );
  if (await canLaunchUrl(phoneLaunchUri)) {
    await launchUrl(phoneLaunchUri, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch $phoneNumber';
  }
}

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('About',
          style: TextStyle(
            color: Colors.white, // Set your desired color here
          ),),
        
        backgroundColor: Color.fromRGBO(70, 116, 167, 1),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: screenHeight * 0.25, // 25% of screen height
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Text(
                    'App Designed and Developed by:',
                    style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Computer Services, E & D Directorate, ONGC Ltd.\nGeoIndia 2024',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text(
                'Contact for Feedback & Issues:',
                style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 16,
                ),
                textAlign: TextAlign.left,
              ),
            _buildContactCard(
              name: 'Anshika Gangwar',
              email: 'gangwar_anshika@ongc.co.in',
              phoneNumber: '8765201698',
            ),
            _buildContactCard(
              name: 'Raj Kumar',
              email: 'rajkumar2@ongc.co.in',
              phoneNumber: '9757064038',
            ),
          ],
        ),
      ),
    bottomNavigationBar: FooterView(),
    );
  }

  // Contact Card Widget
  Widget _buildContactCard({
    required String name,
    required String email,
    required String phoneNumber,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 4),
          Row(
            children: [
              Icon(Icons.email, color: Colors.black54),
              SizedBox(width: 8),
              GestureDetector(
                onTap: () => _openEmail(email),
                child: Text(
                  email,
                  style: TextStyle(color: Colors.black87),
                ),
              ),
            ],
          ),
          SizedBox(height: 4),
          Row(
            children: [
              Icon(Icons.phone, color: Colors.black54),
              SizedBox(width: 8),
              GestureDetector(
                onTap: () => _openPhone(phoneNumber),
                child: Text(
                  phoneNumber,
                  style: TextStyle(color: Colors.black87),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
        ],
      ),
    );
  }
}
