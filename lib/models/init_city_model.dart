import 'package:json_annotation/json_annotation.dart';


part 'init_city_model.g.dart';

@JsonSerializable()
class InitCityModel {
  final String city;
  InitCityModel({
    required this.city,
    
  });

  factory InitCityModel.fromJson(Map<String, dynamic> json) =>
      _$InitCityModelFromJson(json);

  Map<String, dynamic> toJson() => _$InitCityModelToJson(this);
}
