// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'temperature_model.g.dart';

@JsonSerializable()
class TempModel {
  final double temp;
  final double temp_min;
  final double temp_max;
  TempModel({
    required this.temp,
    required this.temp_min,
    required this.temp_max,
  });
 
  factory TempModel.fromJson(Map<String, dynamic> json) =>
      _$TempModelFromJson(json);

  Map<String, dynamic> toJson() => _$TempModelToJson(this);
}
