// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:student_app/database/db_model.dart';

// // ValueNotifier<List<StudentDBModel>> studentListNotifier = ValueNotifier([]);

// // Future<void> addStudent(StudentDBModel student) async {
// //   final box = Hive.box<StudentDBModel>('students');
// //   final dbId = await box.add(student);
// //   student.id = dbId;
// //   getStudents();
// // }

// getStudents() {
//   studentListNotifier.value =
//       Hive.box<StudentDBModel>('students').values.toList();
//   studentListNotifier.notifyListeners();
// }

// Future<void> deleteStudent(int id) async {
//   final box = Hive.box<StudentDBModel>('students');
//   await box.delete(id);
//   getStudents();
// }

// updateStudent(StudentDBModel updatedStudent) async {
//   final box = Hive.box<StudentDBModel>('students');
//   final student = box.get(updatedStudent.id);
//   if (student != null) {
//     student.name = updatedStudent.name;
//     student.age = updatedStudent.age;
//     student.guardian = updatedStudent.guardian;
//     student.contact = updatedStudent.contact;
//     student.classNumber = updatedStudent.classNumber;
//     student.division = updatedStudent.division;
//     student.image = updatedStudent.image;
//     await box.put(updatedStudent.id, student);
//     getStudents();
//   }
// }
