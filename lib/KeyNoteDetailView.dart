import 'package:flutter/material.dart';
import 'footerview.dart'; // Import footer view
import 'taskSummaryView.dart'; // Import your task summary view
import 'data_fetcher.dart'; 
import 'data_struct.dart';

class KeyNoteDetailView extends StatefulWidget {
  final dynamic keyNoteSpeaker;

  KeyNoteDetailView({required this.keyNoteSpeaker});

  @override
  _KeyNoteDetailViewState createState() => _KeyNoteDetailViewState();
}

class _KeyNoteDetailViewState extends State<KeyNoteDetailView> {
  Set<int> favoritedItems = {};
 

  @override
  Widget build(BuildContext context) {
    // Access schedule data from DataManager
    List<ScheduleStruct> filteredAuthorData = DataManager().schedules.where((scheduleItem) {
      return scheduleItem.AU_ID == widget.keyNoteSpeaker.CMB_ID;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text( widget.keyNoteSpeaker.PD_NAME,
            style: TextStyle(
            color: Colors.white, // Set your desired color here
          ),),
        backgroundColor: Color.fromRGBO(70, 116, 167, 1), // Use specified color
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0), 
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage('${DataManager().allUrls["keynoteSpeakersPhotoUrl"]}${widget.keyNoteSpeaker.CMB_ID}.png'),
                onBackgroundImageError: (error, stackTrace) {
                  return null; 
                },
                child: Icon(
                  Icons.person, 
                  size: 50,
                  color: Colors.grey, 
                ),
              ),
              SizedBox(height: 10),
              Text(
                widget.keyNoteSpeaker.PD_NAME,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color.fromRGBO(70, 116, 167, 1), // Use specified color
                ),
              ),
              SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.keyNoteSpeaker.PD_WORKPROFILE),
                  Text(widget.keyNoteSpeaker.PD_ORGANIZATION),
                  Text(widget.keyNoteSpeaker.PD_COUNTRY),
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
                    child: Stack( 
                      children: [
                        Column( 
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: ListTile(
                                    title: Text(
                                      '${authPaper.EVT_PAPER_EVENT_PAPERID} (${authPaper.EVT_TYPE})',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(70, 116, 167, 1), 
                                        fontSize: 13,
                                      ),
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          authPaper.EVT_TITLE,
                                          style: TextStyle(color: const Color.fromARGB(255, 35, 35, 36), fontSize: 13), 
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          'Session: ${authPaper.TH_THEME}',
                                          style: TextStyle(color: const Color.fromARGB(255, 35, 35, 36), fontSize: 12),
                                        ),
                                        SizedBox(height: 5),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(authPaper.SLOT_VENUE1),
                                            Text('${authPaper.SLOT_START} - ${authPaper.SLOT_DATE}'),
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
                          ],
                        ),
                      ],
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
