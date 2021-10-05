// To parse this JSON data, do
//
//     final allExpirationModelClass = allExpirationModelClassFromJson(jsonString);

import 'dart:convert';

AllExpirationModelClass allExpirationModelClassFromJson(String str) =>
    AllExpirationModelClass.fromJson(json.decode(str));

String allExpirationModelClassToJson(AllExpirationModelClass data) =>
    json.encode(data.toJson());

class AllExpirationModelClass {
  AllExpirationModelClass({
    this.status,
    this.message,
    this.data,
  });

  bool status;
  String message;
  List<Datum> data;

  factory AllExpirationModelClass.fromJson(Map<String, dynamic> json) =>
      AllExpirationModelClass(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.expireId,
    this.expireTitle,
    this.category,
    this.startDate,
    this.endDate,
    this.totalDays,
    this.remainingDays,
    this.status,
    this.notee,
    this.download,
    this.private,
    this.archive,
    this.branch,
  });

  int id;
  String expireId;
  String expireTitle;
  Category category;
  DateTime startDate;
  DateTime endDate;
  String totalDays;
  String remainingDays;
  Status status;
  String notee;
  String download;
  String private;
  String archive;
  Branch branch;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        expireId: json["expire_id"],
        expireTitle: json["expire_title"],
        category: categoryValues.map[json["category"]],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
        totalDays: json["total_days"],
        remainingDays: json["remaining_days"],
        status: statusValues.map[json["status"]],
        notee: json["notee"],
        download: json["download"],
        private: json["private"],
        archive: json["archive"],
        branch: branchValues.map[json["branch"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "expire_id": expireId,
        "expire_title": expireTitle,
        "category": categoryValues.reverse[category],
        "start_date":
            "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "end_date":
            "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
        "total_days": totalDays,
        "remaining_days": remainingDays,
        "status": statusValues.reverse[status],
        "notee": notee,
        "download": download,
        "private": private,
        "archive": archive,
        "branch": branchValues.reverse[branch],
      };
}

enum Branch { GRAM_B1, LALOCA_B2, LALOCA_B1, WAVE, ALBAK, GRAM_B2, CASUAL }

final branchValues = EnumValues({
  "ALBAK": Branch.ALBAK,
  "Casual": Branch.CASUAL,
  "Gram b1": Branch.GRAM_B1,
  "Gram B2": Branch.GRAM_B2,
  "Laloca B1": Branch.LALOCA_B1,
  "Laloca B2": Branch.LALOCA_B2,
  "WAVE": Branch.WAVE
});

enum Category { CHEQUE, TENANCY, PASSPORT, LABOR_CARD, ID, TRADE_LICENSE }

final categoryValues = EnumValues({
  "Cheque": Category.CHEQUE,
  "ID": Category.ID,
  "Labor Card": Category.LABOR_CARD,
  "Passport": Category.PASSPORT,
  "Tenancy ": Category.TENANCY,
  "Trade License": Category.TRADE_LICENSE
});

enum Status { EXPIRE_VERY_SOON, EXPIRE_SOON, ACTIVE, OVERDUE }

final statusValues = EnumValues({
  "Active": Status.ACTIVE,
  "Expire Soon": Status.EXPIRE_SOON,
  "Expire Very Soon": Status.EXPIRE_VERY_SOON,
  "Overdue": Status.OVERDUE
});

class EnumValues<T> {
  Map<String, T> map;

  EnumValues(this.map);

  Map<T, String> get reverse {
    Map<T, String> reverseMap;
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
