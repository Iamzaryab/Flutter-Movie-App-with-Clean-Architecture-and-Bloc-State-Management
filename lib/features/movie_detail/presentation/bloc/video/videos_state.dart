part of 'videos_bloc.dart';

enum VideosConcreteState { initial, loading, loaded, failure }

enum VideoPlayerState { idle, loading, loaded, playing, paused, finished }

class VideosState extends Equatable {
  final int id;
  final List<Video> videos;
  final VideoPlayerState videoPlayerState;
  final bool hasData;
  final String message;
  final bool isLoading;
  final bool videoIconPressed;
  final VideosConcreteState state;

  const VideosState({this.id = 0,
    this.videos = const [],
    this.hasData = false,
    this.message = '',
    this.isLoading = false,
    this.videoIconPressed = false,
    this.videoPlayerState = VideoPlayerState.idle,
    this.state = VideosConcreteState.initial});

  const VideosState.initial({this.id = 0,
    this.videos = const [],
    this.hasData = false,
    this.message = '',
    this.isLoading = false,
    this.videoIconPressed = false,
    this.videoPlayerState = VideoPlayerState.idle,
    this.state = VideosConcreteState.initial});

  VideosState copyWith({int? id,
    List<Video>? videos,
    bool? hasData,
    String? message,
    bool? isLoading,
    VideoPlayerState? videoPlayerState,
    bool? videoIconPressed,
    VideosConcreteState? state}) {
    return VideosState(
        id: id ?? this.id,
        videos: videos ?? this.videos,
        hasData: hasData ?? this.hasData,
        message: message ?? this.message,
        isLoading: isLoading ?? this.isLoading,
        videoPlayerState: videoPlayerState ?? this.videoPlayerState,
        videoIconPressed: videoIconPressed?? this.videoIconPressed,
        state: state ?? this.state);
  }

  @override
  List<Object?> get props => [id, videos, hasData, message, isLoading, state,videoIconPressed];
}
