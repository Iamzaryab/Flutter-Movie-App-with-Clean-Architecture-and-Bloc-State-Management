import 'package:freezed_annotation/freezed_annotation.dart';

part 'video.freezed.dart';

part 'video.g.dart';

@freezed
class Video with _$Video {
  @JsonSerializable(explicitToJson: true)
  const factory Video(
      {@JsonKey(name: 'name') @Default('') String name,
      @JsonKey(name: 'key') @Default('') String key,
      @JsonKey(name: 'site') @Default('') String site,
      @JsonKey(name: 'size') @Default(0) int size,
      @JsonKey(name: 'type') @Default('') String type,
      @JsonKey(name: 'id') @Default('') String id,
      @JsonKey(name: 'published_at') @Default('') String publishedAt}) = _Video;

  factory Video.fromJson(Map<String, dynamic> json) => _$VideoFromJson(json);
}
