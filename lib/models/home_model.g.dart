// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeModel _$HomeModelFromJson(Map<String, dynamic> json) => HomeModel()
  ..status_code = json['status_code'] as int?
  ..message = json['message'] as String?
  ..data = (json['data'] as List<dynamic>?)
      ?.map((e) => DataModel.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$HomeModelToJson(HomeModel instance) => <String, dynamic>{
      'status_code': instance.status_code,
      'message': instance.message,
      'data': instance.data,
    };
