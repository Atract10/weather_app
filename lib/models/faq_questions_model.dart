import 'package:json_annotation/json_annotation.dart';

part 'faq_questions_model.g.dart';

@JsonSerializable()
class FaqModel {
  String question;
  String text;

  FaqModel({
    required this.question,
    required this.text,
  });

  factory FaqModel.fromJson(Map<String, dynamic> json) =>
      _$FaqModelFromJson(json);

  Map<String, dynamic> toJson() => _$FaqModelToJson(this);
}
