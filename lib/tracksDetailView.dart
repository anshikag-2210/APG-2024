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
        backgroundColor: Color.fromRGBO(70, 116, 167, 1), // App bar color
      ),
      body: ListView.builder(
        itemCount: themeData.length,
        itemBuilder: (context, index) {
          var event = themeData[index];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TaskSummaryView(event: event),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), // Padding around each card
              child: Card(
                color: Color.fromRGBO(234, 242, 255, 1), // Light background for the card
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), // Rounded corners
                ),
                elevation: 4, // Slight elevation for separation
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Top section for the favorite button
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${event.EVT_PAPER_EVENT_PAPERID} (${event.EVT_TYPE})',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                        color: Color.fromRGBO(70, 116, 167, 1), // Consistent color for event text
                                      ),
                                    ), ],
                                ),
                              ),
                              // Favorite button at the top right corner
                              IconButton(
                                icon: Icon(Icons.favorite_border, color: Colors.red), // Favorite icon
                                onPressed: () {
                                  // Implement favorite toggle logic here
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 8.0), // Space between lines
                          Text(
                            event.EVT_TITLE,
                            style: TextStyle(
                              color: Color.fromRGBO(70, 116, 167, 1), // Consistent color for title
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Row(
                            children: [
                              Text(
                                "Session: ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Expanded(
                                child: Text(
                                  event.TH_THEME,
                                  overflow: TextOverflow.ellipsis, // Add ellipsis if text overflows
                                  maxLines: 1, // Limit to one line
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8.0),
                          Row(
                            children: [
                              Text(
                                "Author: ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Expanded(
                                child: Text(
                                  event.AU_NAME,
                                  overflow: TextOverflow.ellipsis, // Add ellipsis if text overflows
                                  maxLines: 1, // Limit to one line
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12.0), // Space before venue and date info
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  event.SLOT_VENUE1,
                                  overflow: TextOverflow.ellipsis, // Add ellipsis if text overflows
                                ),
                              ),
                              // Place time info in the same row for better alignment
                              Text(event.SLOT_START),
                              Text(" - "),
                              Text(event.SLOT_DATE),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
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
