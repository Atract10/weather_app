import 'package:json_annotation/json_annotation.dart';
import 'city_model.dart';

part 'list_cities_model.g.dart';

@JsonSerializable()
class ListCityModel {
  final List<CityModel> list;
  ListCityModel({
    required this.list,
    
  });

  factory ListCityModel.fromJson(Map<String, dynamic> json) =>
      _$ListCityModelFromJson(json);

  Map<String, dynamic> toJson() => _$ListCityModelToJson(this);
}
