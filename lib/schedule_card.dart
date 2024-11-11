import 'package:flutter/material.dart';
import 'data_struct.dart';
import 'taskSummaryView.dart';

class ScheduleCard extends StatelessWidget {
  final ScheduleStruct event;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;

  ScheduleCard({
    required this.event,
    required this.isFavorite,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
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
          color: Color.fromRGBO(234, 242, 255, 1),
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
            _buildEventTitle(),
            SizedBox(height: 4),
            _buildEventSubtitle(),
            SizedBox(height: 4),
            _buildSessionInfo(),
            SizedBox(height: 4),
            _buildAuthorInfo(),
            SizedBox(height: 4),
            _buildVenue(),
            SizedBox(height: 4),
            _buildTime(),
          ],
        ),
      ),
    );
  }

  // Helper method for event title
  Widget _buildEventTitle() {
    return Row(
      children: [
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
        Spacer(),
        IconButton(
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: Colors.red,
          ),
          onPressed: onFavoriteToggle,
        ),
      ],
    );
  }

  // Helper method for event subtitle
  Widget _buildEventSubtitle() {
    return Text(
      event.EVT_TITLE,
      style: TextStyle(
        color: Color.fromRGBO(30, 51, 149, 1),
        fontSize: 13,
      ),
    );
  }

  // Helper method for session info
  Widget _buildSessionInfo() {
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
  Widget _buildAuthorInfo() {
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
  Widget _buildVenue() {
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
  Widget _buildTime() {
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
