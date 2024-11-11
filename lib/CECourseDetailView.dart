import 'package:flutter/material.dart';
import 'data_struct.dart';
import 'footerview.dart'; 

class CECourseDetailView extends StatelessWidget {
  final CECourseStruct ceCourse; // Receive the data
  // Constructor to accept the course data
  CECourseDetailView({required this.ceCourse});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Text(ceCourse.CE_COURSEID,
            style: TextStyle(
            color: Colors.white, // Set your desired color here
          ),),
       backgroundColor: Color.fromRGBO(70, 116, 167, 1), 
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildDetailSection("Title", ceCourse.CE_TITLE),
              buildDetailSection("Course No.", ceCourse.CE_COURSEID),
              buildDetailSection("Theme", ceCourse.CE_THEME),
              buildDetailSection("Course Date", ceCourse.CE_DATE),
              buildDetailSection("Course Description", ceCourse.CE_COURSE_DESC),
              buildDetailSection("Course Objective", ceCourse.CE_OBJECTIVE),
              buildDetailSection("Course Outline", ceCourse.CE_OUTLINE),
              buildDetailSection("Faculty", ceCourse.CE_FACULTY),
              buildDetailSection("Organization", ceCourse.CE_FACULTY_DESC),
            ],
          ),
        ),
      ),
    bottomNavigationBar: FooterView(),
    );
  }

  // Helper method to build each detail section
  Widget buildDetailSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromRGBO(70, 116, 167, 1),),
          ),
          SizedBox(height: 4), // Spacing
          Text(content),
          Divider(), // Divider line
        ],
      ),
    );
  }
}
