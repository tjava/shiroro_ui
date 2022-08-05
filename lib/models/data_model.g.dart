// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataModel _$DataModelFromJson(Map<String, dynamic> json) => DataModel()
  ..id = json['id'] as String?
  ..manhours_completed = json['manhours_completed'] as String?
  ..fatalities = json['fatalities'] as String?
  ..near_misses_reported = json['near_misses_reported'] as String?
  ..lost_time_incident = json['lost_time_incident'] as String?
  ..environmental_incidents = json['environmental_incidents'] as String?
  ..first_aid_case = json['first_aid_case'] as String?
  ..emergency_drills = json['emergency_drills'] as String?
  ..time = json['time'] as String?;

Map<String, dynamic> _$DataModelToJson(DataModel instance) => <String, dynamic>{
      'id': instance.id,
      'manhours_completed': instance.manhours_completed,
      'fatalities': instance.fatalities,
      'near_misses_reported': instance.near_misses_reported,
      'lost_time_incident': instance.lost_time_incident,
      'environmental_incidents': instance.environmental_incidents,
      'first_aid_case': instance.first_aid_case,
      'emergency_drills': instance.emergency_drills,
      'time': instance.time,
    };
