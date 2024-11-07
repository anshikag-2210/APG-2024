import 'package:flutter/material.dart';
import 'data_struct.dart';
import 'taskSummaryView.dart';

class ScheduleDetailsView extends StatelessWidget {
  final List<ScheduleStruct> dayData;

  ScheduleDetailsView({required this.dayData});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dayData.length,
      itemBuilder: (context, index) {
        ScheduleStruct event = dayData[index];
        
        return GestureDetector(
          onTap: () {
            // Navigate to the task summary view, replace with your actual navigation
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TaskSummaryView(event: event)),
            );
          },
             child: Container(
            margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            decoration: BoxDecoration(
              color: Colors.lightBlue[50], 
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: Offset(3, 30),
                ),
              ],
            ),
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 4,
                  children: [
                    Text(
                      event.EVT_PAPER_EVENT_PAPERID,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(70, 116, 167, 1),
                          fontSize: 13),
                    ),
                    Text(
                      "(",
                      style: TextStyle(color: Color.fromRGBO(70, 116, 167, 1)),
                    ),
                    Text(
                      event.EVT_TYPE,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(70, 116, 167, 1),
                          fontSize: 13),
                    ),
                    Text(
                      ")",
                      style: TextStyle(color: Color.fromRGBO(70, 116, 167, 1)),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Text(
                  event.EVT_TITLE,
                  style: TextStyle(
                      color: Color.fromRGBO(30, 51, 149, 1), fontSize: 13),
                ),
                SizedBox(height: 4),
                Wrap(
                  spacing: 4,
                  runSpacing: 4,
                  children: [
                    Text(
                      "Session: ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 35, 35, 36),
                          fontSize: 11),
                    ),
                    Text(
                      event.TH_THEME,
                      style: TextStyle(
                          color: Color.fromARGB(255, 35, 35, 36), fontSize: 12),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Wrap(
                  spacing: 4,
                  runSpacing: 4,
                  children: [
                    Text(
                      "Author: ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 35, 35, 36),
                          fontSize: 11),
                    ),
                    Text(
                      event.AU_NAME,
                      style: TextStyle(
                          color: Color.fromARGB(255, 35, 35, 36), fontSize: 12),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  children: [
                    Text(event.SLOT_VENUE1),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(event.SLOT_START),
                        Text(" - "),
                        Text(event.SLOT_DATE),
                      ],
                    ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Icon(Icons.favorite_border, color: Colors.red),
                    ),
                  ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
