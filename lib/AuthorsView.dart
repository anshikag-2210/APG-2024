import 'package:flutter/material.dart';
import 'data_fetcher.dart';
import 'authorsDetailView.dart';
import 'footerview.dart';

class AuthorsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final personsData = DataManager().persons.where((person) => person.PD_PTYPE == 'AUTHOR').toList();
    return Scaffold(
      appBar: AppBar(
        title: Text("Authors",
          style: TextStyle(
            color: Colors.white, // Set your desired color here
          ),),
        backgroundColor: Color.fromRGBO(70, 116, 167, 1),
      ),
      body: ListView.builder(
        itemCount: personsData.length,
        itemBuilder: (context, index) {
          final person = personsData[index];
          return Container(
            margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0), // Space between list items
            decoration: BoxDecoration(
              color: Colors.lightBlue[50], 
              borderRadius: BorderRadius.circular(8.0), // Rounded corners
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3), // Subtle shadow
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 3), // Changes position of shadow
                ),
              ],
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey[300], 
                child: Image.network(
                  '${DataManager().allUrls["authorsPhotoUrl"]}${person.CMB_ID}.png',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    // Show an icon if the image fails to load
                    return Icon(Icons.person, color: Colors.grey, size: 40); 
                  },
                ),
              ),
              title: Text(
                person.PD_NAME,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(70, 116, 167, 1), 
                ),
              ),
              subtitle: Text(
                person.PD_ORGANIZATION,
                style: TextStyle(color: Color.fromRGBO(70, 116, 167, 1)), 
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AuthorsDetailView(author: person),
                  ),
                );
              },
            ),
          );
        },
      ),
      bottomNavigationBar: FooterView(),
    );
  }
}
