// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StudentDBModelAdapter extends TypeAdapter<StudentDBModel> {
  @override
  final int typeId = 0;

  @override
  StudentDBModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StudentDBModel(
      id: fields[0] as int?,
      name: fields[1] as String,
      age: fields[2] as String,
      guardian: fields[3] as String,
      contact: fields[4] as String,
      classNumber: fields[6] as String,
      division: fields[7] as String,
      image: fields[5] as Uint8List?,
    );
  }

  @override
  void write(BinaryWriter writer, StudentDBModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.age)
      ..writeByte(3)
      ..write(obj.guardian)
      ..writeByte(4)
      ..write(obj.contact)
      ..writeByte(5)
      ..write(obj.image)
      ..writeByte(6)
      ..write(obj.classNumber)
      ..writeByte(7)
      ..write(obj.division);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudentDBModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
