
import 'package:json_annotation/json_annotation.dart';
import 'country_model.dart';
import 'temperature_model.dart';
import 'weather_model.dart';

part 'city_model.g.dart';

@JsonSerializable()
class CityModel {
  final List<WeatherModel> weather;
  final TempModel main;
  final CountryModel sys;
  final String name;
  CityModel({
    required this.weather,
    required this.main,
    required this.sys,
    required this.name,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);

  Map<String, dynamic> toJson() => _$CityModelToJson(this);
}
