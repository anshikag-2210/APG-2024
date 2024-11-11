import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'data_struct.dart';
import 'footerview.dart';

class FullScreenImageViewer extends StatelessWidget {
  final List<GalleryStruct> images;
  final int initialIndex;

  FullScreenImageViewer({required this.images, required this.initialIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gallery View",
          style: TextStyle(
            color: Colors.white, // Set your desired color here
          ),),
        backgroundColor: Color.fromRGBO(70, 116, 167, 1),
      ),
      body: PhotoViewGallery.builder(
        scrollPhysics: const BouncingScrollPhysics(),
        builder: (BuildContext context, int index) {
          String imageUrl = images[index].IM_PATH;
          return PhotoViewGalleryPageOptions(
            imageProvider: NetworkImage(imageUrl),
            initialScale: PhotoViewComputedScale.contained,
            heroAttributes: PhotoViewHeroAttributes(tag: images[index].IM_PATH),
          );
        },
        itemCount: images.length,
        loadingBuilder: (context, event) {
          // Safely handle expectedTotalBytes
          final totalBytes = event?.expectedTotalBytes ?? 0;
          return Center(
            child: SizedBox(
              width: 20.0,
              height: 20.0,
              child: CircularProgressIndicator(
                value: totalBytes == 0
                    ? 0
                    : event!.cumulativeBytesLoaded / totalBytes,
              ),
            ),
          );
        },
        backgroundDecoration: BoxDecoration(color: Colors.black),
        pageController: PageController(initialPage: initialIndex),
        onPageChanged: (index) {
          // Handle page change if needed
        },
      ),
      bottomNavigationBar: FooterView(),
    );
  }
}
