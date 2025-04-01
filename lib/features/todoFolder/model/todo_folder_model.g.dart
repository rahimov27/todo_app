// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_folder_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TodoFolderModelAdapter extends TypeAdapter<TodoFolderModel> {
  @override
  final int typeId = 1;

  @override
  TodoFolderModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TodoFolderModel(
      id: fields[0] as String,
      title: fields[1] as String,
      porgress: fields[3] as int,
      subtitle: fields[2] as String,
      // Считываем Color как int и преобразуем его в Color
      backgroundColor: Color(fields[4] as int),
    );
  }

  @override
  void write(BinaryWriter writer, TodoFolderModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.subtitle)
      ..writeByte(3)
      ..write(obj.porgress)
      // Записываем Color как int
      ..writeByte(4)
      ..write(obj.backgroundColor.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoFolderModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
