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
        title: Text("CE Courses",
          style: TextStyle(
            color: Colors.white, // Set your desired color here
          ),),
        backgroundColor: Color.fromRGBO(70, 116, 167, 1),
      ),
      body: ceCourses.isEmpty
          ? Center(child: CircularProgressIndicator()) // Loader if data is empty
          : ListView.builder(
              itemCount: ceCourses.length,
              itemBuilder: (context, index) {
                var course = ceCourses[index];
                return GestureDetector(
                  onTap: () {
                    // Navigate to detailed view of each CE Course
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CECourseDetailView(ceCourse: course),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.lightBlue[50],
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.arrow_forward, color: Color.fromRGBO(70, 116, 167, 1)),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            course.CE_TITLE,
                            style: TextStyle(
                              color: Color.fromRGBO(70, 116, 167, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      bottomNavigationBar: FooterView(), // FooterView component
    );
  }
}
