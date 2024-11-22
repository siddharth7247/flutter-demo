import 'dart:convert';
import 'package:flutter_demo/models/employeeModel.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static final DatabaseService instance = DatabaseService._constructor();
  DatabaseService._constructor();

  static Database? _db;
  static const String tableName = "employees";

  Future<Database> get database async {
    if (_db != null) {
      return _db!;
    } else {
      _db = await getDatabase();
      return _db!;
    }
  }

  Future<Database> getDatabase() async {
    final dataBasePath = await getDatabasesPath();
    final path = '$dataBasePath/employees.db';
    final database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute(
            "CREATE TABLE $tableName (id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT NOT NULL,email TEXT NOT NULL,address TEXT NOT NULL,phoneNo INTEGER)");
      },
    );
    return database;
  }

  void addEmployee(Employee employee) async {
    final db = await database;
    //converting employee object to json string and then passing it to jsonDecode so it convert it to map
    await db.insert(tableName, jsonDecode(jsonEncode(employee)));
  }

  Future<List<Employee>> getAllEmployee() async {
    final db = await database;
    final emp = await db.query(tableName);
    List<Employee> empList = emp.map((json) => Employee.fromJson(json)).toList();
    return empList;
  }

  void updateEmployee(Employee employee)async{
    final db = await database;
    await db.update(tableName , where: 'id = ?', jsonDecode(jsonEncode(employee)),whereArgs: [employee.id]);
  }

  void deleteEmloyee(int id)async{
    final db = await database;
    await db.delete(tableName,where: 'id = ?',whereArgs: [id]); 
  }
}
