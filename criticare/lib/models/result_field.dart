import 'dart:convert';

List<TestField> testFieldFromJson(String str) => List<TestField>.from(json.decode(str).map((x) => TestField.fromJson(x)));

String testFieldToJson(List<TestField> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TestField {
    TestField({
        required this.fieldId,
        required this.name,
        required this.value,
        required this.unitMeasurement,
        required this.testTypeId,
    });

    int? fieldId;
    String? name;
    int? value;
    String? unitMeasurement;
    int? testTypeId;

    factory TestField.fromJson(Map<String, dynamic> json) => TestField(
        fieldId: json["field_id"],
        name: json["name"],
        value: json["value"],
        unitMeasurement: json["unit_measurement"],
        testTypeId: json["test_type_id"],
    );

    Map<String, dynamic> toJson() => {
        "field_id": fieldId,
        "name": name,
        "value": value,
        "unit_measurement": unitMeasurement,
        "test_type_id": testTypeId,
    };
}