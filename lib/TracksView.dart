import 'package:flutter/material.dart';
import 'data_fetcher.dart'; // Import the DataManager class
import 'data_struct.dart'; // Import ScheduleStruct
import 'footerview.dart';
import 'tracksDetailView.dart'; // Detail view for the track

class TracksView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Fetching data from DataManager
    final themesData = DataManager().themesData; // Assuming DataManager holds the themes data
    final scheduleDataArr = DataManager().schedules; // Assuming DataManager holds the schedules data

    // Group themes by their TH_TYPE
    Map<String, List<ThemeStruct>> groupedThemesData = themesData.fold({}, (Map<String, List<ThemeStruct>> result, themeItem) {
      result[themeItem.TH_TYPE] = result[themeItem.TH_TYPE] ?? [];
      result[themeItem.TH_TYPE]!.add(themeItem);
      return result;
    });

    // Get unique theme keys (TH_TYPE)
    List<String> uniqueKeys = groupedThemesData.keys.toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Tracks',
          style: TextStyle(
            color: Colors.white, // Set your desired color here
          ),),
        backgroundColor: Color.fromRGBO(70, 116, 167, 1),
      ),
      body: groupedThemesData.isEmpty
          ? Center(child: CircularProgressIndicator()) // Show loading indicator if data is not available
          : ListView(
              children: uniqueKeys.map((key) {
                // For each unique theme key
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ExpansionTile(
                        initiallyExpanded: true,
                        // Background color for the heading
                        tilePadding: EdgeInsets.symmetric(horizontal: 8.0), // Aligns the icon and text
                        title: Container(
                          color: Color.fromRGBO(70, 116, 167, 1), // Set background color to the header
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(Icons.dehaze, color: Colors.white), // Icon color set to white
                              SizedBox(width: 8.0),
                              Text(
                                key,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.white, // Font color set to white
                                ),
                              ),
                            ],
                          ),
                        ),
                        children: groupedThemesData[key]!.map((_theme) {
                          // Filter schedule data based on theme ID
                          var filteredScheduleData = scheduleDataArr.where((scheduleItem) {
                            return scheduleItem.TH_ID == _theme.TH_ID;
                          }).toList();

                          if (filteredScheduleData.isNotEmpty) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4.0),
                              child: GestureDetector(
                                onTap: () {
                                  // Navigate to track details
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => TracksDetailView(themeData: filteredScheduleData),
                                    ),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(234, 242, 255, 1), // Light blue background for each item
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  padding: EdgeInsets.all(16.0),
                                  child: Align(
                                    alignment: Alignment.centerLeft, // Aligns text to the left
                                    child: Text(
                                      _theme.TH_THEME,
                                      style: TextStyle(
                                        color: Color.fromRGBO(70, 116, 167, 1), // Consistent text color for items
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return SizedBox.shrink(); // If no schedule data, return empty widget
                          }
                        }).toList(),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
      bottomNavigationBar: FooterView(), // Add footer at the bottom
    );
  }
}

class TracksViewPreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TracksView(),
    );
  }
}
