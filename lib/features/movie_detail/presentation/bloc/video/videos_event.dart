part of 'videos_bloc.dart';

sealed class VideosEvent extends Equatable {
  const VideosEvent();

  @override
  List<Object?> get props => [];
}

final class GetVideosEvent extends VideosEvent {
  final int id;

  const GetVideosEvent({required this.id});
}

final class VideoIconPressedEvent extends VideosEvent {
  const VideoIconPressedEvent();
}
