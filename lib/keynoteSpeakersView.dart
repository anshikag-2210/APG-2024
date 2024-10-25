import 'package:flutter/material.dart';
import 'data_fetcher.dart'; 
import 'data_struct.dart'; 
import 'KeyNoteDetailView.dart'; 
import 'footerview.dart'; 

class KeynoteSpeakersView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final keyNoteSpeakers = DataManager().persons.where((person) => person.PD_PTYPE == 'KEYNOTE').toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Keynote Speakers'),
        backgroundColor: Color.fromRGBO(70, 116, 167, 1),
      ),
      body: keyNoteSpeakers.isEmpty
          ? Center(child: CircularProgressIndicator()) // Show a loading indicator if no data
          : ListView.builder(
              itemCount: keyNoteSpeakers.length,
              itemBuilder: (context, index) {
                var item = keyNoteSpeakers[index];

                return GestureDetector(
                  onTap: () {
                    // Navigate to detail view
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => KeyNoteDetailView(keyNoteSpeaker: item),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0), // Space between list items
                    decoration: BoxDecoration(
                      color: Colors.lightBlue[50], // Very light blue background color
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
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.grey[300], // Background color for the avatar
                          child: Image.network(
                            'https://yourimageurl/${item.CMB_ID}.png', // Replace with real image source
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              // Show an icon if the image fails to load
                              return Icon(Icons.person, color: Colors.grey, size: 40); // Dummy person icon
                            },
                          ),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.PD_NAME,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(70, 116, 167, 1), // Custom text color
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              item.PD_ORGANIZATION,
                              style: TextStyle(
                                color: Color.fromRGBO(70, 116, 167, 1), // Custom subtitle color
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      bottomNavigationBar: FooterView(), // Add footer at the bottom
    );
  }
}

// Example preview for testing the view
class KeynoteSpeakersViewPreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: KeynoteSpeakersView(),
    );
  }
}
