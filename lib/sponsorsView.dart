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
        title: Text('Sponsors'),
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
                    width: double.infinity,
                    padding: EdgeInsets.only(left: 0.0, top: 8.0, bottom: 8.0), // Use vertical padding only
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
                  backgroundColor: Colors.transparent, // Use transparent to blend with the heading
                  collapsedIconColor: Colors.white,
                  iconColor: Colors.white,
                  children: sponsorsForKey.map((sponsor) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
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
                          child: Column(
                            children: [
                              Container(
                                constraints: BoxConstraints(
                                  maxHeight: 200,
                                ),
                                child: Image.network(
                                  'https://yourimageurl/CMP_${sponsor.CMB_ID}.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  sponsor.OS_NAME,
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
      bottomNavigationBar: FooterView(), // Assuming FooterView is already defined
    );
  }
}
