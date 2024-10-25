import 'package:flutter/material.dart';
import 'data_struct.dart'; // Import persons structure
import 'data_fetcher.dart'; // Import DataManager for schedule data
import 'footerview.dart';
import 'taskSummaryView.dart';

class AuthorsDetailView extends StatefulWidget {
  final PersonsStruct author;

  AuthorsDetailView({required this.author});

  @override
  _AuthorsDetailViewState createState() => _AuthorsDetailViewState();
}

class _AuthorsDetailViewState extends State<AuthorsDetailView> {
  Set<int> favoritedItems = {};

  @override
  Widget build(BuildContext context) {
    // Filter schedule data based on the author's ID
    List<ScheduleStruct> filteredAuthorData = DataManager().schedules.where((scheduleItem) {
      return scheduleItem.AU_ID == widget.author.CMB_ID;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Author Details'),
        backgroundColor: Color.fromRGBO(70, 116, 167, 1), // Use specified color
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, // Center align the column content
            children: [
              // Centered Avatar and Name
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage('https://yourimageurl/${widget.author.CMB_ID}.png'), // Example image URL
                onBackgroundImageError: (error, stackTrace) {
                  // Return null to use the default icon when the image fails to load
                  return null; 
                },
                child: Icon(
                  Icons.person, // Fallback icon if the image fails to load
                  size: 50,
                  color: Colors.grey, // Icon color
                ),
              ),
              SizedBox(height: 10),
              Text(
                widget.author.PD_NAME,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color.fromRGBO(70, 116, 167, 1), // Use specified color
                ),
                textAlign: TextAlign.center, // Center align the text
              ),
              SizedBox(height: 10),
              // Work profile, organization, and country
              Column(
                crossAxisAlignment: CrossAxisAlignment.center, // Center align these texts as well
                children: [
                  Text(widget.author.PD_WORKPROFILE, maxLines: 2, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center), // Prevent overflow
                  Text(widget.author.PD_ORGANIZATION, maxLines: 1, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
                  Text(widget.author.PD_COUNTRY, maxLines: 1, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
                ],
              ),
              SizedBox(height: 20),
              ListView.builder(
                shrinkWrap: true,  
                physics: NeverScrollableScrollPhysics(),
                itemCount: filteredAuthorData.length,
                itemBuilder: (context, index) {
                  var authPaper = filteredAuthorData[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start, // Align items to the start
                        children: [
                          // Row with Favorite Icon
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  '${authPaper.EVT_PAPER_EVENT_PAPERID} (${authPaper.EVT_TYPE})',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(70, 116, 167, 1), // Use specified color
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  favoritedItems.contains(index) ? Icons.favorite : Icons.favorite_border,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  setState(() {
                                    // Toggle the favorite status
                                    if (favoritedItems.contains(index)) {
                                      favoritedItems.remove(index);
                                    } else {
                                      favoritedItems.add(index);
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                          // Subtitle
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                authPaper.EVT_TITLE,
                                style: TextStyle(color: Color.fromRGBO(70, 116, 167, 1), fontSize: 12), // Use specified color
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis, // Prevent overflow
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
                                  Flexible(
                                    child: Text(authPaper.SLOT_VENUE1, overflow: TextOverflow.ellipsis), // Prevent overflow
                                  ),
                                  Text('${authPaper.SLOT_START} - ${authPaper.SLOT_DATE}'),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: FooterView(), // Include footer view
    );
  }
}
