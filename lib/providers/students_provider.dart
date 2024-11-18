import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:student_app/database/db_model.dart';

class StudentsProvider with ChangeNotifier {
  Box<StudentDBModel> studentBox = Hive.box<StudentDBModel>('students');

  List<StudentDBModel> get students => studentBox.values.toList();

  void addStudent(StudentDBModel student) async {
    final id = await studentBox.add(student);
    student.id = id;
    notifyListeners();
  }

  void updateStudent(StudentDBModel updateStudent) {
    final id = updateStudent.id;
    studentBox.put(id, updateStudent);
    notifyListeners();
  }

  void deleteStudent(int id) async {
    await studentBox.delete(id);
    notifyListeners();
  }

  StudentDBModel? getStudent(String id) => studentBox.get(id);
}
