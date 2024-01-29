import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../apis/employee_api.dart'; // Make sure to adjust the import path based on your project structure
import '../../models/employee_model.dart';

final employeeListProvider = FutureProvider((ref) async {
  return EmployeeController(ref.watch(employeeAPIProvider)).fetchEmployees();
});
class EmployeeController  {
  final EmployeeApi _employeeApi;

  EmployeeController(this._employeeApi);

  Future<List<Employee>> fetchEmployees() async {
      final employees = await _employeeApi.getEmployees(); // Assuming a method named getEmployees in your EmployeeApi
      List<Employee> employeeList = [];
      for(final employee in employees){
        final parsedEmployee = Employee.fromJson(employee.data);
        employeeList.add(parsedEmployee);
      }
      return employeeList;
  }

}
