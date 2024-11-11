import 'package:flutter/material.dart';
import 'data_struct.dart'; 
import 'footerview.dart';

class ContactsDetailView extends StatelessWidget {
  final List<PersonsStruct> cmteData;

  // Constructor to receive the data
  ContactsDetailView({required this.cmteData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Contact Details",
          style: TextStyle(
            color: Colors.white, // Set your desired color here
          ),),
       backgroundColor: Color.fromRGBO(70, 116, 167, 1),),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cmteData.length,
              itemBuilder: (context, index) {
                final item = cmteData[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.PD_NAME,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(70, 116, 167, 1), // Adjust color as needed
                            ),
                          ),
                          Text(
                            item.PD_ORGANIZATION,
                            style: TextStyle(
                              color: const Color.fromARGB(255, 111, 109, 109), // Adjust color as needed
                            ),
                          ),
                          Text(
                            item.PD_EMAIL,
                            style: TextStyle(
                              color: const Color.fromARGB(255, 111, 109, 109),// Adjust color as needed
                            ),
                          ),
                          Text(
                            item.PD_PHONE1,
                            style: TextStyle(
                              color: const Color.fromARGB(255, 111, 109, 109),// Adjust color as needed
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          FooterView(), // Your footer widget
        ],
      ),
    );
  }
}
