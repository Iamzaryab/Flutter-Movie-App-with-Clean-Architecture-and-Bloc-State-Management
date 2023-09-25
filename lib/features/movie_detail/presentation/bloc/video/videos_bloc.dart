
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:filmku/di/Injector.dart';
import 'package:filmku/features/movie_detail/domain/use_cases/get_videos_use_case.dart';
import 'package:filmku/models/response/videos_response.dart';
import 'package:filmku/shared/util/app_exception.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:filmku/models/video.dart';

part 'videos_event.dart';

part 'videos_state.dart';

class VideosBloc extends Bloc<VideosEvent, VideosState> {
  final GetVideosUseCase _getVideosUseCase = injector.get<GetVideosUseCase>();

  VideosBloc() : super(const VideosState.initial()) {
    on<GetVideosEvent>(_getVideos);
    on<VideoIconPressedEvent>(_onVideoIconPressed);
  }

  bool get isFetching => state.state != VideosConcreteState.loading;

  void _onVideoIconPressed(VideoIconPressedEvent event, Emitter<VideosState> emit) {
    emit(state.copyWith(videoIconPressed: true));
  }

  Future<void> _getVideos(
      GetVideosEvent event, Emitter<VideosState> emit) async {
    if (isFetching) {
      emit(state.copyWith(state: VideosConcreteState.loading, isLoading: true));
      final response = await _getVideosUseCase.execute(id: event.id);
      updateStateFromVideosResponse(response, emit);
    }
  }

  void updateStateFromVideosResponse(
      Either<AppException, VideosResponse> response,
      Emitter<VideosState> emit) {
    response.fold((failure) {
      emit(state.copyWith(
          state: VideosConcreteState.failure,
          message: failure.message,
          hasData: false,
          isLoading: false));
    }, (success) {
      final videos = success.videos.map((e) => Video.fromJson(e)).toList();
      emit(state.copyWith(
          state: VideosConcreteState.loaded,
          videos: videos,
          hasData: true,
          message: videos.isNotEmpty ? 'No Videos Found' : '',
          isLoading: false));
    });
  }
}
