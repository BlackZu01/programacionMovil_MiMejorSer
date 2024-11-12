// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usersdb.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserdbAdapter extends TypeAdapter<Userdb> {
  @override
  final int typeId = 0;

  @override
  Userdb read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Userdb(
      name: fields[0] as String,
      email: fields[1] as String,
      password: fields[2] as String,
      pts: fields[3] as int,
      startdate: fields[4] as DateTime,
      tasks: (fields[5] as List).cast<Taskdb>(),
      goals: (fields[6] as List).cast<Goaldb>(),
      days: (fields[7] as List).cast<DateTime>(),
      lastday: fields[8] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Userdb obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.password)
      ..writeByte(3)
      ..write(obj.pts)
      ..writeByte(4)
      ..write(obj.startdate)
      ..writeByte(5)
      ..write(obj.tasks)
      ..writeByte(6)
      ..write(obj.goals)
      ..writeByte(7)
      ..write(obj.days)
      ..writeByte(8)
      ..write(obj.lastday);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserdbAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TaskdbAdapter extends TypeAdapter<Taskdb> {
  @override
  final int typeId = 1;

  @override
  Taskdb read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Taskdb(
      id: fields[0] as int,
      name: fields[1] as String,
      goal: fields[2] as String,
      pts: fields[3] as int,
      counter: fields[4] as int,
      state: fields[5] as bool,
      list: (fields[6] as List).cast<String>(),
      goalCounter: fields[7] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Taskdb obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.goal)
      ..writeByte(3)
      ..write(obj.pts)
      ..writeByte(4)
      ..write(obj.counter)
      ..writeByte(5)
      ..write(obj.state)
      ..writeByte(6)
      ..write(obj.list)
      ..writeByte(7)
      ..write(obj.goalCounter);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskdbAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class GoaldbAdapter extends TypeAdapter<Goaldb> {
  @override
  final int typeId = 2;

  @override
  Goaldb read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Goaldb(
      id: fields[0] as int,
      goal: fields[1] as int,
      list: (fields[2] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Goaldb obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.goal)
      ..writeByte(2)
      ..write(obj.list);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GoaldbAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
