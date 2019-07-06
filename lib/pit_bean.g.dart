// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pit_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PitBean _$PitBeanFromJson(Map<String, dynamic> json) {
  return PitBean(json['locale'] as String, json['country'] as String,
      json['string'] as String);
}

Map<String, dynamic> _$PitBeanToJson(PitBean instance) => <String, dynamic>{
      'locale': instance.locale,
      'country': instance.country,
      'string': instance.string
    };
