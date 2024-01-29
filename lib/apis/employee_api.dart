
import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as model;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/appwrite_constants.dart';
import '../core/providers.dart';


final employeeAPIProvider = Provider((ref) {
  return EmployeeApi(db:ref.watch(appwriteDatabaseProvider));
});

class EmployeeApi {
  final Databases _db;

  EmployeeApi({required Databases db}) : _db = db;
  
  Future<List<model.Document>> getEmployees() async {
    final documents = await _db.listDocuments(
        databaseId: AppwriteConstants.databaseId,
        collectionId: AppwriteConstants.employeesCollection,
    );
    return documents.documents;
  }
}
