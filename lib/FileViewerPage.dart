import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';
import 'dart:io';
import 'footerview.dart'; 

class FileViewerPage extends StatefulWidget {
  final String fileUrl;
  final String title;

  FileViewerPage({required this.fileUrl, required this.title});

  @override
  _FileViewerPageState createState() => _FileViewerPageState();
}

class _FileViewerPageState extends State<FileViewerPage> {
  String? localFilePath;
  bool isLoading = true;
  bool isPdf = false;

  @override
  void initState() {
    super.initState();
    _downloadAndDetermineFileType();
  }

  Future<void> _downloadAndDetermineFileType() async {
    try {
      // Get application directory
      final directory = await getApplicationDocumentsDirectory();

      // Create 'APG-2024' folder if not exists
      final downloadsDir = Directory('${directory.path}/APG-2024');
      if (!await downloadsDir.exists()) await downloadsDir.create();

      // Get file extension and process path
      final fileUrl = widget.fileUrl.split('?').first;
      final fileExtension = fileUrl.split('.').last.toLowerCase();
      final fileName = '${widget.title.replaceAll(' ', '_')}.$fileExtension';
      final filePath = '${downloadsDir.path}/$fileName';

      setState(() {
        isPdf = fileExtension == 'pdf';
      });

      // Check if file exists or needs download
      if (await File(filePath).exists()) {
        setState(() {
          localFilePath = filePath;
          isLoading = false;
        });
      } else {
        await _downloadFile(widget.fileUrl, filePath);
      }
    } catch (e) {
      print("Error in file download or processing: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _downloadFile(String url, String savePath) async {
    try {
      await Dio().download(url, savePath);
      setState(() {
        localFilePath = savePath;
        isLoading = false;
      });
    } catch (e) {
      print("Error downloading file: $e");
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title),
      backgroundColor: Color.fromRGBO(70, 116, 167, 1),),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : localFilePath != null
              ? isPdf
                  ? SfPdfViewer.file(File(localFilePath!)) // Display PDF
                  : Image.file(File(localFilePath!), fit: BoxFit.contain) // Display image
              : Center(child: Text("Failed to load file.")),
   bottomNavigationBar: FooterView(),
    );
  }
}
