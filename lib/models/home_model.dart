// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:shiroro_ui/models/data_model.dart';

part 'home_model.g.dart';

@JsonSerializable()
class HomeModel {
  @JsonKey(name: "status_code")
  int? status_code;

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "data")
  List<DataModel>? data;

  HomeModel();

  factory HomeModel.fromJson(Map<String, dynamic> json) =>
      _$HomeModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeModelToJson(this);
}
