class CECourseStruct {
  final String CE_COURSEID;
  final String CE_FACULTY;
  final String CE_FACULTY_DESC;
  final String CE_FACULTY_ID;
  final String CE_ID;
  final String CE_THEME;
  final String CE_TITLE;
  final String CMB_ID;
  final String CE_COURSE_DESC;
  final String CE_DATE;
  final String CE_OUTLINE;
  final String CE_OBJECTIVE;

  CECourseStruct({
    required this.CE_COURSEID,
    required this.CE_FACULTY,
    required this.CE_FACULTY_DESC,
    required this.CE_FACULTY_ID,
    required this.CE_ID,
    required this.CE_THEME,
    required this.CE_TITLE,
    required this.CMB_ID,
    required this.CE_COURSE_DESC,
    required this.CE_DATE,
    required this.CE_OUTLINE,
    required this.CE_OBJECTIVE,
  });

  factory CECourseStruct.fromJson(Map<String, dynamic> json) {
    return CECourseStruct(
      CE_COURSEID: json['CE_COURSEID'],
      CE_FACULTY: json['CE_FACULTY'],
      CE_FACULTY_DESC: json['CE_FACULTY_DESC'],
      CE_FACULTY_ID: json['CE_FACULTY_ID'],
      CE_ID: json['CE_ID'],
      CE_THEME: json['CE_THEME'],
      CE_TITLE: json['CE_TITLE'],
      CMB_ID: json['CMB_ID'],
      CE_COURSE_DESC: json['CE_COURSE_DESC'],
      CE_DATE: json['CE_DATE'],
      CE_OUTLINE: json['CE_OUTLINE'],
      CE_OBJECTIVE: json['CE_OBJECTIVE'],
    );
  }
}

class ScheduleStruct {
  final String AU_ID;
  final String AU_NAME;
  final String AU_ORGANIZATION;
  final String AU_WORKPROFILE;
  final String CMB_ID;
  final String EVT_COAUTHORS;
  final String EVT_ID;
  final String EVT_PAPER_EVENT_PAPERID;
  final String EVT_PAPER_ID;
  final String EVT_STATUS;
  final String EVT_TITLE;
  final String EVT_TYPE;
  final String SLOT_DATE;
  final String SLOT_DAY;
  final String SLOT_END;
  final String SLOT_ID;
  final String SLOT_START;
  final String SLOT_VENUE1;
  final String SLOT_VENUE2;
  final String SP_ID;
  final String SP_NAME;
  final String SP_ORGANIZATION;
  final String SP_WORKPROFILE;
  final String TH_ID;
  final String TH_THEME;

  ScheduleStruct({
    required this.AU_ID,
    required this.AU_NAME,
    required this.AU_ORGANIZATION,
    required this.AU_WORKPROFILE,
    required this.CMB_ID,
    required this.EVT_COAUTHORS,
    required this.EVT_ID,
    required this.EVT_PAPER_EVENT_PAPERID,
    required this.EVT_PAPER_ID,
    required this.EVT_STATUS,
    required this.EVT_TITLE,
    required this.EVT_TYPE,
    required this.SLOT_DATE,
    required this.SLOT_DAY,
    required this.SLOT_END,
    required this.SLOT_ID,
    required this.SLOT_START,
    required this.SLOT_VENUE1,
    required this.SLOT_VENUE2,
    required this.SP_ID,
    required this.SP_NAME,
    required this.SP_ORGANIZATION,
    required this.SP_WORKPROFILE,
    required this.TH_ID,
    required this.TH_THEME,
  });

  factory ScheduleStruct.fromJson(Map<String, dynamic> json) {
    return ScheduleStruct(
      AU_ID: json['AU_ID'] ?? '',
      AU_NAME: json['AU_NAME'] ?? '',
      AU_ORGANIZATION: json['AU_ORGANIZATION'] ?? '',
      AU_WORKPROFILE: json['AU_WORKPROFILE'] ?? '',
      CMB_ID: json['CMB_ID'] ?? '',
      EVT_COAUTHORS: json['EVT_COAUTHORS'] ?? '',
      EVT_ID: json['EVT_ID'] ?? '',
      EVT_PAPER_EVENT_PAPERID: json['EVT_PAPER_EVENT_PAPERID'] ?? '',
      EVT_PAPER_ID: json['EVT_PAPER_ID'] ?? '',
      EVT_STATUS: json['EVT_STATUS'] ?? '',
      EVT_TITLE: json['EVT_TITLE'] ?? '',
      EVT_TYPE: json['EVT_TYPE'] ?? '',
      SLOT_DATE: json['SLOT_DATE'] ?? '',
      SLOT_DAY: json['SLOT_DAY'] ?? '',
      SLOT_END: json['SLOT_END'] ?? '',
      SLOT_ID: json['SLOT_ID'] ?? '',
      SLOT_START: json['SLOT_START'] ?? '',
      SLOT_VENUE1: json['SLOT_VENUE1'] ?? '',
      SLOT_VENUE2: json['SLOT_VENUE2'] ?? '',
      SP_ID: json['SP_ID'] ?? '',
      SP_NAME: json['SP_NAME'] ?? '',
      SP_ORGANIZATION: json['SP_ORGANIZATION'] ?? '',
      SP_WORKPROFILE: json['SP_WORKPROFILE'] ?? '',
      TH_ID: json['TH_ID'] ?? '',
      TH_THEME: json['TH_THEME'] ?? '',
    );
  }
}

class ThemeStruct {
  final String CMB_ID;
  final String TH_CODE;
  final String TH_ID;
  final String TH_STATUS;
  final String TH_THEME;
  final String TH_TYPE;
  final String TH_VENUE;

  ThemeStruct({
    required this.CMB_ID,
    required this.TH_CODE,
    required this.TH_ID,
    required this.TH_STATUS,
    required this.TH_THEME,
    required this.TH_TYPE,
    required this.TH_VENUE,
  });

  factory ThemeStruct.fromJson(Map<String, dynamic> json) {
    return ThemeStruct(
      CMB_ID: json['CMB_ID'] ?? '',
      TH_CODE: json['TH_CODE'] ?? '',
      TH_ID: json['TH_ID'] ?? '',
      TH_STATUS: json['TH_STATUS'] ?? '',
      TH_THEME: json['TH_THEME'] ?? '',
      TH_TYPE: json['TH_TYPE'] ?? '',
      TH_VENUE: json['TH_VENUE'] ?? '',
    );
  }
}

class PersonsStruct {
  final String CMB_ID;
  final String PD_COUNTRY;
  final String PD_EMAIL;
  final String PD_NAME;
  final String PD_ORGANIZATION;
  final String PD_PHONE1;
  final String PD_PTYPE;
  final String PD_WORKPROFILE;
  final String PD_BIO;

  PersonsStruct({
    required this.CMB_ID,
    required this.PD_COUNTRY,
    required this.PD_EMAIL,
    required this.PD_NAME,
    required this.PD_ORGANIZATION,
    required this.PD_PHONE1,
    required this.PD_PTYPE,
    required this.PD_WORKPROFILE,
    required this.PD_BIO,
  });

  factory PersonsStruct.fromJson(Map<String, dynamic> json) {
    return PersonsStruct(
      CMB_ID: json['CMB_ID'] ?? '',
      PD_COUNTRY: json['PD_COUNTRY'] ?? '',
      PD_EMAIL: json['PD_EMAIL'] ?? '',
      PD_NAME: json['PD_NAME'] ?? '',
      PD_ORGANIZATION: json['PD_ORGANIZATION'] ?? '',
      PD_PHONE1: json['PD_PHONE1'] ?? '',
      PD_PTYPE: json['PD_PTYPE'] ?? '',
      PD_WORKPROFILE: json['PD_WORKPROFILE'] ?? '',
      PD_BIO: json['PD_BIO'] ?? '',
    );
  }
}

class GalleryStruct {
  final String CMB_ID;
  final String IM_CATEGORY;
  final String IM_DATE;
  final String IM_DESC;
  final String IM_ID;
  final String IM_PATH;

  GalleryStruct({
    required this.CMB_ID,
    required this.IM_CATEGORY,
    required this.IM_DATE,
    required this.IM_DESC,
    required this.IM_ID,
    required this.IM_PATH,
  });

  factory GalleryStruct.fromJson(Map<String, dynamic> json) {
    return GalleryStruct(
      CMB_ID: json['CMB_ID'] ?? '',
      IM_CATEGORY: json['IM_CATEGORY'] ?? '',
      IM_DATE: json['IM_DATE'] ?? '',
      IM_DESC: json['IM_DESC'] ?? '',
      IM_ID: json['IM_ID'] ?? '',
      IM_PATH: json['IM_PATH'] ?? '',
    );
  }
}

class OrganizationsStruct {
  final String CMB_ID;
  final String OS_BOOTHS;
  final String OS_NAME;
  final String OS_QUANTUM;
  final String OS_SUBTYPE;
  final String OS_TYPE;
  final String OS_WEBSITE;

  OrganizationsStruct({
    required this.CMB_ID,
    required this.OS_BOOTHS,
    required this.OS_NAME,
    required this.OS_QUANTUM,
    required this.OS_SUBTYPE,
    required this.OS_TYPE,
    required this.OS_WEBSITE,
  });

  factory OrganizationsStruct.fromJson(Map<String, dynamic> json) {
    return OrganizationsStruct(
      CMB_ID: json['CMB_ID'] ?? '',
      OS_BOOTHS: json['OS_BOOTHS'] ?? '',
      OS_NAME: json['OS_NAME'] ?? '',
      OS_QUANTUM: json['OS_QUANTUM'] ?? '',
      OS_SUBTYPE: json['OS_SUBTYPE'] ?? '',
      OS_TYPE: json['OS_TYPE'] ?? '',
      OS_WEBSITE: json['OS_WEBSITE'] ?? '',
    );
  }
}

class SponsorsStruct {
  final int CMB_ID;
  final String OS_BOOTHS;
  final String OS_NAME;
  final int OS_QUANTUM;
  final String OS_SUBTYPE;
  final String OS_TYPE;
  final String OS_WEBSITE;

  SponsorsStruct({
    required this.CMB_ID,
    required this.OS_BOOTHS,
    required this.OS_NAME,
    required this.OS_QUANTUM,
    required this.OS_SUBTYPE,
    required this.OS_TYPE,
    required this.OS_WEBSITE,
  });

  factory SponsorsStruct.fromJson(Map<String, dynamic> json) {
    return SponsorsStruct(
      CMB_ID: json['CMB_ID'] ?? 0,
      OS_BOOTHS: json['OS_BOOTHS'] ?? '',
      OS_NAME: json['OS_NAME'] ?? '',
      OS_QUANTUM: json['OS_QUANTUM'] ?? 0,
      OS_SUBTYPE: json['OS_SUBTYPE'] ?? '',
      OS_TYPE: json['OS_TYPE'] ?? '',
      OS_WEBSITE: json['OS_WEBSITE'] ?? '',
    );
  }
}
