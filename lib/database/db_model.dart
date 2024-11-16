import 'dart:typed_data';

import 'package:hive/hive.dart';
part 'db_model.g.dart';

@HiveType(typeId: 0)
class StudentDBModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String age;
  @HiveField(3)
  String guardian;
  @HiveField(4)
  String contact;
  @HiveField(5)
  Uint8List? image;
  @HiveField(6)
  String classNumber;
  @HiveField(7)
  String division;

  StudentDBModel({
    this.id,
    required this.name,
    required this.age,
    required this.guardian,
    required this.contact,
    required this.classNumber,
    required this.division,
    this.image,
  });
}
