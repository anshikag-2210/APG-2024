import 'package:flutter/material.dart';
import 'data_fetcher.dart';
import 'authorsDetailView.dart';
import 'footerview.dart';

class AuthorsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final personsData = DataManager().persons; // Access global persons data

    return Scaffold(
      appBar: AppBar(
        title: Text("Authors"),
      ),
      body: ListView.builder(
        itemCount: personsData.length,
        itemBuilder: (context, index) {
          final person = personsData[index];
          return ListTile(
            leading: CircleAvatar(
              // Replace with the actual image URL
              backgroundImage: NetworkImage("https://example.com/images/${person.CMB_ID}"),
            ),
            title: Text(
              person.PD_NAME,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(person.PD_ORGANIZATION),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AuthorsDetailView(author: person),
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: FooterView(),
    );
  }
}
