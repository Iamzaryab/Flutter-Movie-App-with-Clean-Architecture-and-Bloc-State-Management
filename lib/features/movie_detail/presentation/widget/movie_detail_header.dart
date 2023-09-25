import 'package:avatar_glow/avatar_glow.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:filmku/features/movie_detail/presentation/bloc/video/videos_bloc.dart';
import 'package:filmku/shared/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:filmku/app/app_colors.dart';
import 'package:filmku/app/app_dimens.dart';
import 'package:filmku/models/movie_detail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import 'package:filmku/app/app_configs.dart';

class MovieDetailHeader extends StatelessWidget {
  final MovieDetail movieDetail;

  const MovieDetailHeader({Key? key, required this.movieDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideosBloc, VideosState>(builder: (context, state) {
      return SliverAppBar(
        expandedHeight: AppDimens.movieDetailBackdropHeight,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.primaryLight,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_horiz),
            color: AppColors.primaryLight,
          )
        ],
        stretch: true,
        pinned: false,
        floating: true,
        flexibleSpace: FlexibleSpaceBar(
            stretchModes: const [
              StretchMode.zoomBackground,
              StretchMode.blurBackground
            ],
            centerTitle: true,
            title: !state.videoIconPressed
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AvatarGlow(
                          endRadius: 30.sp,
                          child: InkWell(
                            onTap: () {
                              context
                                  .read<VideosBloc>()
                                  .add(const VideoIconPressedEvent());
                            },
                            child: const Icon(
                              Icons.play_circle,
                              size: 30,
                            ),
                          )),
                      Text(
                        'Play Trailer',
                        style: context.textTheme.titleSmall!
                            .copyWith(color: Colors.white),
                      )
                    ],
                  )
                : const SizedBox.shrink(),
            background: state.videoIconPressed
                ? _playYoutubeVideo(state)
                : _showBackdrop()),
      );
    });
  }

  Widget _playYoutubeVideo(VideosState state) {
    late YoutubePlayerController controller =
        YoutubePlayerController.fromVideoId(
      videoId: state.videos.firstWhere((video) => video.type == 'Trailer').key,
      autoPlay: true,
      params: const YoutubePlayerParams(showFullscreenButton: true,showControls: false,enableCaption:false,showVideoAnnotations: false,enableJavaScript: false),
    );
    return YoutubePlayer(
      controller: controller,
      aspectRatio: 16 / 9,
    );
  }

  Widget _showBackdrop() {
    return CachedNetworkImage(
      imageUrl: AppConfigs.preMovieBackdrop(movieDetail.backdropPath),
      placeholder: (context, url) =>
          const Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => const Icon(Icons.broken_image),
      fit: BoxFit.cover,
    );
  }

  Widget _showVideoIcon(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 50,
          left: 0,
          child: AvatarGlow(
              endRadius: 40.sp,
              child: InkWell(
                onTap: () {
                  context.read<VideosBloc>().add(const VideoIconPressedEvent());
                },
                child: const Icon(
                  Icons.play_circle,
                  size: 30,
                ),
              )),
        ),
        Positioned(
            top: 100,
            left: 0,
            child: Text(
              'Play Trailer',
              style: context.textTheme.bodyMedium,
            ))
      ],
    );
  }
}
