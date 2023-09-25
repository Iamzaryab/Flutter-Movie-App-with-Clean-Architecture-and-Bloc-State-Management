// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Video _$$_VideoFromJson(Map<String, dynamic> json) => _$_Video(
      name: json['name'] as String? ?? '',
      key: json['key'] as String? ?? '',
      site: json['site'] as String? ?? '',
      size: json['size'] as int? ?? 0,
      type: json['type'] as String? ?? '',
      id: json['id'] as String? ?? '',
      publishedAt: json['published_at'] as String? ?? '',
    );

Map<String, dynamic> _$$_VideoToJson(_$_Video instance) => <String, dynamic>{
      'name': instance.name,
      'key': instance.key,
      'site': instance.site,
      'size': instance.size,
      'type': instance.type,
      'id': instance.id,
      'published_at': instance.publishedAt,
    };
