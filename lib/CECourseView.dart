import 'package:flutter/material.dart';
import 'data_fetcher.dart'; // Import your data fetcher
import 'data_struct.dart';  // Import your data structure

class CECourseView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CE Course"),
      ),
      body: FutureBuilder<List<CECourseStruct>>(
        future: fetchCECoursedata('https://geoindia2024-default-rtdb.asia-southeast1.firebasedatabase.app/tabs/data/CECOURSES.json'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No courses found.'));
          } else {
            List<CECourseStruct> ceCourses = snapshot.data!;
            return ListView.builder(
              itemCount: ceCourses.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Color.fromRGBO(111, 222, 155, 0.5), // Use a similar background color
                  child: ListTile(
                    leading: Icon(Icons.arrow_forward, color: Colors.green),
                    title: Text(
                      ceCourses[index].ceTitle,
                      style: TextStyle(color: Colors.green),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CECourseDetailView(ceCourse: ceCourses[index]),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

class CECourseDetailView extends StatelessWidget {
  final CECourseStruct ceCourse;

  CECourseDetailView({required this.ceCourse});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ceCourse.ceTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Course Description: ${ceCourse.ceCourseDesc}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Objective: ${ceCourse.ceObjective}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text('Date: ${ceCourse.ceDate}', style: TextStyle(fontSize: 16)),
            // Add more details as needed
          ],
        ),
      ),
    );
  }
}
