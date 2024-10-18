class CECourseStruct {
  final String ceCourseId;
  final String ceFaculty;
  final String ceFacultyDesc;
  final String ceFacultyId;
  final String ceId;
  final String ceTheme;
  final String ceTitle;
  final String cmbId;
  final String ceCourseDesc;
  final String ceDate;
  final String ceOutline;
  final String ceObjective;

  CECourseStruct({
    required this.ceCourseId,
    required this.ceFaculty,
    required this.ceFacultyDesc,
    required this.ceFacultyId,
    required this.ceId,
    required this.ceTheme,
    required this.ceTitle,
    required this.cmbId,
    required this.ceCourseDesc,
    required this.ceDate,
    required this.ceOutline,
    required this.ceObjective,
  });

  factory CECourseStruct.fromJson(Map<String, dynamic> json) {
    return CECourseStruct(
      ceCourseId: json['CE_COURSEID'],
      ceFaculty: json['CE_FACULTY'],
      ceFacultyDesc: json['CE_FACULTY_DESC'],
      ceFacultyId: json['CE_FACULTY_ID'],
      ceId: json['CE_ID'],
      ceTheme: json['CE_THEME'],
      ceTitle: json['CE_TITLE'],
      cmbId: json['CMB_ID'],
      ceCourseDesc: json['CE_COURSE_DESC'],
      ceDate: json['CE_DATE'],
      ceOutline: json['CE_OUTLINE'],
      ceObjective: json['CE_OBJECTIVE'],
    );
  }
}
