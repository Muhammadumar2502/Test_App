// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_local_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LoginLocalAdapter extends TypeAdapter<LoginLocal> {
  @override
  final int typeId = 0;

  @override
  LoginLocal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LoginLocal(
      id: fields[0] as int?,
      email: fields[1] as String?,
      nickname: fields[2] as String?,
      refreshToken: fields[4] as String?,
      accessToken: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, LoginLocal obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.nickname)
      ..writeByte(3)
      ..write(obj.accessToken)
      ..writeByte(4)
      ..write(obj.refreshToken);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginLocalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
