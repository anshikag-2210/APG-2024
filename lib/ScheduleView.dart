import 'package:flutter/material.dart';
import 'data_fetcher.dart'; // Import the DataManager class
import 'data_struct.dart'; // Import ScheduleStruct
import 'footerview.dart';
import 'ScheduleDetailsView.dart';

class ScheduleView extends StatefulWidget {
  @override
  _ScheduleViewState createState() => _ScheduleViewState();
}

class _ScheduleViewState extends State<ScheduleView> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    // Access the fetched data from DataManager
    final scheduleDataArr = DataManager().schedules; 

    // Group the schedule data by SLOT_DAY
    Map<String, List<ScheduleStruct>> groupedData = scheduleDataArr.fold({}, (Map<String, List<ScheduleStruct>> result, scheduleItem) {
      result[scheduleItem.SLOT_DAY] = result[scheduleItem.SLOT_DAY] ?? [];
      result[scheduleItem.SLOT_DAY]!.add(scheduleItem);
      return result;
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("Schedule"),
        backgroundColor: Color.fromRGBO(70, 116, 167, 1),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity, // Ensure the container takes full width
              decoration: BoxDecoration(
                color: Color.fromRGBO(70, 116, 167, 1), // Background color
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Evenly distributed buttons
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTab = 0; // Set to Day 1
                      });
                    },
                    child: Container(
                      color: selectedTab == 0 ? Colors.white : Colors.transparent, // Change background color
                      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0), // Padding for the button
                      child: Text(
                        "Day 1",
                        style: TextStyle(color: Colors.black), // Text color remains constant
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTab = 1; // Set to Day 2
                      });
                    },
                    child: Container(
                      color: selectedTab == 1 ? Colors.white : Colors.transparent, // Change background color
                      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0), // Padding for the button
                      child: Text(
                        "Day 2",
                        style: TextStyle(color: Colors.black), // Text color remains constant
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTab = 2; // Set to Day 3
                      });
                    },
                    child: Container(
                      color: selectedTab == 2 ? Colors.white : Colors.transparent, // Change background color
                      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0), // Padding for the button
                      child: Text(
                        "Day 3",
                        style: TextStyle(color: Colors.black), // Text color remains constant
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: selectedTab == 0
                ? ScheduleDetailsView(dayData: groupedData['DAY 1'] ?? [])
                : selectedTab == 1
                    ? ScheduleDetailsView(dayData: groupedData['DAY 2'] ?? [])
                    : ScheduleDetailsView(dayData: groupedData['DAY 3'] ?? []),
          ),
        ],
      ),
      bottomNavigationBar: FooterView(), // Call the FooterView at the bottom
    );
  }
}
