// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'data_model.g.dart';

@JsonSerializable()
class DataModel {
  @JsonKey(name: "id")
  String? id;

  @JsonKey(name: "manhours_completed")
  String? manhours_completed;

  @JsonKey(name: "fatalities")
  String? fatalities;

  @JsonKey(name: "near_misses_reported")
  String? near_misses_reported;

  @JsonKey(name: "lost_time_incident")
  String? lost_time_incident;

  @JsonKey(name: "environmental_incidents")
  String? environmental_incidents;

  @JsonKey(name: "first_aid_case")
  String? first_aid_case;

  @JsonKey(name: "emergency_drills")
  String? emergency_drills;

  @JsonKey(name: "time")
  String? time;

  DataModel();

  factory DataModel.fromJson(Map<String, dynamic> json) =>
      _$DataModelFromJson(json);

  Map<String, dynamic> toJson() => _$DataModelToJson(this);
}
