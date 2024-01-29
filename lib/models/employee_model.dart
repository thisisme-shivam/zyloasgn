import 'package:flutter/cupertino.dart';

@immutable
class Employee {
  final String name;
  final DateTime joiningDate;

  const Employee({
    required this.name,
    required this.joiningDate,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      name: json['name']??'',
      joiningDate: DateTime.fromMillisecondsSinceEpoch(json['joiningDate']),
    );
  }
}
