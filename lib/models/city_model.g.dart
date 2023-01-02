// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityModel _$CityModelFromJson(Map<String, dynamic> json) => CityModel(
      weather: (json['weather'] as List<dynamic>)
          .map((e) => WeatherModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      main: TempModel.fromJson(json['main'] as Map<String, dynamic>),
      sys: CountryModel.fromJson(json['sys'] as Map<String, dynamic>),
      name: json['name'] as String,
    );

Map<String, dynamic> _$CityModelToJson(CityModel instance) => <String, dynamic>{
      'weather': instance.weather,
      'main': instance.main,
      'sys': instance.sys,
      'name': instance.name,
    };
