import 'package:flutter/material.dart';
import 'data_struct.dart'; // Import ScheduleStruct
import 'taskSummaryView.dart'; // Import Task Summary View
import 'footerview.dart'; // Import FooterView

class TracksDetailView extends StatelessWidget {
  final List<ScheduleStruct> themeData; // Passed schedule data

  TracksDetailView({required this.themeData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tracks'),
        backgroundColor: Color.fromRGBO(70, 116, 167, 1),
      ),
      body: ListView.builder(
        itemCount: themeData.length,
        itemBuilder: (context, index) {
          var event = themeData[index];

          return GestureDetector(
            onTap: () {
              // Navigate to task summary view when tapped
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TaskSummaryView(event: event),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                color: Color.fromRGBO(234, 242, 255, 1), // Background color
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          event.EVT_PAPER_EVENT_PAPERID,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: Colors.green,
                          ),
                        ),
                        Text(" ("),
                        Text(
                          event.EVT_TYPE,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: Colors.green,
                          ),
                        ),
                        Text(")"),
                      ],
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      event.EVT_TITLE,
                      style: TextStyle(color: Colors.green, fontSize: 12),
                    ),
                    SizedBox(height: 4.0),
                    Row(
                      children: [
                        Text("Session: ", style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(event.TH_THEME),
                      ],
                    ),
                    SizedBox(height: 4.0),
                    Row(
                      children: [
                        Text("Author: ", style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(event.AU_NAME),
                      ],
                    ),
                    SizedBox(height: 4.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(event.SLOT_VENUE1),
                        Row(
                          children: [
                            Text(event.SLOT_START),
                            Text(" - "),
                            Text(event.SLOT_DATE),
                          ],
                        ),
                        Icon(Icons.favorite_border, color: Colors.red),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: FooterView(), // Footer widget
    );
  }
}

class TracksDetailViewPreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TracksDetailView(
        themeData: [], // Provide mock data or real data here
      ),
    );
  }
}
