// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_cities_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListCityModel _$ListCityModelFromJson(Map<String, dynamic> json) =>
    ListCityModel(
      list: (json['list'] as List<dynamic>)
          .map((e) => CityModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListCityModelToJson(ListCityModel instance) =>
    <String, dynamic>{
      'list': instance.list,
    };
