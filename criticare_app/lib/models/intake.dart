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
        required this.admitted,
        required this.discharge,
        required this.dateCreated,
        required this.ambulance,
        required this.dischargeId,
    });

    int? intakeId;
    int? patientId;
    String? bloodPressure;
    String? notes;
    dynamic? admitted;
    dynamic? discharge;
    DateTime? dateCreated;
    dynamic? ambulance;
    dynamic? dischargeId;

    factory Intake.fromJson(Map<String, dynamic> json) => Intake(
        intakeId: json["intake_id"],
        patientId: json["patient_id"],
        bloodPressure: json["blood_pressure"],
        notes: json["notes"],
        admitted: json["admitted"],
        discharge: json["discharge"],
        dateCreated: DateTime.parse(json["date_created"]),
        ambulance: json["ambulance"],
        dischargeId: json["discharge_id"],
    );

    Map<String, dynamic> toJson() => {
        "intake_id": intakeId,
        "patient_id": patientId,
        "blood_pressure": bloodPressure,
        "notes": notes,
        "admitted": admitted,
        "discharge": discharge,
        "date_created": "${dateCreated?.year.toString().padLeft(4, '0')}-${dateCreated?.month.toString().padLeft(2, '0')}-${dateCreated?.day.toString().padLeft(2, '0')}",
        "ambulance": ambulance,
        "discharge_id": dischargeId,
    };
}
