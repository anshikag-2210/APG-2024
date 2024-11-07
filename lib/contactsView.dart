import 'package:flutter/material.dart';
import 'data_fetcher.dart'; // Import your data fetching logic here
import 'contactsDetailView.dart'; // Import your details view here
import 'footerview.dart';
import 'data_struct.dart'; // Import your data structure definitions here

class ContactsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Fetch and filter persons data directly
    final personsData = DataManager().persons.where((person) => person.PD_PTYPE == 'COMMITTEE').toList();

    // Group persons by PD_WORKPROFILE in one line using fold
    final Map<String, List<PersonsStruct>> groupedContacts = personsData.fold<Map<String, List<PersonsStruct>>>({}, (map, person) {
      final workProfile = person.PD_WORKPROFILE ?? 'Other'; // Use 'Other' for null values
      map[workProfile] = [...?map[workProfile], person]; // Grouping in one line
      return map;
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts",
          style: TextStyle(
            color: Colors.white, // Set your desired color here
          ),),
        backgroundColor: Color.fromRGBO(70, 116, 167, 1), // Match the color from AuthorsDetailView
      ),
      body: groupedContacts.isEmpty
          ? Center(child: Text("No contacts available."))
          : ListView.builder(
              itemCount: groupedContacts.keys.length,
              itemBuilder: (context, index) {
                String workProfileKey = groupedContacts.keys.elementAt(index);
                var contactsForKey = groupedContacts[workProfileKey]!; // Use ! to assert non-null
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0), // Space between list items
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
                  child: ListTile(
                   title: Text(
                      workProfileKey.toUpperCase(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(70, 116, 167, 1), // Custom text color
                      ),
                    ),
                  onTap: () {
                       Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ContactsDetailView(cmteData: contactsForKey), // Pass a non-nullable list
                            ),
                          );
                  }),
                );
             },
            ),
      bottomNavigationBar: FooterView(),
    );
  }
}
