import 'package:flutter/material.dart';
import 'data_struct.dart'; // Import persons structure
import 'TaskSummaryView.dart'; // Import TaskSummaryView
import 'data_fetcher.dart'; // Import DataManager for schedule data
import 'footerview.dart';

class AuthorsDetailView extends StatefulWidget {
  final PersonsStruct author;

  AuthorsDetailView({required this.author});

  @override
  _AuthorsDetailViewState createState() => _AuthorsDetailViewState();
}

class _AuthorsDetailViewState extends State<AuthorsDetailView> {
  bool isFavorited = false;

  @override
  Widget build(BuildContext context) {
    // Access schedule data from DataManager
    List<ScheduleStruct> filteredAuthorData = DataManager().schedules.where((scheduleItem) {
      return scheduleItem.AU_ID == widget.author.CMB_ID;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Author Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Add padding for better layout
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage('https://yourimageurl/${widget.author.CMB_ID}.png'), // Example image
              ),
              SizedBox(height: 10),
              Text(
                widget.author.PD_NAME,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color.fromRGBO(84, 152, 118, 1),
                ),
              ),
              SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.author.PD_WORKPROFILE),
                  Text(widget.author.PD_ORGANIZATION),
                  Text(widget.author.PD_COUNTRY),
                ],
              ),
              SizedBox(height: 20),
              // ListView to display author's papers
              ListView.builder(
                shrinkWrap: true,  // Needed to ensure list is scrollable within scroll view
                physics: NeverScrollableScrollPhysics(),
                itemCount: filteredAuthorData.length,
                itemBuilder: (context, index) {
                  var authPaper = filteredAuthorData[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      title: Text(
                        '${authPaper.EVT_PAPER_EVENT_PAPERID} (${authPaper.EVT_TYPE})',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                          fontSize: 13,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            authPaper.EVT_TITLE,
                            style: TextStyle(color: Colors.green, fontSize: 12),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Session: ${authPaper.TH_THEME}',
                            style: TextStyle(color: Colors.grey, fontSize: 11),
                          ),
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(authPaper.SLOT_VENUE1),
                              Text('${authPaper.SLOT_START} - ${authPaper.SLOT_DATE}'),
                              IconButton(
                                icon: Icon(
                                  isFavorited ? Icons.favorite : Icons.favorite_border,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  setState(() {
                                    isFavorited = !isFavorited;
                                    // Implement your add to favorites logic here
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TaskSummaryView(event: authPaper),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
     bottomNavigationBar: FooterView(),);
  }
}
