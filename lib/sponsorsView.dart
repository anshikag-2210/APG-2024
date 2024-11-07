import 'package:flutter/material.dart';
import 'data_fetcher.dart';
import 'UrlView.dart';
import 'footerview.dart';

class SponsorsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sponsorsData = DataManager().orgData.where((org) => org.OS_TYPE == 'SPONSOR').toList();

    // Group sponsors by subtype
    final groupedSponsors = <String, List<dynamic>>{};
    for (var sponsor in sponsorsData) {
      final subtype = sponsor.OS_SUBTYPE ?? 'Other'; // Use 'Other' for null values
      groupedSponsors[subtype] ??= [];
      groupedSponsors[subtype]!.add(sponsor);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('SPONSORS',
          style: TextStyle(
            color: Colors.white, // Set your desired color here
          ),
        ),
        backgroundColor: Color.fromRGBO(70, 116, 167, 1),
      ),
      body: groupedSponsors.isEmpty
          ? Center(child: Text("No sponsors available."))
          : ListView.builder(
              itemCount: groupedSponsors.keys.length,
              itemBuilder: (context, index) {
                String subtypeKey = groupedSponsors.keys.elementAt(index);
                var sponsorsForKey = groupedSponsors[subtypeKey]!;

                return ExpansionTile(
                  title: Container(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(70, 116, 167, 1),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Center(
                      child: Text(
                        subtypeKey,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  collapsedIconColor: Color.fromRGBO(70, 116, 167, 1),
                  iconColor:  Color.fromRGBO(70, 116, 167, 1),
                  children: sponsorsForKey.map((sponsor) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                      child: GestureDetector(
                        onTap: () {
                          if (sponsor.OS_WEBSITE != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UrlView(
                                  url: sponsor.OS_WEBSITE,
                                  title: sponsor.OS_NAME,
                                ),
                              ),
                            );
                          }
                        },
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Container(
                                      constraints: BoxConstraints(
                                        maxHeight: 200,
                                      ),
                                      child: Image.network(
                                        '${DataManager().allUrls["companyLogoUrl"]}${sponsor.CMB_ID}.png',
                                        fit: BoxFit.cover,
                                        errorBuilder: (context, error, stackTrace) {
                                          return Icon(
                                            Icons.image_not_supported,
                                            size: 100,
                                            color: Colors.grey,
                                          );
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        sponsor.OS_NAME,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromRGBO(70, 116, 167, 1),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
      bottomNavigationBar: FooterView(),
    );
  }
}
