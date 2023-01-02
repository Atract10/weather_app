// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temperature_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TempModel _$TempModelFromJson(Map<String, dynamic> json) => TempModel(
      temp: (json['temp'] as num).toDouble(),
      temp_min: (json['temp_min'] as num).toDouble(),
      temp_max: (json['temp_max'] as num).toDouble(),
    );

Map<String, dynamic> _$TempModelToJson(TempModel instance) => <String, dynamic>{
      'temp': instance.temp,
      'temp_min': instance.temp_min,
      'temp_max': instance.temp_max,
    };
