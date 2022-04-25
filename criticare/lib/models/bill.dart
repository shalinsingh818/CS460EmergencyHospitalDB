// To parse this JSON data, do
//
//     final patientBill = patientBillFromJson(jsonString);

import 'dart:convert';

PatientBill patientBillFromJson(String str) => PatientBill.fromJson(json.decode(str));

String patientBillToJson(PatientBill data) => json.encode(data.toJson());

class PatientBill {
    PatientBill({
        required this.medicationsCost,
        required this.proceduresCost,
        required this.overnightCharge,
        required this.total,
    });

    int? medicationsCost;
    int? proceduresCost;
    int? overnightCharge;
    int? total;

    factory PatientBill.fromJson(Map<String, dynamic> json) => PatientBill(
        medicationsCost: json["medications_cost"],
        proceduresCost: json["procedures_cost"],
        overnightCharge: json["overnight_charge"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "medications_cost": medicationsCost,
        "procedures_cost": proceduresCost,
        "overnight_charge": overnightCharge,
        "total": total,
    };
}
