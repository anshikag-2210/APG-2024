import 'package:flutter/material.dart';
import 'data_struct.dart';
import 'taskSummaryView.dart';

class ScheduleDetailsView extends StatefulWidget {
  final List<ScheduleStruct> dayData;

  ScheduleDetailsView({required this.dayData});

  @override
  _ScheduleDetailsViewState createState() => _ScheduleDetailsViewState();
}

class _ScheduleDetailsViewState extends State<ScheduleDetailsView> {
  // To track the favorite status of each event
  List<bool> favoriteStatus = [];

  @override
  void initState() {
    super.initState();
    // Initialize the favorite status list
    favoriteStatus = List<bool>.filled(widget.dayData.length, false);
  }

  @override
  Widget build(BuildContext context) {
    print("dayData length: ${widget.dayData.length}");
    if (widget.dayData.isEmpty) {
      return Center(child: Text("No events available"));
    }
    return ListView.builder(
      itemCount: widget.dayData.length,
      itemBuilder: (context, index) {
        ScheduleStruct event = widget.dayData[index];
        return _buildEventItem(context, event, index);
      },
    );
  }

  // Method to build individual event item
  Widget _buildEventItem(BuildContext context, ScheduleStruct event, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TaskSummaryView(event: event),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color:Color.fromRGBO(234, 242, 255, 1),
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildEventTitle(event, index),
            SizedBox(height: 4),
            _buildEventSubtitle(event),
            SizedBox(height: 4),
            _buildSessionInfo(event),
            SizedBox(height: 4),
            _buildAuthorInfo(event),
            SizedBox(height: 4),
            _buildVenue(event),
            SizedBox(height: 4),
            _buildTime(event),
          ],
        ),
      ),
    );
  }

  // Helper method for event title
  Widget _buildEventTitle(ScheduleStruct event, int index) {
    return Row(
      children: [
        // Event Paper ID and Type
        Text(
          event.EVT_PAPER_EVENT_PAPERID,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(70, 116, 167, 1),
            fontSize: 13,
          ),
        ),
        Text(
          " (${event.EVT_TYPE})",
          style: TextStyle(color: Color.fromRGBO(70, 116, 167, 1), fontSize: 13),
        ),
        // Favorite button aligned to the right of the row
        Spacer(),
        IconButton(
          icon: Icon(
            favoriteStatus[index] == true
                ? Icons.favorite
                : Icons.favorite_border,
            color: Colors.red,
          ),
          onPressed: () {
            setState(() {
              favoriteStatus[index] = !favoriteStatus[index]!;
            });
          },
        ),
      ],
    );
  }

  // Helper method for event subtitle
  Widget _buildEventSubtitle(ScheduleStruct event) {
    return Text(
      event.EVT_TITLE,
      style: TextStyle(
        color: Color.fromRGBO(30, 51, 149, 1),
        fontSize: 13,
      ),
    );
  }

  // Helper method for session info
  Widget _buildSessionInfo(ScheduleStruct event) {
    return Row(
      children: [
        Text(
          "Session: ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 35, 35, 36),
            fontSize: 11,
          ),
        ),
        Expanded(
          child: Text(
            event.TH_THEME,
            style: TextStyle(color: Color.fromARGB(255, 35, 35, 36), fontSize: 12),
          ),
        ),
      ],
    );
  }

  // Helper method for author info
  Widget _buildAuthorInfo(ScheduleStruct event) {
    return Row(
      children: [
        Text(
          "Author: ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 35, 35, 36),
            fontSize: 11,
          ),
        ),
        Expanded(
          child: Text(
            event.AU_NAME,
            style: TextStyle(color: Color.fromARGB(255, 35, 35, 36), fontSize: 12),
          ),
        ),
      ],
    );
  }

  // Helper method for venue info
  Widget _buildVenue(ScheduleStruct event) {
    return Row(
      children: [
        Text(
          "Venue: ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 35, 35, 36),
            fontSize: 11,
          ),
        ),
        Expanded(
          child: Text(
            event.SLOT_VENUE1,
            style: TextStyle(color: Color.fromARGB(255, 35, 35, 36), fontSize: 12),
          ),
        ),
      ],
    );
  }

  // Helper method for time info
  Widget _buildTime(ScheduleStruct event) {
    return Row(
      children: [
        Text(
          "Time: ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 35, 35, 36),
            fontSize: 11,
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Text(event.SLOT_DATE),
              Text("   ("),
              Text(event.SLOT_START),
              Text(" - "),
              Text(event.SLOT_END),
              Text(" )"),
            ],
          ),
        ),
      ],
    );
  }
}
