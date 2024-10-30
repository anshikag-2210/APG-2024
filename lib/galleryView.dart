import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'data_fetcher.dart';
import 'data_struct.dart';
import 'FullScreenImageView.dart';
import 'footerview.dart';

class GalleryView extends StatefulWidget {
  @override
  _GalleryViewState createState() => _GalleryViewState();
}

class _GalleryViewState extends State<GalleryView> {
  List<GalleryStruct> galleryData = [];

  @override
  void initState() {
    super.initState();
    _loadGalleryData();
  }

  Future<void> _loadGalleryData() async {
    try {
      await DataManager().fetchGallerydata();
      setState(() {
        galleryData = DataManager().galleryData;
      });
    } catch (e) {
      print("Failed to load gallery data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, List<GalleryStruct>> groupedPhotos = galleryData.fold<Map<String, List<GalleryStruct>>>(
      {},
      (map, item) {
        final category = item.IM_CATEGORY ?? 'Other';
        map[category] = [...?map[category], item];
        return map;
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Gallery"),
        backgroundColor: Color.fromRGBO(70, 116, 167, 1),
      ),
      body: groupedPhotos.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView(
              children: groupedPhotos.entries.map((entry) {
                String categoryKey = entry.key;
                List<GalleryStruct> photosForCategory = entry.value;

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: Color.fromRGBO(70, 116, 167, 1),
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          categoryKey.toUpperCase(),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: photosForCategory.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 2,
                          mainAxisSpacing: 2,
                        ),
                        itemBuilder: (context, index) {
                          String imageUrl = 'https://spg23-03112023.web.app/images/${photosForCategory[index].IM_PATH}';
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FullScreenImageViewer(
                                    images: photosForCategory,
                                    initialIndex: index,
                                  ),
                                ),
                              );
                            },
                            child: Image.network(
                              imageUrl,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) => Icon(
                                Icons.broken_image,
                                color: Colors.grey,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
    bottomNavigationBar: FooterView(),
    );
  }
}
