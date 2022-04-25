// To parse this JSON data, do
//
//     final testResults = testResultsFromJson(jsonString);

import 'dart:convert';

List<TestResults> testResultsFromJson(String str) => List<TestResults>.from(json.decode(str).map((x) => TestResults.fromJson(x)));

String testResultsToJson(List<TestResults> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TestResults {
    TestResults({
        required this.testId,
        required this.name,
        required this.patientIntakeId,
    });

    int? testId;
    String? name;
    int? patientIntakeId;

    factory TestResults.fromJson(Map<String, dynamic> json) => TestResults(
        testId: json["test_id"],
        name: json["name"],
        patientIntakeId: json["patient_intake_id"],
    );

    Map<String, dynamic> toJson() => {
        "test_id": testId,
        "name": name,
        "patient_intake_id": patientIntakeId,
    };
}