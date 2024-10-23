import 'dart:convert';
import 'package:http/http.dart' as http;
import 'data_struct.dart';

//data urls
String ceCourseUrl = 'https://geoindia2024-default-rtdb.asia-southeast1.firebasedatabase.app/tabs/data/CECOURSES.json'; 
String scheduleUrl = 'https://geoindia2024-default-rtdb.asia-southeast1.firebasedatabase.app/tabs/data/V_SCHEDULE.json';
String personsUrl = 'https://geoindia2024-default-rtdb.asia-southeast1.firebasedatabase.app/tabs/data/PERSONS.json';
String themeUrl = 'https://geoindia2024-default-rtdb.asia-southeast1.firebasedatabase.app/tabs/data/THEMES.json'; 
String organizationsUrl = 'https://geoindia2024-default-rtdb.asia-southeast1.firebasedatabase.app/tabs/data/ORGANIZATIONS.json';
String galleryUrl = 'https://spg23-03112023-default-rtdb.asia-southeast1.firebasedatabase.app/tabs/data/IMAGES.json';

class DataManager {
  static final DataManager _instance = DataManager._internal();

  factory DataManager() {
    return _instance;
  }

  DataManager._internal();

  List<CECourseStruct> ceCourses = [];
  List<ScheduleStruct> schedules = [];
  List<PersonsStruct> persons = [];
  List<ThemeStruct> themesData = [];
  List<OrganizationsStruct> orgData = [];
  List<GalleryStruct> galleryData = [];

Future<void> fetchData() async {
  try {
    await fetchCECoursedata();
    print('CE Courses data fetched successfully');
  } catch (e) {
    print('Error fetching CE Courses data: $e');
  }

  try {
    await fetchScheduleData();
    print('Schedule data fetched successfully');
  } catch (e) {
    print('Error fetching Schedule data: $e');
  }

  try {
    await fetchPersonsData();
    print('Persons data fetched successfully');
  } catch (e) {
    print('Error fetching Persons data: $e');
  }

  try {
    await fetchThemeData();
    print('Theme data fetched successfully');
  } catch (e) {
    print('Error fetching Theme data: $e');
  }

  try {
    await fetchOrgdata();
    print('Org data fetched successfully');
  } catch (e) {
    print('Error fetching Org data: $e');
  }

  try {
    await fetchGallerydata();
    print('Gallery data fetched successfully');
  } catch (e) {
    print('Error fetching Gallery data: $e');
  }
}


  Future<void> fetchCECoursedata() async {
    final response = await http.get(Uri.parse(ceCourseUrl));
    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      ceCourses = jsonData.map((data) => CECourseStruct.fromJson(data)).toList().cast<CECourseStruct>();
    } else {
      throw Exception('Failed to load data from Firebase');
    }
  }

  Future<void> fetchScheduleData() async {
    final response = await http.get(Uri.parse(scheduleUrl));
    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      schedules = jsonData.map((data) => ScheduleStruct.fromJson(data)).toList().cast<ScheduleStruct>();
    } else {
      throw Exception('Failed to load data from Firebase');
    }
  }

  Future<void> fetchPersonsData() async {
    final response = await http.get(Uri.parse(personsUrl));
    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      persons = jsonData.map((data) => PersonsStruct.fromJson(data)).toList().cast<PersonsStruct>();
    } else {
      throw Exception('Failed to load data from Firebase');
    }
  }

  Future<void> fetchThemeData() async {
    final response = await http.get(Uri.parse(themeUrl));
    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      themesData = jsonData.map((data) => ThemeStruct.fromJson(data)).toList().cast<ThemeStruct>();
    } else {
      throw Exception('Failed to load data from Firebase');
    }
  }

  Future<void> fetchOrgdata() async {
    final response = await http.get(Uri.parse(organizationsUrl));
    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      orgData = jsonData.map((data) => OrganizationsStruct.fromJson(data)).toList().cast<OrganizationsStruct>();
    } else {
      throw Exception('Failed to load data from Firebase');
    }
  }

  Future<void> fetchGallerydata() async {
    final response = await http.get(Uri.parse(galleryUrl));
    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      galleryData = jsonData.map((data) => GalleryStruct.fromJson(data)).toList().cast<GalleryStruct>();
    } else {
      throw Exception('Failed to load data from Firebase');
    }
  }


}

