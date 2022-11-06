// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alarm.model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AlarmAdapter extends TypeAdapter<Alarm> {
  @override
  final int typeId = 0;

  @override
  Alarm read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Alarm(
      name: fields[0] as String?,
      time: fields[1] as String?,
      enabled: fields[2] as bool?,
      vibrateOn: fields[4] as bool?,
      days: (fields[3] as List?)?.cast<DayModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, Alarm obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.time)
      ..writeByte(2)
      ..write(obj.enabled)
      ..writeByte(3)
      ..write(obj.days)
      ..writeByte(4)
      ..write(obj.vibrateOn);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AlarmAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
