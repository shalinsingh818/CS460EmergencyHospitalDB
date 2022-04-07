// To parse this JSON data, do
//
//     final intake = intakeFromJson(jsonString);

import 'dart:convert';

List<Intake> intakeFromJson(String str) => List<Intake>.from(json.decode(str).map((x) => Intake.fromJson(x)));

String intakeToJson(List<Intake> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Intake {
    Intake({
        required this.intakeId,
        required this.patientId,
        required this.bloodPressure,
        required this.notes,
        required this.dateCreated,
    });

    int? intakeId;
    String? patientId;
    String? bloodPressure;
    DateTime? notes;
    int? dateCreated;

    factory Intake.fromJson(Map<String, dynamic> json) => Intake(
        intakeId: json["intake_id"],
        patientId: json["patient_id"],
        bloodPressure: json["blood_pressure"],
        notes: DateTime.parse(json["notes"]),
        dateCreated: json["date_created"],
    );

    Map<String, dynamic> toJson() => {
        "intake_id": intakeId,
        "patient_id": patientId,
        "blood_pressure": bloodPressure,
        "notes": "${notes.year.toString().padLeft(4, '0')}-${notes.month.toString().padLeft(2, '0')}-${notes.day.toString().padLeft(2, '0')}",
        "date_created": dateCreated,
    };
}
