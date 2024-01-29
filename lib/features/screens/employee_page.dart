import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zyloasgn/features/controller/employee_controller.dart';

import '../../models/employee_model.dart';

class EmployeePage extends ConsumerWidget {
  const EmployeePage({Key? key}) : super(key: key);

  static route() =>
      MaterialPageRoute(builder: (context) => const EmployeePage());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final employeeController = ref.watch(employeeListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee List'),
        backgroundColor: Colors.blue,
      ),
      body: employeeController.when(
        loading: () => const CircularProgressIndicator(),
        error: (error, stackTrace) => Text('Error: $error'),
        data: (employees) {
          return ListView.builder(
            itemCount: employees.length,
            itemBuilder: (context, index) {
              Employee employee = employees[index];
              bool isMoreThan5Years =
                  DateTime.now().difference(employee.joiningDate).inDays > 1825;

              return ListTile(
                title: Text(
                  employee.name,
                  style: TextStyle(
                    color: isMoreThan5Years ? Colors.white : Colors.black,
                  ),
                ),
                subtitle: Text(
                  'Joining Date: ${employee.joiningDate}',
                  style: TextStyle(
                    color: isMoreThan5Years ? Colors.white : Colors.black,
                  ),
                ),
                tileColor: isMoreThan5Years ? Colors.green : null,
              );
            },
          );
        },
      ),
    );
  }
}
