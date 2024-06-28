// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dummy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DummyImpl _$$DummyImplFromJson(Map<String, dynamic> json) => _$DummyImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['first_name'] as String?,
      location: json['location'] as String?,
      age: (json['age'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$DummyImplToJson(_$DummyImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.name,
      'location': instance.location,
      'age': instance.age,
    };
