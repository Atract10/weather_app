import 'package:json_annotation/json_annotation.dart';

part 'popular_city_model.g.dart';

@JsonSerializable()
class PopularCityModel {
  String name;
  String assetImage;

  PopularCityModel({
    required this.name,
    required this.assetImage,
  });

  factory PopularCityModel.fromJson(Map<String, dynamic> json) =>
      _$PopularCityModelFromJson(json);

  Map<String, dynamic> toJson() => _$PopularCityModelToJson(this);
}
