// data_fetcher.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'data_struct.dart';


// ce_course_struct.dart
Future<List<CECourseStruct>> fetchCECoursedata(String url) async {
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    List<dynamic> jsonData = json.decode(response.body);
    
    // Handle cases where the JSON is a list of objects
    return jsonData.map((data) => CECourseStruct.fromJson(data)).toList().cast<CECourseStruct>();
  } else {
    throw Exception('Failed to load data from Firebase');
  }
}
