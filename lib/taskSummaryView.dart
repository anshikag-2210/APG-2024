import 'package:flutter/material.dart';
import 'data_fetcher.dart'; // Import the fetch function
import 'data_struct.dart'; // Import ScheduleStruct
import 'footerview.dart';
import 'package:flutter/material.dart';

class TaskSummaryView extends StatefulWidget {
  final ScheduleStruct event;

  TaskSummaryView({required this.event});

  @override
  _TaskSummaryViewState createState() => _TaskSummaryViewState();
}

class _TaskSummaryViewState extends State<TaskSummaryView> {
  bool isFavorited = false;
  String imageName = 'heart';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paper Details'),
        backgroundColor: Color.fromRGBO(70, 116, 167, 1), 
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Paper ID and Favorite Icon
              Row(
                children: [
                  Text(
                    widget.event.EVT_PAPER_EVENT_PAPERID,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(70, 116, 167, 1),
                      fontSize: 16,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(
                      isFavorited ? Icons.favorite : Icons.favorite_border,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      setState(() {
                        isFavorited = !isFavorited;
                        imageName = isFavorited ? 'heart.fill' : 'heart';
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              _buildSection('Title', widget.event.EVT_TITLE),
              SizedBox(height: 20),
              _buildSection('Session', widget.event.TH_THEME),
              SizedBox(height: 20),
              _buildSection('Author', widget.event.AU_NAME),
              SizedBox(height: 20),
              _buildSection('Co-Authors', widget.event.EVT_COAUTHORS),
              SizedBox(height: 20),
              _buildSection('Presenting Author', widget.event.AU_NAME),
              SizedBox(height: 20),
              _buildSection('Brief', widget.event.TH_THEME),
            ],
          ),
        ),
      ),
      bottomNavigationBar: FooterView(),
    );
  }

  // Helper function to build sections with title and content
  Widget _buildSection(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(70, 116, 167, 1),
          ),
        ),
        Divider(),
        Text(content),
      ],
    );
  }
}
