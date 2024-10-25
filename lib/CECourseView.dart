import 'package:flutter/material.dart';
import 'data_fetcher.dart'; 
import 'data_struct.dart';
import 'footerview.dart';
import 'CECourseDetailView.dart';

class CECourseView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ceCourses = DataManager().ceCourses; 

    return Scaffold(
      appBar: AppBar(
        title: Text("CE Course"),
        backgroundColor: Color.fromRGBO(70, 116, 167, 1), 
      ),
      body: ceCourses.isEmpty 
          ? Center(child: CircularProgressIndicator()) // Show loader if data is empty initially
          : ceCourses.isNotEmpty
              ? ListView.builder(
                  itemCount: ceCourses.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Color.fromRGBO(70, 116, 167, 1), // Use a similar background color
                      child: ListTile(
                        leading: Icon(Icons.arrow_forward, color: Colors.white),
                        title: Text(
                          ceCourses[index].CE_TITLE,
                          style: TextStyle(color: Colors.white),
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
                )
              : Center(child: Text('No courses found.')),
      bottomNavigationBar: FooterView(), // Add the FooterView here
    );
  }
}
