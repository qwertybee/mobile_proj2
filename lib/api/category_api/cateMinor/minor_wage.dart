// To parse this JSON data, do
//
//     final minorWage = minorWageFromJson(jsonString);

import 'dart:convert';

MinorWage minorWageFromJson(String str) => MinorWage.fromJson(json.decode(str));

String minorWageToJson(MinorWage data) => json.encode(data.toJson());

class MinorWage {
  MinorWage({
    required this.data,
    required this.source,
  });

  List<Datum> data;
  List<Source> source;

  factory MinorWage.fromJson(Map<String, dynamic> json) => MinorWage(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    source: List<Source>.from(json["source"].map((x) => Source.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "source": List<dynamic>.from(source.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.idMinorOccupationGroup,
    required this.minorOccupationGroup,
    required this.idYear,
    required this.year,
    required this.idWorkforceStatus,
    required this.workforceStatus,
    required this.averageWage,
    required this.averageWageAppxMoe,
    required this.recordCount,
    required this.slugMinorOccupationGroup,
  });

  String idMinorOccupationGroup;
  String minorOccupationGroup;
  int idYear;
  String year;
  bool idWorkforceStatus;
  String workforceStatus;
  double averageWage;
  double averageWageAppxMoe;
  int recordCount;
  String slugMinorOccupationGroup;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    idMinorOccupationGroup: json["ID Minor Occupation Group"],
    minorOccupationGroup: json["Minor Occupation Group"],
    idYear: json["ID Year"],
    year: json["Year"],
    idWorkforceStatus: json["ID Workforce Status"],
    workforceStatus: json["Workforce Status"],
    averageWage: json["Average Wage"].toDouble(),
    averageWageAppxMoe: json["Average Wage Appx MOE"].toDouble(),
    recordCount: json["Record Count"],
    slugMinorOccupationGroup: json["Slug Minor Occupation Group"] == null ? null : json["Slug Minor Occupation Group"],
  );

  Map<String, dynamic> toJson() => {
    "ID Minor Occupation Group": idMinorOccupationGroup,
    "Minor Occupation Group": minorOccupationGroup,
    "ID Year": idYear,
    "Year": year,
    "ID Workforce Status": idWorkforceStatus,
    "Workforce Status": workforceStatus,
    "Average Wage": averageWage,
    "Average Wage Appx MOE": averageWageAppxMoe,
    "Record Count": recordCount,
    "Slug Minor Occupation Group": slugMinorOccupationGroup == null ? null : slugMinorOccupationGroup,
  };
}

class Source {
  Source({
    required this.measures,
    required this.annotations,
    required this.name,
    required this.substitutions,
  });

  List<String> measures;
  Annotations annotations;
  String name;
  List<dynamic> substitutions;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
    measures: List<String>.from(json["measures"].map((x) => x)),
    annotations: Annotations.fromJson(json["annotations"]),
    name: json["name"],
    substitutions: List<dynamic>.from(json["substitutions"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "measures": List<dynamic>.from(measures.map((x) => x)),
    "annotations": annotations.toJson(),
    "name": name,
    "substitutions": List<dynamic>.from(substitutions.map((x) => x)),
  };
}

class Annotations {
  Annotations({
    required this.sourceName,
    required this.sourceDescription,
    required this.datasetName,
    required this.datasetLink,
    required this.subtopic,
    required this.tableId,
    required this.topic,
    required this.hiddenMeasures,
  });

  String sourceName;
  String sourceDescription;
  String datasetName;
  String datasetLink;
  String subtopic;
  String tableId;
  String topic;
  String hiddenMeasures;

  factory Annotations.fromJson(Map<String, dynamic> json) => Annotations(
    sourceName: json["source_name"],
    sourceDescription: json["source_description"],
    datasetName: json["dataset_name"],
    datasetLink: json["dataset_link"],
    subtopic: json["subtopic"],
    tableId: json["table_id"],
    topic: json["topic"],
    hiddenMeasures: json["hidden_measures"],
  );

  Map<String, dynamic> toJson() => {
    "source_name": sourceName,
    "source_description": sourceDescription,
    "dataset_name": datasetName,
    "dataset_link": datasetLink,
    "subtopic": subtopic,
    "table_id": tableId,
    "topic": topic,
    "hidden_measures": hiddenMeasures,
  };
}
